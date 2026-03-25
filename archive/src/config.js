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
        en: 'Sejm', pl: 'Sejm RP', de: 'Sejm', fr: 'Diète', es: 'Dieta', it: 'Dieta', nl: 'Sejm', pt: 'Dieta'
    }
};

const TARGET_INSTITUTION = process.env.TARGET_INSTITUTION || 'us-congress';

const PREFIX_MAP = {
    'us-congress': 'us',
    'sejm': 'pl',
    'bundestag': 'de',
    'eu-parliament': 'eu'
};
const DB_PREFIX = PREFIX_MAP[TARGET_INSTITUTION] || 'us';

const DEFAULT_TERMS_MAP = {
    'us-congress': ['117', '118', '119', 'civic'],
    'sejm': ['10', 'civic']
};

const ENV_TERMS = process.env.ALLOWED_TERMS ? process.env.ALLOWED_TERMS.split(',') : DEFAULT_TERMS_MAP[TARGET_INSTITUTION];

module.exports = {
    PROJECT_ID: process.env.PROJECT_ID,
    BUCKET_NAME: process.env.BUCKET_NAME || 'lustra-web-prod',
    
    TARGET_INSTITUTION: TARGET_INSTITUTION,

    FIRESTORE: {
        COLLECTION: `${DB_PREFIX}_legislations`, 
        CIVIC_COLLECTION: `${DB_PREFIX}_civic`
    },

    LANGUAGES: ['pl', 'en', 'de', 'fr', 'es', 'it', 'nl', 'pt'],
    
    // --- SEO CONTROL TOWER ---
    SITEMAP_POLICY: {
        allowedTerms: ENV_TERMS, 
        allowedLanguages: ['en', 'de', 'fr', 'es', 'it', 'nl', 'pt', 'pl'] 
    },

    URL_PREFIX: {
        institution: TARGET_INSTITUTION,
        type: 'legislations'
    },

    PATHS: {
        CATALOG: `meta/catalog-${TARGET_INSTITUTION}.json`,
        SITEMAPS_DIR: `sitemaps/${TARGET_INSTITUTION}/`,
        SITEMAP_INDEX: `sitemaps/sitemap-${TARGET_INSTITUTION}.xml`
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