const admin = require('firebase-admin');
const config = require('../config');

// Initialize Firebase Admin if not already initialized
if (!admin.apps.length) {
    admin.initializeApp();
}
const db = admin.firestore();

/**
 * Scans configured collections for new or updated documents.
 * Uses config.js to determine collection names.
 */
async function getDocumentsToProcess() {
    const mainCol = config.FIRESTORE.COLLECTION;
    const civicCol = config.FIRESTORE.CIVIC_COLLECTION;

    console.log(`🔍 [Firestore] Scanning collections: ${mainCol}, ${civicCol}...`);
    
    // 1. Standard Legislations
    const legSnap = await db.collection(mainCol)
        .where('isValid', '==', true)
        .select('lastUpdated', 'htmlGeneratedAt')
        .get();

    // 2. Civic Projects
    const civicSnap = await db.collection(civicCol)
        .where('isValid', '==', true)
        .select('lastUpdated', 'htmlGeneratedAt')
        .get();

    const targets = [];

    // Helper to process snapshots
    const process = (snap, colName) => {
        snap.forEach(doc => {
            const data = doc.data();
            
            // Delta check logic
            const isFullRebuild = config.FORCE_REBUILD || config.MODE === 'FULL_REBUILD';
            
            let needsUpdate = isFullRebuild || !data.htmlGeneratedAt;

            if (!isFullRebuild && data.htmlGeneratedAt && data.lastUpdated) {
                 const lastUpdatedMs = data.lastUpdated.toMillis ? data.lastUpdated.toMillis() : new Date(data.lastUpdated).getTime();
                 const generatedMs = data.htmlGeneratedAt.toMillis ? data.htmlGeneratedAt.toMillis() : new Date(data.htmlGeneratedAt).getTime();
                 
                 if (lastUpdatedMs > generatedMs) {
                     needsUpdate = true;
                 }
            }

            if (needsUpdate) {
                targets.push({ id: doc.id, col: colName });
            }
        });
    };

    process(legSnap, mainCol);
    process(civicSnap, civicCol);

    console.log(`🔍 [Firestore] Found ${targets.length} targets.`);
    return targets;
}

/**
 * Fetches full document data.
 * @param {Array<{id: string, col: string}>} targets 
 */
async function fetchFullDocuments(targets) {
    if (!targets || targets.length === 0) return [];

    // Dynamically map based on the collection property stored in target
    const refs = targets.map(t => db.collection(t.col).doc(t.id));

    const snapshots = await db.getAll(...refs);

    return snapshots.map(snap => {
        if (!snap.exists) return null;
        
        const data = snap.data();
        data.id = snap.id;

        // VIRTUAL TERM LOGIC
        // If the document comes from the configured Civic collection, override term.
        if (snap.ref.parent.id === config.FIRESTORE.CIVIC_COLLECTION) {
            data.term = 'civic';
            
            // Fallback for missing titles in civic projects
            if (!data.title) data.title = `Civic Project ${data.id}`;
        }

        return data;
    }).filter(d => d !== null);
}

/**
 * Marks documents as generated.
 * Respects the source collection of each document.
 */
async function markAsGenerated(targets) {
    if (!targets || targets.length === 0) return;

    const BATCH_SIZE = 400; 

    for (let i = 0; i < targets.length; i += BATCH_SIZE) {
        const chunk = targets.slice(i, i + BATCH_SIZE);
        const batch = db.batch();
        const timestamp = admin.firestore.FieldValue.serverTimestamp();

        chunk.forEach(t => {
            const ref = db.collection(t.col).doc(t.id);
            batch.update(ref, { htmlGeneratedAt: timestamp });
        });

        await batch.commit();
        console.log(`💾 [Firestore] Marked ${chunk.length} docs as generated.`);
    }
}

module.exports = { 
    getDocumentsToProcess, 
    fetchFullDocuments, 
    markAsGenerated 
};