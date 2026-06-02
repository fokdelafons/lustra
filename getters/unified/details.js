const admin = require('firebase-admin');
const { normalizeLang } = require('./home_screen_v2');

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();

const DEFAULT_SUPPORTED_LANGS = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];
const DEFAULT_NO_TITLE_FALLBACK = 'No Title';
const DEFAULT_NO_SUMMARY_FALLBACK = 'We are sorry! No summary has been generated so far. The official source text may be unavailable. If so, you can help by submitting a transparency request using our form.';

function localizeDetailsDocument(docData, langCode, defaultLang, config = {}) {
  if (!docData) return null;

  const noTitleFallback = config.noTitleFallback || DEFAULT_NO_TITLE_FALLBACK;
  const noSummaryFallback = config.noSummaryFallback || DEFAULT_NO_SUMMARY_FALLBACK;

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

function createDetailsHandler(config) {
  const {
    country,
    defaultLang = 'eng',
    supportedLangs = DEFAULT_SUPPORTED_LANGS,
    billCollectionPath = `global_legislations/${country}/process`,
    deputyCollectionPath = `global_deputies/${country}/members`,
    civicCollectionPath = `global_civic/${country}/process`,
    enableCivic = true,
    localizeDocument = localizeDetailsDocument,
    notFoundMessages = {},
    invalidTypeMessage = "Nieprawidłowy parametr 'type'. Użyj 'bill' lub 'deputy'.",
    noTitleFallback,
    noSummaryFallback,
    mapDeputy = deputy => deputy,
  } = config;

  if (!country) {
    throw new Error('createDetailsHandler requires config.country');
  }

  return async function getDetails(req, res) {
    if (req.body.warmup === true) {
      console.log(`${country}_getDetails: Otrzymano żądanie rozgrzewające.`);
      return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }

    try {
      const data = req.body.data || req.body;
      const { type, id, lang: requestedLangParam } = data;

      if (!type || !id) {
        return res.status(400).json({
          error: {
            code: 'invalid-argument',
            message: "Brak wymaganego parametru 'type' lub 'id'.",
          },
        });
      }

      const lang = normalizeLang(requestedLangParam, defaultLang, supportedLangs);

      let docSnap;
      let documentData;

      switch (type) {
        case 'bill':
          docSnap = await db.collection(billCollectionPath).doc(id).get();
          if (!docSnap.exists) {
            return res.status(404).json({
              error: {
                code: 'not-found',
                message: notFoundMessages.bill || 'Nie znaleziono ustawy o podanym ID.',
              },
            });
          }
          documentData = localizeDocument(docSnap.data(), lang, defaultLang, { noTitleFallback, noSummaryFallback });
          break;

        case 'deputy':
          docSnap = await db.collection(deputyCollectionPath).doc(id).get();
          if (!docSnap.exists) {
            return res.status(404).json({
              error: {
                code: 'not-found',
                message: notFoundMessages.deputy || 'Nie znaleziono posła o podanym ID.',
              },
            });
          }
          documentData = mapDeputy(docSnap.data());
          break;

        case 'civic':
          if (!enableCivic) {
            return res.status(400).json({
              error: {
                code: 'invalid-argument',
                message: invalidTypeMessage,
              },
            });
          }
          docSnap = await db.collection(civicCollectionPath).doc(id).get();
          if (!docSnap.exists) {
            return res.status(404).json({
              error: {
                code: 'not-found',
                message: notFoundMessages.civic || 'Nie znaleziono projektu obywatelskiego.',
              },
            });
          }
          documentData = localizeDocument(docSnap.data(), lang, defaultLang, { noTitleFallback, noSummaryFallback });
          break;

        default:
          return res.status(400).json({
            error: {
              code: 'invalid-argument',
              message: invalidTypeMessage,
            },
          });
      }

      return res.status(200).json({ data: { id, ...documentData } });
    } catch (error) {
      console.error(`[${country}_getDetails] Błąd:`, error);
      return res.status(500).json({
        error: {
          code: 'internal',
          message: 'Wystąpił wewnętrzny błąd serwera.',
        },
      });
    }
  };
}

module.exports = {
  createDetailsHandler,
  localizeDetailsDocument,
};
