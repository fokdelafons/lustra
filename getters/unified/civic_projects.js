const admin = require('firebase-admin');
const { normalizeLang } = require('./home_screen_v2');
const { DEFAULT_CACHE_TTL_SECONDS } = require('../config/cache');
const { localizeLegislationDocument } = require('./legislations');

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();
const cache = new Map();

const DEFAULT_SUPPORTED_LANGS = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];

function createCivicProjectsHandler(config = {}) {
  const {
    country,
    defaultLang = 'eng',
    supportedLangs = DEFAULT_SUPPORTED_LANGS,
    cacheTtlSeconds = DEFAULT_CACHE_TTL_SECONDS,
    collectionPath = `global_civic/${country}/process`,
    localizeDocument = localizeLegislationDocument,
    noTitleFallback,
    noSummaryFallback,
  } = config;

  if (!country) {
    throw new Error("createCivicProjectsHandler requires 'country' config.");
  }

  return async (req, res) => {
    if (req.body.warmup === true) {
      return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }

    try {
      const data = req.body.data || req.body;
      const {
        limit: rawLimit,
        lastVisibleDocId,
        lang: requestedLangParam,
        category,
      } = data;
      let { sortBy } = data;

      const limit = parseInt(rawLimit, 10) || 20;
      const sortOrder = 'desc';

      if (sortBy === 'processStartDate') {
        sortBy = 'documentDate';
      }
      if (!sortBy) {
        sortBy = 'popularity';
      }

      const lang = normalizeLang(requestedLangParam, defaultLang, supportedLangs);
      const cacheKey = `${country}-civic-${category || 'all'}-${sortBy}-${sortOrder}-${lang}-${limit}-${lastVisibleDocId || 'firstPage'}`;

      if (cache.has(cacheKey)) {
        const cachedEntry = cache.get(cacheKey);
        if ((Date.now() - cachedEntry.timestamp) / 1000 < cacheTtlSeconds) {
          const result = await cachedEntry.promise;
          return res.status(200).json({ data: result });
        }
      }

      const fetchPromise = (async () => {
        let query = db.collection(collectionPath);

        if (category) {
          query = query.where('category', 'array-contains', category);
        }

        query = query.orderBy(sortBy, sortOrder).orderBy(admin.firestore.FieldPath.documentId(), 'asc');

        if (lastVisibleDocId) {
          const lastDoc = await db.collection(collectionPath).doc(lastVisibleDocId).get();
          if (lastDoc.exists) {
            query = query.startAfter(lastDoc);
          }
        }

        query = query.limit(limit);
        const snapshot = await query.get();

        if (snapshot.empty) {
          return { projects: [], nextCursor: null };
        }

        const projects = snapshot.docs.map(doc => {
          const docData = doc.data();
          const localized = localizeDocument(docData, lang, defaultLang, { noTitleFallback, noSummaryFallback });

          if (!localized.processStartDate && localized.documentDate) {
            localized.processStartDate = localized.documentDate;
          }

          return { id: doc.id, ...localized };
        });

        const newLastVisibleDocId = snapshot.docs[snapshot.docs.length - 1]?.id || null;
        return { projects, nextCursor: newLastVisibleDocId };
      })();

      cache.set(cacheKey, { promise: fetchPromise, timestamp: Date.now() });
      const result = await fetchPromise;
      return res.status(200).json({ data: result });
    } catch (error) {
      console.error(`[${country}_getCivicProjects] Błąd:`, error);
      return res.status(500).json({
        error: {
          code: 'internal',
          message: 'An unexpected error occurred.',
          details: error.message,
        },
      });
    }
  };
}

module.exports = {
  createCivicProjectsHandler,
};
