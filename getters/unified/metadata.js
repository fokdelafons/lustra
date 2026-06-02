const admin = require('firebase-admin');

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();

function parseTerm(value, fallback = null) {
  const parsed = parseInt(value, 10);
  return Number.isFinite(parsed) ? parsed : fallback;
}

function createMetadataHandler({
  country,
  defaultTerm,
  termMetadataPath = `metadata/${country}/term_metadata`,
  termClubsPath = `metadata/${country}/term_metadata`,
  termClubsDocPrefix = 'term_clubs_',
}) {
  if (!country) {
    throw new Error('createMetadataHandler requires country');
  }
  if (defaultTerm === undefined || defaultTerm === null) {
    throw new Error(`createMetadataHandler(${country}) requires defaultTerm`);
  }

  async function fetchCurrentTerm() {
    console.log(`[${country}_getMetadata] Pobieranie current_term z Firestore.`);
    const doc = await db.collection(termMetadataPath).doc('last_update').get();
    const data = doc.exists ? doc.data() : null;
    const currentTerm = data?.currentTerm ?? defaultTerm;
    return { currentTerm, status: 'OK' };
  }

  async function fetchTermClubs(term) {
    const normalizedTerm = parseTerm(term, term);
    console.log(`[${country}_getMetadata] Pobieranie klubów dla kadencji: ${normalizedTerm}`);

    const termClubsDocId = `${termClubsDocPrefix}${normalizedTerm}`;
    const termClubsDoc = await db.collection(termClubsPath).doc(termClubsDocId).get();

    if (!termClubsDoc.exists) {
      const error = new Error('No club data available for the specified term');
      error.statusCode = 404;
      error.details = {
        term: parseTerm(normalizedTerm),
        clubs: [],
        status: 'NOT_FOUND',
      };
      throw error;
    }

    return {
      term: parseTerm(normalizedTerm),
      clubs: termClubsDoc.data().clubs || [],
      status: 'OK',
    };
  }

  async function fetchGeneralMetadata() {
    console.log(`[${country}_getMetadata] Pobieranie metadanych ogólnych z Firestore.`);
    const doc = await db.collection(termMetadataPath).doc('last_update').get();

    if (!doc.exists) {
      return {
        currentTerm: defaultTerm,
        lastUpdated: null,
        availableTerms: [],
        status: 'No general metadata available yet',
      };
    }

    return { ...doc.data(), status: 'OK' };
  }

  async function fetchBootstrapData() {
    const generalMeta = await fetchGeneralMetadata();
    const currentTerm = generalMeta.currentTerm ?? defaultTerm;

    let clubsData;
    try {
      clubsData = await fetchTermClubs(currentTerm);
    } catch (error) {
      if (error.statusCode === 404) {
        console.log(`[${country}_getMetadata] Brak klubów dla kadencji ${currentTerm}, zwracam pustą listę.`);
        clubsData = { clubs: [] };
      } else {
        throw error;
      }
    }

    return {
      currentTerm,
      clubs: clubsData.clubs,
      lastUpdated: generalMeta.lastUpdated,
      availableTerms: generalMeta.availableTerms || [],
    };
  }

  return async function getMetadata(req, res) {
    if (req.body.warmup === true) {
      console.log(`${country}_getMetadata: Otrzymano żądanie rozgrzewające.`);
      return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }

    const data = req.body.data || req.body;
    const { type, term } = data;

    try {
      let result;

      if (type === 'term_clubs') {
        const currentTermData = term ? null : await fetchCurrentTerm();
        const termToFetch = term || currentTermData.currentTerm;

        if (!termToFetch) {
          return res.status(400).json({
            error: {
              code: 'invalid-argument',
              message: 'Term not specified and default term could not be determined.',
            },
          });
        }

        try {
          result = await fetchTermClubs(termToFetch);
        } catch (termError) {
          if (termError.statusCode === 404) {
            console.log(`[${country}_getMetadata] Brak klubów dla kadencji ${termToFetch}, zwracam pustą listę.`);
            result = { clubs: [] };
          } else {
            throw termError;
          }
        }
      } else if (type === 'current_term') {
        result = await fetchCurrentTerm();
      } else {
        result = await fetchBootstrapData();
      }

      return res.status(200).json({ data: result });
    } catch (error) {
      console.error(`[${country}_getMetadata] Błąd dla zapytania:`, {
        type,
        term,
        error: error.message,
      });

      if (error.statusCode === 404) {
        return res.status(404).json({
          error: {
            code: 'not-found',
            message: 'No data available.',
            details: error.details,
          },
        });
      }

      return res.status(500).json({
        error: {
          code: 'internal',
          message: 'An internal server error occurred.',
          originalError: error.message,
        },
      });
    }
  };
}

module.exports = {
  createMetadataHandler,
};
