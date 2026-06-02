const admin = require('firebase-admin');
const { DEFAULT_CACHE_TTL_SECONDS } = require('../config/cache');

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();
const cache = new Map();

const LANG_ALIASES = {
  polish: 'pl',
  pol: 'pl',
  pl: 'pl',
  english: 'eng',
  eng: 'eng',
  en: 'eng',
  german: 'de',
  ger: 'de',
  deu: 'de',
  de: 'de',
  italian: 'it',
  ita: 'it',
  it: 'it',
  portuguese: 'pt',
  por: 'pt',
  pt: 'pt',
  french: 'fr',
  fre: 'fr',
  fra: 'fr',
  fr: 'fr',
  dutch: 'nl',
  dut: 'nl',
  nld: 'nl',
  nl: 'nl',
  spanish: 'es',
  spa: 'es',
  es: 'es',
};

function normalizeLang(requestedLang, defaultLang = 'eng', supportedLangs = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es']) {
  if (!requestedLang) return defaultLang;

  const normalized = String(requestedLang).toLowerCase();
  const mapped = LANG_ALIASES[normalized];

  if (mapped && supportedLangs.includes(mapped)) {
    return mapped;
  }

  if (supportedLangs.includes(normalized)) {
    return normalized;
  }

  return defaultLang;
}

function timestampToIsoString(value) {
  if (!value) return null;
  if (typeof value === 'string') return value;
  if (value instanceof Date) return value.toISOString();
  if (typeof value.toDate === 'function') return value.toDate().toISOString();
  if (typeof value._seconds === 'number') return new Date(value._seconds * 1000).toISOString();
  if (typeof value.seconds === 'number') return new Date(value.seconds * 1000).toISOString();
  return value;
}

function timestampToDateOnlyString(value) {
  const isoValue = timestampToIsoString(value);
  return typeof isoValue === 'string' ? isoValue.split('T')[0] : '';
}

function normalizeDeputyForClient(deputy) {
  if (!deputy) return deputy;

  return {
    ...deputy,
    birthDate: timestampToDateOnlyString(deputy.birthDate),
  };
}

function removeLocalizedSourceFields(data) {
  Object.keys(data).forEach((key) => {
    if (key.includes('_summary') || key.includes('_key_points') || key.includes('_ai_title')) {
      delete data[key];
    }
  });
}

function localizeFullLegislation(data, langCode, config) {
  if (!data || !data.id) return null;

  const defaultLang = config.defaultLang || 'eng';
  const noTitleFallback = config.noTitleFallback || 'No title';
  const noSummaryFallback = config.noSummaryFallback || 'We are sorry! No summary available at the moment.';
  const localizedData = { ...data };

  localizedData.title =
    data[`${langCode}_ai_title`] ||
    data[`${defaultLang}_ai_title`] ||
    data.titleOfficial ||
    data.title ||
    noTitleFallback;

  localizedData.description =
    data[`${langCode}_summary`] ||
    data[`${defaultLang}_summary`] ||
    data.description ||
    noSummaryFallback;

  const keyPoints = data[`${langCode}_key_points`] || data[`${defaultLang}_key_points`] || [];
  localizedData.key_Points = Array.isArray(keyPoints) ? keyPoints : [];

  removeLocalizedSourceFields(localizedData);

  return localizedData;
}

function createHomeScreenDataV2Handler(config) {
  const {
    country,
    defaultLang = 'eng',
    supportedLangs = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'],
    cacheTtlSeconds = DEFAULT_CACHE_TTL_SECONDS,
  } = config;

  if (!country) {
    throw new Error('createHomeScreenDataV2Handler requires config.country');
  }

  return async (req, res) => {
    if (req.body.warmup === true) {
      return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }

    try {
      const data = req.body.data || req.body;
      const { lang: requestedLang, term: requestedTerm } = data;

      if (!requestedTerm) {
        return res.status(400).json({ error: { code: 'invalid-argument', message: "Brak parametru 'term'." } });
      }

      const lang = normalizeLang(requestedLang, defaultLang, supportedLangs);
      const cacheKey = `${country}-homescreen-v2-${requestedTerm}-${lang}`;

      if (cache.has(cacheKey)) {
        const cachedEntry = cache.get(cacheKey);
        const ageSeconds = (Date.now() - cachedEntry.timestamp) / 1000;
        if (ageSeconds < cacheTtlSeconds) {
          console.log(`[UnifiedHomeScreenV2][${country}] Cache HIT: ${cacheKey}`);
          const result = await cachedEntry.promise;
          return res.status(200).json({ data: result });
        }
      }

      const fetchPromise = (async () => {
        const collectionPath = `home_screens/${country}/feed`;
        const docId = `${requestedTerm}_dashboard_v2`;
        const docSnap = await db.collection(collectionPath).doc(docId).get();

        if (!docSnap.exists) {
          console.warn(`[UnifiedHomeScreenV2][${country}] Document not found: ${collectionPath}/${docId}`);
          return null;
        }

        const rawData = docSnap.data();

        return {
          popularVoted: localizeFullLegislation(rawData.popularVoted, lang, config),
          upcomingVote: localizeFullLegislation(rawData.upcomingVote, lang, config),
          popularInProcess: localizeFullLegislation(rawData.popularInProcess, lang, config),
          civicProject: localizeFullLegislation(rawData.civicProject, lang, config),
          topDeputies: {
            deputies: (rawData.topDeputies?.deputies || []).map(normalizeDeputyForClient),
            lastUpdated: timestampToIsoString(rawData.topDeputies?.lastUpdated) || null,
          },
        };
      })();

      cache.set(cacheKey, { promise: fetchPromise, timestamp: Date.now() });
      const result = await fetchPromise;
      return res.status(200).json({ data: result });
    } catch (error) {
      console.error(`[UnifiedHomeScreenV2][${country}] Critical error:`, error);
      return res.status(500).json({ error: { code: 'internal', message: 'Wystąpił wewnętrzny błąd serwera.' } });
    }
  };
}

module.exports = {
  createHomeScreenDataV2Handler,
  normalizeLang,
  timestampToIsoString,
  normalizeDeputyForClient,
  localizeFullLegislation,
};
