const admin = require('firebase-admin');
const { DEFAULT_CACHE_TTL_SECONDS } = require('../config/cache');
const { normalizeLang } = require('./home_screen_v2');

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();
const cache = new Map();
const DEFAULT_SUPPORTED_LANGS = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];
const DEFAULT_ALLOWED_SORT_FIELDS = ['title', 'documentDate', 'lastUpdated', 'votingDate', 'processStartDate', 'firstSeenAt', 'popularity'];
const DEFAULT_ACCEPTED_REJECTED_SUB_STATUSES = ['accepted', 'rejected'];

function localizeLegislationDocument(docData, langCode, defaultLang, config = {}) {
  if (!docData) return null;

  const noTitleFallback = config.noTitleFallback || 'No Title';
  const noSummaryFallback = config.noSummaryFallback || 'We are sorry! No summary has been generated so far. The official source text may be unavailable. If so, you can help by submitting a transparency request using our form.';

  const getLocalizedValue = (baseFieldName) => (
    docData[`${langCode}_${baseFieldName}`] ??
    docData[`${defaultLang}_${baseFieldName}`] ??
    docData[baseFieldName]
  );

  const localized = { ...docData };
  localized.title = getLocalizedValue('ai_title') || getLocalizedValue('titleOfficial') || noTitleFallback;
  localized.description = getLocalizedValue('summary') || getLocalizedValue('description') || noSummaryFallback;
  localized.key_Points = getLocalizedValue('key_points') || [];

  if (!Array.isArray(localized.key_Points)) {
    localized.key_Points = [];
  }

  return localized;
}

function parseSort(rawSortBy, rawSortOrder, allowedSortFields = DEFAULT_ALLOWED_SORT_FIELDS) {
  let sortBy = 'popularity';
  let sortOrder = 'desc';

  if (rawSortBy) {
    const parts = String(rawSortBy).split('_');
    const potentialSortBy = parts[0];

    if (allowedSortFields.includes(potentialSortBy)) {
      sortBy = potentialSortBy;
      if (parts.length > 1 && ['asc', 'desc'].includes(parts[1])) {
        sortOrder = parts[1];
      }
    }
  }

  if (rawSortOrder && ['asc', 'desc'].includes(rawSortOrder)) {
    sortOrder = rawSortOrder;
  }

  return { sortBy, sortOrder };
}

function createLegislationsHandler(config = {}) {
  const {
    country,
    defaultLang = 'eng',
    supportedLangs = DEFAULT_SUPPORTED_LANGS,
    cacheTtlSeconds = DEFAULT_CACHE_TTL_SECONDS,
    collectionPath = `global_legislations/${country}/process`,
    termMetadataPath = `metadata/${country}/term_metadata`,
    acceptedRejectedSubStatuses = DEFAULT_ACCEPTED_REJECTED_SUB_STATUSES,
    allowedSortFields = DEFAULT_ALLOWED_SORT_FIELDS,
    localizeDocument = localizeLegislationDocument,
    noTitleFallback,
    noSummaryFallback,
  } = config;

  if (!country) {
    throw new Error("createLegislationsHandler requires 'country' config.");
  }

  return async (req, res) => {
    if (req.body.warmup === true) {
      console.log(`${country}_getLegislations: Otrzymano żądanie rozgrzewające.`);
      return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }

    try {
      const data = req.body.data || req.body;
      const {
        status: statusFilter,
        category,
        sortBy: rawSortBy,
        sortOrder: rawSortOrder,
        term: requestedTerm,
        documentType: documentTypeFilter,
        limit: rawLimit,
        lastVisibleDocId,
        lang: requestedLangParam,
        raw,
        processStartDateAfter,
        hideNoDocument,
      } = data;

      const limit = parseInt(rawLimit, 10) || 20;
      const { sortBy, sortOrder } = parseSort(rawSortBy, rawSortOrder, allowedSortFields);
      const lang = normalizeLang(requestedLangParam, defaultLang, supportedLangs);

      if (!requestedTerm && !processStartDateAfter) {
        return res.status(400).json({
          error: {
            code: 'invalid-argument',
            message: "Missing 'term' or 'processStartDateAfter' parameter.",
          },
        });
      }

      let termToUse;
      if (processStartDateAfter) {
        console.log(`${country}_getLegislations: Wykryto zapytanie z powiadomienia. Pobieram aktualną kadencję.`);
        const metadataDoc = await db.collection(termMetadataPath).doc('last_update').get();
        if (!metadataDoc.exists) {
          throw new Error(`Dokument ${termMetadataPath}/last_update nie istnieje.`);
        }
        termToUse = metadataDoc.data().currentTerm;
      } else {
        termToUse = requestedTerm;
      }

      const cacheKey = `${country}-legs-${termToUse}-${statusFilter || 'all'}-${category || 'all'}-${documentTypeFilter || 'all'}-${sortBy}-${sortOrder}-${processStartDateAfter || 'none'}-${lang}-${limit}-${lastVisibleDocId || 'firstPage'}-${raw || 'false'}-hnd-${hideNoDocument || 'false'}`;
      if (cache.has(cacheKey)) {
        const cachedEntry = cache.get(cacheKey);
        if ((Date.now() - cachedEntry.timestamp) / 1000 < cacheTtlSeconds) {
          const result = await cachedEntry.promise;
          return res.status(200).json({ data: result });
        }
      }

      const fetchPromise = (async () => {
        let query = db.collection(collectionPath).where('term', '==', parseInt(termToUse, 10));

        if (statusFilter) {
          if (String(statusFilter).startsWith('exact:')) {
            const exactStatusRaw = String(statusFilter).replace('exact:', '').trim();
            query = query.where('status', '==', exactStatusRaw);
          } else {
            const statusArray = String(statusFilter).split(',').map(s => s.trim().toLowerCase()).filter(Boolean);
            if (statusArray.length > 0) {
              query = query.where('subStatus', 'in', statusArray);
            }
          }
        } else {
          query = query.where('subStatus', 'in', acceptedRejectedSubStatuses);
        }

        if (category) {
          query = query.where('category', 'array-contains', category);
        }

        if (documentTypeFilter) {
          const subTypes = String(documentTypeFilter).split(',').map(type => type.trim().toLowerCase()).filter(Boolean);
          if (subTypes.length > 0) {
            query = query.where('subType', 'in', subTypes);
          }
        }

        if (processStartDateAfter) {
          const startDate = new Date(processStartDateAfter);
          query = query.where('firstSeenAt', '>=', startDate);
        }

        if (hideNoDocument === 'true') {
          query = query.where('noDocument', '==', false);
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
          return { legislations: [], nextCursor: null };
        }

        const legislations = snapshot.docs.map(doc => {
          const docData = doc.data();
          return raw === 'true'
            ? { id: doc.id, ...docData }
            : { id: doc.id, ...localizeDocument(docData, lang, defaultLang, { noTitleFallback, noSummaryFallback }) };
        });

        const newLastVisibleDocId = snapshot.docs[snapshot.docs.length - 1]?.id || null;
        return { legislations, nextCursor: newLastVisibleDocId };
      })();

      cache.set(cacheKey, { promise: fetchPromise, timestamp: Date.now() });
      const result = await fetchPromise;
      return res.status(200).json({ data: result });
    } catch (error) {
      console.error(`[${country}_getLegislations] Błąd:`, error);
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
  createLegislationsHandler,
  localizeLegislationDocument,
};
