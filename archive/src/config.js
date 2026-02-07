// --- SŁOWNIKI ---
const REGION_MAP = {
    'us-congress': 'US',
    'sejm': 'PL',
    'bundestag': 'DE',
    'eu-parliament': 'EU' 
};

const JURISDICTION_MAP = {
    'us-congress': 'United States',
    'sejm': 'Poland',
    'bundestag': 'Germany',
    'eu-parliament': 'European Union'
};

const SOURCE_API_MAP = {
    'us-congress': 'api.congress.gov',
    'sejm': 'api.sejm.gov.pl'
};

const INSTITUTION_LABELS = {
    'us-congress': { 
        en: 'US Congress', pl: 'Kongres USA', de: 'US-Kongress', 
        fr: 'Congrès américain', es: 'Congreso de EE. UU.', 
        it: 'Congresso USA', nl: 'Amerikaans Congres', pt: 'Congresso dos EUA' 
    },
    'sejm': { 
        en: 'Sejm', pl: 'Sejm RP', de: 'Sejm', /* ... */ 
    }
};

module.exports = {
    PROJECT_ID: process.env.PROJECT_ID,
    BUCKET_NAME: process.env.BUCKET_NAME || 'lustra-web-prod',
    
    FIRESTORE: {
        COLLECTION: 'us_legislations', 
        CIVIC_COLLECTION: 'us_civic'
    },

    LANGUAGES: ['pl', 'en', 'de', 'fr', 'es', 'it', 'nl', 'pt'],
    
    // --- SEO CONTROL TOWER ---
    SITEMAP_POLICY: {
        // Tylko te kadencje (Świeżość)
        allowedTerms: ['119', 'civic'], 
        
        // Tylko te języki (Koncentracja Rynku)
        // Reszta (DE, FR...) będzie miała pliki HTML, ale nie trafi do XML.
        allowedLanguages: ['en'] 
    },

    // URL: /{lang}/us-congress/{term}/legislations/{id}
    URL_PREFIX: {
        institution: 'us-congress',
        type: 'legislations'
    },

    PATHS: {
        CATALOG: 'meta/catalog-us.json',
        SITEMAPS_DIR: 'sitemaps/',
        SITEMAP_INDEX: 'sitemap.xml'
    },

    LABELS: {
        INSTITUTION: INSTITUTION_LABELS,
        REGION: REGION_MAP,
        SOURCE: SOURCE_API_MAP,
        JURISDICTION: JURISDICTION_MAP
    },

    BATCH_LIMIT: process.env.BATCH_LIMIT ? parseInt(process.env.BATCH_LIMIT) : 1, 
    DRY_RUN: process.env.DRY_RUN === 'true',
    
    // Operation Mode: 'BILLS_ONLY' (daily, fast) | 'FULL_REBUILD' (weekly, slow)
    MODE: process.env.MODE || 'BILLS_ONLY',
    FORCE_REBUILD: process.env.FORCE_REBUILD === 'true'

};