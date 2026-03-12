const fs = require('fs-extra');
const path = require('path');
const ejs = require('ejs');
const config = require('./config');
const firestore = require('./services/firestore');
const storage = require('./services/storage');
const generator = require('./services/generator');
const sitemap = require('./services/sitemap');

const DIST_DIR = '/tmp/dist';

async function processSingleFile(relativePath, content) {
    const fullPath = path.join(DIST_DIR, relativePath);
    await fs.ensureDir(path.dirname(fullPath));
    await fs.writeFile(fullPath, content);

    const contentType = relativePath.endsWith('.xml') ? 'application/xml' : 'text/html';
    
    // Retry with exponential backoff (3 attempts)
    for (let attempt = 1; attempt <= 3; attempt++) {
        try {
            await storage.uploadFile(fullPath, relativePath, contentType);
            break; // Success
        } catch (e) {
            if (attempt === 3) {
                console.error(`❌ Upload FAILED after 3 attempts: ${relativePath}`);
                throw e; // Re-throw on final failure
            }
            const baseDelay = Math.pow(2, attempt) * 1000;
            const jitter = Math.random() * 1000;
            const delay = baseDelay + jitter;
            console.error(`⚠️ Upload failed (attempt ${attempt}/3) for ${relativePath}, retrying in ${Math.round(delay)}ms...`);
            await new Promise(r => setTimeout(r, delay));
        }
    }
    
    await fs.remove(fullPath);
}

async function main() {
    console.time('Execution Time');
    console.log('🚀 [Orchestrator] Starting The Great Archive Job (Chunked Stream Mode)...');

    try {
        await fs.emptyDir(DIST_DIR); 

        let catalog = await storage.getCatalog();
        let targetIds = await firestore.getDocumentsToProcess(); 

        if (targetIds.length === 0 && config.MODE !== 'FULL_REBUILD') {
            console.log('💤 [Orchestrator] No new documents. Exiting.');
            return; 
        }
        
        if (targetIds.length === 0 && config.MODE === 'FULL_REBUILD') {
            console.log('⚠️ [Orchestrator] No new bills, but FULL_REBUILD mode - regenerating hubs/sitemaps...');
            // Catalog już został załadowany, więc możemy kontynuować
        }

        // --- KONFIGURACJA BATCHA ---
        if (config.BATCH_LIMIT && targetIds.length > config.BATCH_LIMIT) {
            console.warn(`⚠️ [SAFETY] Batch limit active! Processing ${config.BATCH_LIMIT} of ${targetIds.length} docs.`);
            targetIds = targetIds.slice(0, config.BATCH_LIMIT);
        }

        const allDocs = await firestore.fetchFullDocuments(targetIds);
        
        // --- TARCZA: OPERACJA SALAMI (CHUNKING) ---
        const CHUNK_SIZE = 100; // 100 ustaw * 8 jęz = 800 plików w RAM (Bezpiecznie)
        console.log(`🔪 [Orchestrator] Slicing ${allDocs.length} docs into chunks of ${CHUNK_SIZE}...`);

        for (let i = 0; i < allDocs.length; i += CHUNK_SIZE) {
            const chunkDocs = allDocs.slice(i, i + CHUNK_SIZE);
            const chunkIndex = Math.floor(i / CHUNK_SIZE) + 1;
            const totalChunks = Math.ceil(allDocs.length / CHUNK_SIZE);

            console.log(`🔨 [Chunk ${chunkIndex}/${totalChunks}] Generating bills...`);
            
            const generatedData = await generator.generateBills(chunkDocs);
            const billFiles = generatedData.outputFiles;
            const catalogUpdates = generatedData.catalogUpdates;

            console.log(`⚡ [Chunk ${chunkIndex}/${totalChunks}] Uploading ${billFiles.length} files (Parallel)...`);
            
            // TARCZA: TURBO MODE (Bills)
            const UPLOAD_CONCURRENCY = 20; 
            for (let j = 0; j < billFiles.length; j += UPLOAD_CONCURRENCY) {
                const batch = billFiles.slice(j, j + UPLOAD_CONCURRENCY);
                await Promise.all(batch.map(file => processSingleFile(file.path, file.content)));
            }

            console.log(`📘 [Chunk ${chunkIndex}/${totalChunks}] Updating catalog memory...`);
            catalogUpdates.forEach(update => {
                const index = catalog.findIndex(item => item.id === update.id);
                if (index > -1) catalog[index] = update;
                else catalog.push(update);
            });

            billFiles.length = 0;
            if (global.gc) { global.gc(); } 
        }

        console.log('✅ [Orchestrator] All bills processed.');
        
        catalog.sort((a, b) => new Date(b.date) - new Date(a.date));

        // 2 & 3. GENEROWANIE HUBÓW (TERMS & TOPICS)
        if (config.MODE === 'FULL_REBUILD') {
            console.log('🗂️ [Stream] Generating Hubs (Terms & Topics)...');
            
            // TARCZA: Przekazujemy logikę uploadu jako callback (RAM Protection)
            await generator.generateHubs(catalog, async (batchFiles) => {
                console.log(`📤 [Hubs] Uploading batch of ${batchFiles.length} files...`);
                await Promise.all(batchFiles.map(f => processSingleFile(f.path, f.content)));
                await new Promise(r => setTimeout(r, 300));
            });
        } else {
            console.log('⏭️ [Orchestrator] Skipping Hubs (BILLS_ONLY mode)');
        }
        // 4. SITEMAPS
        if (config.MODE === 'FULL_REBUILD') {
            console.log('🗺️ [Stream] Uploading Sitemaps...');
            const sitemapFiles = sitemap.generateSitemaps(catalog);
            for (const file of sitemapFiles) {
                await processSingleFile(file.path, file.content);
            }
        } else {
            console.log('⏭️ [Orchestrator] Skipping Sitemaps (BILLS_ONLY mode)');
        }

        // 5. UPDATE CATALOG
        console.log('📘 [Orchestrator] Saving Catalog...');
        await storage.saveCatalog(catalog);
        await firestore.markAsGenerated(targetIds);

        console.log('✅ [Orchestrator] Job completed successfully.');
        console.timeEnd('Execution Time');

    } catch (error) {
        console.error('❌ [Orchestrator] FATAL ERROR:', error);
        process.exit(1);
    }
}

main();