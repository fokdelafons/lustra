const ejs = require('ejs');
const path = require('path');
const fs = require('fs-extra');
const config = require('../config');
const { format } = require('date-fns');
const translations = require('../utils/translations');

// --- ZMIENNE POMOCNICZE (CACHE) ---
let billTemplate = null;

// --- FUNKCJE POMOCNICZE ---

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

module.exports = { generateBills };