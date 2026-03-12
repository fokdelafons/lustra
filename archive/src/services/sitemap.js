const { create } = require('xmlbuilder2');
const config = require('../config');
const { buildBillUrl } = require('../utils/url-builder');

function generateSitemaps(catalog) {
    console.log(`🗺️ [Sitemap] Applying SEO Policy: Only terms [${config.SITEMAP_POLICY.allowedTerms.join(', ')}]`);

    const activeCatalog = catalog.filter(item => {
        const termStr = String(item.term || '');
        return config.SITEMAP_POLICY.allowedTerms.includes(termStr);
    });

    console.log(`🗺️ [Sitemap] Selected ${activeCatalog.length} items for index (out of ${catalog.length}).`);

    const outputFiles = [];
    const today = new Date().toISOString();
    const indexRoot = create({ version: '1.0', encoding: 'UTF-8' })
        .ele('sitemapindex', { xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9' });

    config.LANGUAGES.forEach(lang => {
        if (!config.SITEMAP_POLICY.allowedLanguages.includes(lang)) {
            return;
        }

        config.SITEMAP_POLICY.allowedTerms.forEach(term => {
            const termDocs = activeCatalog.filter(item => String(item.term) === String(term));
            
            if (termDocs.length === 0) return;

            const root = create({ version: '1.0', encoding: 'UTF-8' })
                .ele('urlset', { xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9' });

            termDocs.forEach(item => {
                const url = root.ele('url');
                url.ele('loc').txt(buildBillUrl(lang, item.id, item.term));
                
                let lastMod = today;
                try {
                    if (item.date) lastMod = new Date(item.date).toISOString();
                } catch (e) { }
                url.ele('lastmod').txt(lastMod);
                
                url.ele('changefreq').txt('monthly');
                url.ele('priority').txt('0.8');
            });

            const fileName = `sitemap-${lang}-${term}.xml`;
            outputFiles.push({
                path: `${config.PATHS.SITEMAPS_DIR}${fileName}`,
                content: root.doc().end({ prettyPrint: true })
            });

            const sitemap = indexRoot.ele('sitemap');
            sitemap.ele('loc').txt(`https://lustra.news/${config.PATHS.SITEMAPS_DIR}${fileName}`);
            sitemap.ele('lastmod').txt(today);
        });
    });

    outputFiles.push({
        path: config.PATHS.SITEMAP_INDEX,
        content: indexRoot.doc().end({ prettyPrint: true })
    });

    return outputFiles;
}

module.exports = { generateSitemaps };