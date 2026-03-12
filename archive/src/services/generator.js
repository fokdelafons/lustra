const ejs = require('ejs');
const path = require('path');
const fs = require('fs-extra');
const config = require('../config');
const { format } = require('date-fns');
const translations = require('../utils/translations');
const { buildBillUrl, buildHubUrl, buildTopicUrl, buildMainTopicsUrl } = require('../utils/url-builder');

// --- ZMIENNE POMOCNICZE (CACHE) ---
let billTemplate = null;

// --- FUNKCJE POMOCNICZE ---

// --- OPEN GRAPH DYNAMIC LOGIC ---
const OG_CATEGORY_MAP = {
    "Health": "health",
    "Family": "family",
    "Taxes": "finance",
    "Migration": "migration",
    "Labor": "labor",
    "Security": "security",
    "Education": "education",
    "Environment": "environment",
    "Courts and Law": "law",
    "Transport": "transport",
    "Benefits": "finance",
    "Real Estate": "infrastructure",
    "Media and Culture": "culture",
    "Local Government": "government",
    "Agriculture": "agriculture",
    "Public Investments": "infrastructure",
    "Informatization": "tech",
    "Economy": "finance",
    "Other": "default"
};

function getOgImage(docId, categories) {
    const baseUrl = 'https://lustra.news/assets/og';
    let folder = 'default';
    
    // Pobranie pierwszego tagu jako wiodącego
    if (categories && Array.isArray(categories) && categories.length > 0) {
        folder = OG_CATEGORY_MAP[categories[0]] || 'default';
    }

    // Pseudo-hash na podstawie liter z docId (zwraca zawsze ten sam index dla danej ustawy)
    let hash = 0;
    for (let i = 0; i < docId.length; i++) {
        hash += docId.charCodeAt(i);
    }
    const imageIndex = (hash % 5) + 1; // Wynik: 1, 2, 3, 4 lub 5

    return `${baseUrl}/${folder}/preview${imageIndex}.jpg`;
}

async function loadTemplate() {
    if (billTemplate) return billTemplate;
    const templatePath = path.join(__dirname, '../templates/bill.ejs');
    const templateStr = await fs.readFile(templatePath, 'utf8');
    billTemplate = ejs.compile(templateStr);
    return billTemplate;
}

function formatDate(dateObj) {
    if (!dateObj) return '';
    try {
        const date = (typeof dateObj.toDate === 'function') 
            ? dateObj.toDate() 
            : new Date(dateObj);
        return format(date, 'yyyy-MM-dd');
    } catch (e) {
        return String(dateObj);
    }
}

const slugify = (text) => text.toString().toLowerCase().trim()
    .replace(/\s+/g, '-')
    .replace(/[^\w\-]+/g, '')
    .replace(/\-\-+/g, '-');

// --- GŁÓWNA LOGIKA ---

async function generateBills(docs) {
    const template = await loadTemplate();
    const outputFiles = [];
    const catalogUpdates = [];
    const currentSlug = config.URL_PREFIX.institution; // np. 'us-congress'

    // 1. Ustal Jurysdykcję Globalnie (np. United States)
    const jurisdictionName = config.LABELS.JURISDICTION[currentSlug];

    console.log(`🔨 [Generator] Rendering ${docs.length} bills in ${config.LANGUAGES.length} languages...`);

    for (const doc of docs) {
        // 2. Dynamiczne dane per Ustawa
        const term = doc.term;
        const geoRegion = config.LABELS.REGION[currentSlug] || null; 
        const sourceApi = config.LABELS.SOURCE[currentSlug] || null;
        const aiModel = doc.summaryGeneratedBy || null;
        const judgeModel = (doc.judgeMetadata && doc.judgeMetadata.model) || 'Lustra AI';
        const processUrl = doc.fullContent || null;

        // 3. Typ Legislacji (Precyzyjne Mapowanie)
        let legType = 'Bill'; // Ostateczny fallback

        // Mapa skrótów Kongresu USA
        const US_TYPE_MAP = {
            'hr': 'House Bill',
            's': 'Senate Bill',
            'hres': 'House Resolution',
            'sres': 'Senate Resolution',
            'hjres': 'House Joint Resolution',
            'sjres': 'Senate Joint Resolution',
            'hconres': 'House Concurrent Resolution',
            'sconres': 'Senate Concurrent Resolution'
        };

        if (currentSlug === 'us-congress' && doc.documentType) {
            // Normalizacja: H.R. -> hr, S -> s
            const typeKey = doc.documentType.toLowerCase().replace(/[^a-z]/g, '');
            if (US_TYPE_MAP[typeKey]) {
                legType = US_TYPE_MAP[typeKey];
            }
        } 
        // Fallback dla innych krajów (lub gdy mapa nie znajdzie klucza)
        else if (doc.subType) {
            legType = doc.subType.charAt(0).toUpperCase() + doc.subType.slice(1);
        }

        // 4. Meta Dane (Daty)
        const meta = {
            documentDate: formatDate(doc.processStartDate), 
            processStartDate: formatDate(doc.processStartDate),
            lastUpdated: formatDate(doc.lastUpdated),
            votingDate: formatDate(doc.votingDate),
            judgeDate: doc.judgeMetadata?.at ? formatDate(doc.judgeMetadata.at) : 'N/A',
            generatedAt: format(new Date(), 'MMM d, yyyy HH:mm') + ' UTC'
        };

        // 4.5. Open Graph Image
        const ogImageUrl = getOgImage(doc.id, doc.category);

        // 5. Hreflangs
        const hreflangs = {};
        config.LANGUAGES.forEach(lang => {
            hreflangs[lang] = `https://lustra.news/${lang}/${currentSlug}/${term}/${config.URL_PREFIX.type}/${doc.id}/`;
        });

        // 6. Pętla Językowa
        for (const lang of config.LANGUAGES) {
            // Tłumaczenia interfejsu (Labels)
            const labels = translations[lang] || translations['en'];
            
            // Tłumaczenia treści (Content)
            const content = {
                ai_title: doc[`${lang}_ai_title`] || doc['eng_ai_title'] || doc.titleOfficial,
                summary: doc[`${lang}_summary`] || doc['eng_summary'] || 'Summary not available.',
                key_points: doc[`${lang}_key_points`] || doc['eng_key_points'] || [],
            };
            
            // Nazwa Instytucji w danym języku
            const institutionName = config.LABELS.INSTITUTION[currentSlug][lang];

            // Render HTML
            const html = template({
                doc: doc,
                term: term,
                content: content,
                meta: meta,
                lang: lang,
                hreflangs: hreflangs,
                labels: labels,
                geoRegion: geoRegion,
                jurisdictionName: jurisdictionName,
                legType: legType,
                institutionSlug: currentSlug,
                institutionName: institutionName,
                typeSlug: config.URL_PREFIX.type,
                sourceApi: sourceApi,
                aiModel: aiModel,
                judgeModel: judgeModel,
                slugify: slugify,
                processUrl: processUrl,
                ogImageUrl: ogImageUrl,
                prevDoc: null,
                nextDoc: null
            });

            const relativePath = `${lang}/${currentSlug}/${term}/${config.URL_PREFIX.type}/${doc.id}/index.html`;
            outputFiles.push({ path: relativePath, content: html });
        }

        // 7. Catalog Update (Safe Date)
        let isoDate = new Date().toISOString();
        if (doc.processStartDate) {
             if (typeof doc.processStartDate.toDate === 'function') {
                 isoDate = doc.processStartDate.toDate().toISOString();
             } else {
                 try { isoDate = new Date(doc.processStartDate).toISOString(); } catch(e) {}
             }
        }

        catalogUpdates.push({
            id: doc.id,
            term: term,
            date: isoDate,
            title: doc.titleOfficial,
            categories: doc.category || []
        });
    }

    return { outputFiles, catalogUpdates };
}

async function loadHubTemplate() {
    const templatePath = path.join(__dirname, '../templates/hub.ejs');
    const templateStr = await fs.readFile(templatePath, 'utf8');
    return ejs.compile(templateStr);
}

async function generateHubs(catalog, uploadBatchCallback) {
    let filesQueue = [];
    const template = await loadHubTemplate();
    const ITEMS_PER_PAGE = 20;
    const slugify = (text) => text.toString().toLowerCase().trim().replace(/\s+/g, '-').replace(/[^\w\-]+/g, '').replace(/\-\-+/g, '-');

    // 1. TERMS
    console.log('🗂️ [Generator] Preparing Term Hubs...');
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

                let fileName = currentPage === 1 ? 'index.html' : `page-${currentPage}.html`;
                
                // SEO & I18N
                const hreflangs = {};
                config.LANGUAGES.forEach(l => {
                    hreflangs[l] = buildHubUrl(l, term, currentPage);
                });
                const tLabels = translations[lang] || translations['en'];

                const html = template({
                    lang: lang,
                    term: term,
                    currentPage: currentPage,
                    totalPages: totalPages,
                    bills: billsForView,
                    pageTitle: `${instName} (${term} ${tLabels.term_label || 'Term'})`,
                    subTitle: "Legislative Database",
                    prevPageUrl: currentPage > 1 ? buildHubUrl(lang, term, currentPage - 1) : null,
                    nextPageUrl: currentPage < totalPages ? buildHubUrl(lang, term, currentPage + 1) : null,
                    prevTermUrl: null,
                    nextTermUrl: null,
                    canonicalUrl: hreflangs[lang],
                    hreflangs: hreflangs,
                    labels: tLabels,
                    institutionSlug: config.URL_PREFIX.institution,
                    institutionName: instName,
                    topicName: null
                });

                filesQueue.push({ path: `${lang}/${config.URL_PREFIX.institution}/${term}/${fileName}`, content: html });
                    if (filesQueue.length >= 50) {
                    await uploadBatchCallback(filesQueue);
                    filesQueue.length = 0;
                    if (global.gc) global.gc();
                }
            }
        }
    }

    // 2. TOPICS
    console.log('🗂️ [Generator] Preparing Topic Hubs...');
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
        const catSlug = slugify(category);

        for (const lang of config.LANGUAGES) {
            const totalPages = Math.ceil(topicBills.length / ITEMS_PER_PAGE);
            const instName = config.LABELS.INSTITUTION[config.URL_PREFIX.institution][lang];
            const tLabels = translations[lang] || translations['en'];
            const translatedCategory = (tLabels.categories && tLabels.categories[category]) ? tLabels.categories[category] : category;
            
            for (let i = 0; i < totalPages; i++) {
                const currentPage = i + 1;
                const chunk = topicBills.slice(i * ITEMS_PER_PAGE, (i + 1) * ITEMS_PER_PAGE);
                
                const billsForView = chunk.map(item => ({
                    id: item.id,
                    title: item.title || item.id,
                    date: new Date(item.date).toLocaleDateString(lang),
                    url: buildBillUrl(lang, item.id, item.term || config.URL_PREFIX.term),
                }));

                let fileName = currentPage === 1 ? 'index.html' : `page-${currentPage}.html`;
                
                const hreflangs = {};
                config.LANGUAGES.forEach(l => {
                    hreflangs[l] = buildTopicUrl(l, category, currentPage);
                });

                const html = template({
                    lang: lang,
                    term: null,
                    currentPage: currentPage,
                    totalPages: totalPages,
                    bills: billsForView,
                    pageTitle: `${tLabels.topic_label || 'Topic'}: ${translatedCategory}`,
                    subTitle: `Topic Archive (${topicBills.length} items)`,
                    prevPageUrl: currentPage > 1 ? buildTopicUrl(lang, category, currentPage - 1) : null,
                    nextPageUrl: currentPage < totalPages ? buildTopicUrl(lang, category, currentPage + 1) : null,
                    prevTermUrl: null, 
                    nextTermUrl: null,
                    canonicalUrl: hreflangs[lang],
                    hreflangs: hreflangs,
                    labels: tLabels,
                    institutionSlug: config.URL_PREFIX.institution,
                    institutionName: instName,
                    topicName: translatedCategory
                });

                filesQueue.push({ path: `${lang}/${config.URL_PREFIX.institution}/topics/${catSlug}/${fileName}`, content: html });
                    if (filesQueue.length >= 50) {
                    await uploadBatchCallback(filesQueue);
                    filesQueue.length = 0;
                    if (global.gc) global.gc();
                }
            }
        }
    }

    // 3. MAIN TOPICS INDEX (ORPHAN FIX)
    console.log('🗂️ [Generator] Preparing Main Topics Index...');
    for (const lang of config.LANGUAGES) {
        const instName = config.LABELS.INSTITUTION[config.URL_PREFIX.institution][lang];
        const tLabels = translations[lang] || translations['en'];

        const categoriesForView = Object.keys(billsByTopic).map(cat => ({
            id: 'TOPIC',
            title: (tLabels.categories && tLabels.categories[cat]) ? tLabels.categories[cat] : cat,
            date: `${billsByTopic[cat].length} items`,
            url: buildTopicUrl(lang, cat, 1)
        })).sort((a, b) => a.title.localeCompare(b.title));

        let fileName = 'index.html';
        const hreflangs = {};
        config.LANGUAGES.forEach(l => {
            hreflangs[l] = buildMainTopicsUrl(l);
        });

        const html = template({
            lang: lang,
            term: null,
            currentPage: 1,
            totalPages: 1,
            bills: categoriesForView,
            pageTitle: tLabels.topics_index_title || "All Topics",
            subTitle: instName,
            prevPageUrl: null,
            nextPageUrl: null,
            prevTermUrl: null,
            nextTermUrl: null,
            canonicalUrl: hreflangs[lang],
            hreflangs: hreflangs,
            labels: tLabels,
            institutionSlug: config.URL_PREFIX.institution,
            institutionName: instName,
            topicName: null
        });
        filesQueue.push({ path: `${lang}/${config.URL_PREFIX.institution}/topics/${fileName}`, content: html });
                if (filesQueue.length >= 50) {
                    await uploadBatchCallback(filesQueue);
                    filesQueue.length = 0;
                    if (global.gc) global.gc();
                }
    }

    if (filesQueue.length > 0) {
        await uploadBatchCallback(filesQueue);
        filesQueue.length = 0;
    }
}

module.exports = { generateBills, generateHubs };