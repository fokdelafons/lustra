const fs = require('fs-extra');
const path = require('path');
const ejs = require('ejs');
const config = require('./config');
const firestore = require('./services/firestore');
const storage = require('./services/storage');
const generator = require('./services/generator');
const sitemap = require('./services/sitemap');
const { buildHubUrl, buildBillUrl, buildTopicUrl } = require('./utils/url-builder');

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

        // TARCZA: Deklaracja zmiennych przed blokami if (scope fix)
        let hubTemplate = null;
        const filesQueue = []; // ZMIANA NAZWY: To teraz kolejka danych, nie promisów
        const ITEMS_PER_PAGE = 20;

        // 2. GENEROWANIE HUBÓW (TERMS)
        if (config.MODE === 'FULL_REBUILD') {
            console.log('🗂️ [Stream] Generating & Uploading Hub Pages...');
            const hubTemplateStr = await fs.readFile(path.join(__dirname, 'templates/hub.ejs'), 'utf8');
            hubTemplate = ejs.compile(hubTemplateStr);

        const billsByTerm = {};
        catalog.forEach(item => {
            const t = item.term || config.URL_PREFIX.term || 'unknown';
            if (!billsByTerm[t]) billsByTerm[t] = [];
            billsByTerm[t].push(item);
        });

        for (const [term, termBills] of Object.entries(billsByTerm)) {
            if (term === 'unknown') continue;

            for (const lang of config.LANGUAGES) {
                const instName = config.LABELS.INSTITUTION[config.URL_PREFIX.institution][lang];
                const totalPages = Math.ceil(termBills.length / ITEMS_PER_PAGE);
                
                for (let i = 0; i < totalPages; i++) {
                    const currentPage = i + 1;
                    const chunk = termBills.slice(i * ITEMS_PER_PAGE, (i + 1) * ITEMS_PER_PAGE);
                    
                    const billsForView = chunk.map(item => ({
                        id: item.id,
                        title: item.title || item.id,
                        date: new Date(item.date).toLocaleDateString(lang),
                        url: buildBillUrl(lang, item.id, item.term || term),
                    }));

                    const html = hubTemplate({
                        lang: lang,
                        term: term,
                        currentPage: currentPage,
                        totalPages: totalPages,
                        bills: billsForView,
                        pageTitle: `${instName} (${term} Term)`,
                        subTitle: "Legislative Database",
                        prevPageUrl: currentPage > 1 ? buildHubUrl(lang, term, currentPage - 1) : null,
                        nextPageUrl: currentPage < totalPages ? buildHubUrl(lang, term, currentPage + 1) : null,
                        prevTermUrl: null,
                        nextTermUrl: null
                    });

                    let fileName = currentPage === 1 ? 'index.html' : `page-${currentPage}.html`;
                    let relativePath = `${lang}/${config.URL_PREFIX.institution}/${term}/${fileName}`;
                    
                    // 1. TYLKO KOLEJKUJEMY DANE
                    filesQueue.push({ path: relativePath, content: html });
                }
            }
            
            // 2. DOPIERO TERAZ ROBIMY WYKON (Batch Execution)
            const HUB_UPLOAD_BATCH = 50;
            console.log(`📦 [Terms] Processing queue of ${filesQueue.length} files...`);
            
            for (let i = 0; i < filesQueue.length; i += HUB_UPLOAD_BATCH) {
                const batch = filesQueue.slice(i, i + HUB_UPLOAD_BATCH);
                console.log(`📤 [Terms] Uploading batch ${Math.floor(i/HUB_UPLOAD_BATCH)+1}/${Math.ceil(filesQueue.length/HUB_UPLOAD_BATCH)}...`);
                
                // TU JEST KLUCZ: processSingleFile wywołujemy dopiero tutaj!
                await Promise.all(batch.map(f => processSingleFile(f.path, f.content)));
                
                if (i + HUB_UPLOAD_BATCH < filesQueue.length) {
                    await new Promise(r => setTimeout(r, 300)); // Dłuższa przerwa dla bezpieczeństwa
                }
            }
            filesQueue.length = 0;
        }
        } else {
            console.log('⏭️ [Orchestrator] Skipping Term Hubs (BILLS_ONLY mode)');
        }
        
        // 3. GENEROWANIE HUBÓW TEMATYCZNYCH (TOPICS)
        if (config.MODE === 'FULL_REBUILD') {
            console.log('🗂️ [Stream] Generating & Uploading Topic Hubs...');
        
        const billsByTopic = {};
        catalog.forEach(item => {
            if (item.categories && Array.isArray(item.categories)) {
                item.categories.forEach(cat => {
                    if (!billsByTopic[cat]) billsByTopic[cat] = [];
                    billsByTopic[cat].push(item);
                });
            }
        });

        for (const [category, topicBills] of Object.entries(billsByTopic)) {
            topicBills.sort((a, b) => new Date(b.date) - new Date(a.date));
            const slugify = (text) => text.toString().toLowerCase().trim().replace(/\s+/g, '-').replace(/[^\w\-]+/g, '').replace(/\-\-+/g, '-');
            const catSlug = slugify(category);

            for (const lang of config.LANGUAGES) {
                const totalPages = Math.ceil(topicBills.length / ITEMS_PER_PAGE);
                
                for (let i = 0; i < totalPages; i++) {
                    const currentPage = i + 1;
                    const chunk = topicBills.slice(i * ITEMS_PER_PAGE, (i + 1) * ITEMS_PER_PAGE);
                    
                    const billsForView = chunk.map(item => ({
                        id: item.id,
                        title: item.title || item.id,
                        date: new Date(item.date).toLocaleDateString(lang),
                        url: buildBillUrl(lang, item.id, item.term || config.URL_PREFIX.term),
                    }));

                    const prevUrl = currentPage > 1 ? buildTopicUrl(lang, category, currentPage - 1) : null;
                    const nextUrl = currentPage < totalPages ? buildTopicUrl(lang, category, currentPage + 1) : null;

                    const html = hubTemplate({
                        lang: lang,
                        currentPage: currentPage,
                        totalPages: totalPages,
                        bills: billsForView,
                        pageTitle: `${category}`,
                        subTitle: `Topic Archive (${topicBills.length} items)`,
                        prevPageUrl: prevUrl,
                        nextPageUrl: nextUrl,
                        prevTermUrl: null, 
                        nextTermUrl: null
                    });

                    let fileName = currentPage === 1 ? 'index.html' : `page-${currentPage}.html`;
                    let relativePath = `${lang}/${config.URL_PREFIX.institution}/topics/${catSlug}/${fileName}`;
                    
                    filesQueue.push({ path: relativePath, content: html });
                }
            }

            const TOPIC_UPLOAD_BATCH = 50;
            console.log(`📦 [Topics] Processing queue of ${filesQueue.length} files...`);

            for (let i = 0; i < filesQueue.length; i += TOPIC_UPLOAD_BATCH) {
                const batch = filesQueue.slice(i, i + TOPIC_UPLOAD_BATCH);
                console.log(`📤 [Topics] Uploading batch ${Math.floor(i/TOPIC_UPLOAD_BATCH)+1}/${Math.ceil(filesQueue.length/TOPIC_UPLOAD_BATCH)}...`);
                
                await Promise.all(batch.map(f => processSingleFile(f.path, f.content)));
                
                if (i + TOPIC_UPLOAD_BATCH < filesQueue.length) {
                    await new Promise(r => setTimeout(r, 300));
                }
            }
            filesQueue.length = 0;
        }
        } else {
            console.log('⏭️ [Orchestrator] Skipping Topic Hubs (BILLS_ONLY mode)');
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