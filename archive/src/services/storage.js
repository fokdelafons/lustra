const admin = require('firebase-admin');
const config = require('../config');
const path = require('path');
const fs = require('fs-extra');

// Inicjalizacja (Singleton)
if (!admin.apps.length) {
    admin.initializeApp();
}
const bucket = admin.storage().bucket(config.BUCKET_NAME);

/**
 * Pobiera aktualny katalog (Spis Treści) z Bucketa.
 * Jeśli plik nie istnieje (pierwsze uruchomienie), zwraca pustą tablicę.
 */
async function getCatalog() {
    const file = bucket.file(config.PATHS.CATALOG);
    console.log(`📦 [Storage] Fetching catalog: ${config.PATHS.CATALOG}...`);

    try {
        const [buffer] = await file.download();
        const data = JSON.parse(buffer.toString());
        console.log(`✅ [Storage] Catalog loaded (${data.length} items).`);
        return data;
    } catch (error) {
        if (error.code === 404) {
            console.warn('⚠️ [Storage] Catalog not found. Creating a new one.');
            return [];
        }
        throw error;
    }
}

/**
 * Zapisuje zaktualizowany katalog na Buckecie.
 * Ustawia cache-control na 'no-cache', żeby kolejne uruchomienie joba widziało świeże dane.
 */
async function saveCatalog(catalogData) {
    if (config.DRY_RUN) {
        console.log(`[DRY-RUN] Would save catalog with ${catalogData.length} items.`);
        return;
    }

    const file = bucket.file(config.PATHS.CATALOG);
    const jsonString = JSON.stringify(catalogData); // Brak formatowania dla oszczędności miejsca

    await file.save(jsonString, {
        contentType: 'application/json',
        metadata: {
            cacheControl: 'no-cache, no-store, must-revalidate' 
        }
    });
    console.log(`💾 [Storage] Catalog saved successfully.`);
}

/**
 * Uploaduje pojedynczy plik na Bucket.
 * @param {string} localPath - Ścieżka na dysku (np. /tmp/dist/...)
 * @param {string} destinationPath - Ścieżka w chmurze (np. en/usa/119/...)
 * @param {string} contentType - np. 'text/html' lub 'text/xml'
 */
async function uploadFile(localPath, destinationPath, contentType = 'text/html') {
    if (config.DRY_RUN) {
        console.log(`[DRY-RUN] Upload: ${destinationPath}`);
        return;
    }

    await bucket.upload(localPath, {
        destination: destinationPath,
        metadata: {
            contentType: contentType,
            // HTML cacheujemy krótko (1h), żeby zmiany w layoutcie wchodziły szybko
            // Ustawy (treść) się nie zmieniają, ale layout/linki w stopce mogą.
            cacheControl: 'public, max-age=3600' 
        }
    });
}

/**
 * Helper do masowego uploadu folderu (rekurencyjnie).
 * Przydatne, gdy generator wypluje całą strukturę folderów do /dist
 */
async function uploadDirectory(localDir, prefix = '') {
    // Ta funkcja przyda się w głównym index.js
    // Iteruje po plikach w localDir i woła uploadFile
    const files = await fs.readdir(localDir); // Uproszczone, wymaga rekurencji w pełnej wersji
    // Na razie w generatorze będziemy znać dokładne ścieżki, więc uploadFile wystarczy.
}

module.exports = { getCatalog, saveCatalog, uploadFile };