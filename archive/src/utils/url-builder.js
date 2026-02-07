const config = require('../config');
const slugify = (text) => text.toString().toLowerCase().trim()
    .replace(/\s+/g, '-')
    .replace(/[^\w\-]+/g, '')
    .replace(/\-\-+/g, '-');

function buildBillUrl(lang, id, term) {
    return `https://lustra.news/${lang}/${config.URL_PREFIX.institution}/${term}/${config.URL_PREFIX.type}/${id}/`;
}

function buildHubUrl(lang,term, page = 1) {
    const baseUrl = `https://lustra.news/${lang}/${config.URL_PREFIX.institution}/${term}`;
    if (page === 1) return `${baseUrl}/index.html`;
    return `${baseUrl}/page-${page}.html`;
}

function buildTopicUrl(lang, category, page = 1) {
    const slug = slugify(category);
    const baseUrl = `https://lustra.news/${lang}/${config.URL_PREFIX.institution}/topics/${slug}`;
    if (page === 1) return `${baseUrl}/index.html`;
    return `${baseUrl}/page-${page}.html`;
}

module.exports = { buildBillUrl, buildHubUrl, buildTopicUrl };