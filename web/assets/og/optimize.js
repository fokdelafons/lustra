const fs = require('fs').promises;
const path = require('path');
const sharp = require('sharp');

const categories = [
    'agriculture', 'culture', 'education', 'environment', 'family',
    'finance', 'government', 'health', 'infrastructure', 'labor',
    'law', 'migration', 'security', 'tech', 'transport', 'default'
];

const baseDir = __dirname; 
const targetWidth = 1200;
const targetHeight = 630;
const jpegQuality = 75;

async function processImages() {
    console.log("TARCZA: Inicjalizacja kompresji (Wersja z łatą regeneracji)...\n");

    for (const category of categories) {
        const categoryPath = path.join(baseDir, category);
        
        try {
            await fs.access(categoryPath);
        } catch {
            continue;
        }

        const files = await fs.readdir(categoryPath);
        
        // Znajdź surowe pliki do przetworzenia
        const rawFiles = files.filter(f => /\.(png|jpe?g|webp)$/i.test(f) && !f.startsWith('preview'));
        
        // Znajdź zajęte numery preview
        const existingPreviews = files
            .filter(f => f.startsWith('preview') && f.endsWith('.jpg'))
            .map(f => parseInt(f.replace('preview', '').replace('.jpg', '')))
            .filter(n => !isNaN(n));

        if (rawFiles.length === 0) continue;

        console.log(`\n⚙️ Przetwarzam /${category}/ (${rawFiles.length} nowych plików)...`);

        let rawIndex = 0;
        // Szukamy wolnych slotów od 1 do 5
        for (let i = 1; i <= 5; i++) {
            if (rawIndex >= rawFiles.length) break; // Skończyły się nowe pliki
            
            if (existingPreviews.includes(i)) continue; // Ten numer jest już zajęty, pomijamy

            const file = rawFiles[rawIndex];
            const originalPath = path.join(categoryPath, file);
            const finalPath = path.join(categoryPath, `preview${i}.jpg`);
            const tempPath = path.join(categoryPath, `temp_preview${i}.jpg`);

            try {
                await sharp(originalPath)
                    .resize(targetWidth, targetHeight, {
                        fit: sharp.fit.cover,
                        position: sharp.strategy.attention
                    })
                    .jpeg({ quality: jpegQuality, progressive: true, mozjpeg: true })
                    .toFile(tempPath);

                await fs.unlink(originalPath); // Usuń oryginał
                await fs.rename(tempPath, finalPath); // Nadaj właściwą nazwę

                const stats = await fs.stat(finalPath);
                console.log(`✅ Zregenerowano: /${category}/preview${i}.jpg | Rozmiar: ${(stats.size / 1024).toFixed(1)} KB`);
                
                rawIndex++; // Przejdź do kolejnego surowego pliku
            } catch (error) {
                console.error(`❌ BŁĄD KRYTYCZNY przy pliku ${file} w /${category}/:`, error.message);
            }
        }
        
        if (rawIndex < rawFiles.length) {
             console.log(`⚠️ UWAGA: W folderze /${category}/ zostało ${rawFiles.length - rawIndex} nadmiarowych plików. Limit to 5.`);
        }
    }
    console.log('\n🎯 STATUS: ZAKOŃCZONO.');
}

processImages();