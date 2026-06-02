const admin = require('firebase-admin');
const { DEFAULT_CACHE_TTL_SECONDS } = require('../config/cache');

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();
const cache = new Map();

function createDeputiesHandler(config = {}) {
  const {
    country,
    cacheTtlSeconds = DEFAULT_CACHE_TTL_SECONDS,
    collectionPath = `global_deputies/${country}/members`,
    defaultLimit = 15,
    mapDeputy = deputy => deputy,
  } = config;

  if (!country) {
    throw new Error("createDeputiesHandler requires 'country' config.");
  }

  return async (req, res) => {
    if (req.body.warmup === true) {
      console.log(`${country}_getDeputies: Otrzymano żądanie rozgrzewające.`);
      return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }

    try {
      const data = req.body.data || req.body;
      const { club, term: requestedTerm, sortBy, limit: rawLimit, lastVisibleDocId } = data;
      const limit = parseInt(rawLimit, 10) || defaultLimit;

      if (!requestedTerm) {
        return res.status(400).json({
          error: {
            code: 'invalid-argument',
            message: "Brak wymaganego parametru 'term'.",
          },
        });
      }

      const cacheKey = `${country}-deputies-${requestedTerm}-${club || 'all'}-${sortBy || 'popularity'}-${limit}-${lastVisibleDocId || 'firstPage'}`;
      if (cache.has(cacheKey)) {
        const cachedEntry = cache.get(cacheKey);
        if ((Date.now() - cachedEntry.timestamp) / 1000 < cacheTtlSeconds) {
          const result = await cachedEntry.promise;
          return res.status(200).json({ data: result });
        }
      }

      const fetchPromise = (async () => {
        let query = db.collection(collectionPath);
        const termPrefix = `${requestedTerm}_`;
        query = query
          .where(admin.firestore.FieldPath.documentId(), '>=', termPrefix)
          .where(admin.firestore.FieldPath.documentId(), '<', termPrefix + '\uf8ff');

        if (club) {
          query = query.where('club', '==', club);
        }

        if (sortBy === 'attendance') {
          query = query.orderBy('votingStats.attendance_percentage', 'asc');
        } else {
          query = query.orderBy('popularity', 'desc');
        }

        if (lastVisibleDocId) {
          const lastDoc = await db.collection(collectionPath).doc(lastVisibleDocId).get();
          if (lastDoc.exists) {
            query = query.startAfter(lastDoc);
          }
        }

        query = query.limit(limit);
        const snapshot = await query.get();
        const deputies = snapshot.docs.map(doc => mapDeputy({ id: doc.id, ...doc.data() }));
        const newLastVisibleDocId = snapshot.docs[snapshot.docs.length - 1]?.id || null;
        return { deputies, nextCursor: newLastVisibleDocId };
      })();

      cache.set(cacheKey, { promise: fetchPromise, timestamp: Date.now() });
      const result = await fetchPromise;
      return res.status(200).json({ data: result });
    } catch (error) {
      console.error(`[${country}_getDeputies] Błąd podczas pobierania posłów:`, error);
      return res.status(500).json({
        error: {
          code: 'internal',
          message: 'Wystąpił wewnętrzny błąd serwera.',
        },
      });
    }
  };
}

// TODO(PL/UK temporary): remove this mapper after deputy birthDate is migrated
// from Firestore Timestamp/map to the same String|null shape used by the unified schema.
function mapDeputyTemporaryBirthDate(deputy) {
  if (!deputy || !deputy.birthDate || typeof deputy.birthDate === 'string') {
    return deputy;
  }

  const mappedDeputy = { ...deputy };
  const birthDate = mappedDeputy.birthDate;

  if (typeof birthDate.toDate === 'function') {
    mappedDeputy.birthDate = birthDate.toDate().toISOString().split('T')[0];
    return mappedDeputy;
  }

  if (typeof birthDate._seconds === 'number') {
    mappedDeputy.birthDate = new Date(birthDate._seconds * 1000).toISOString().split('T')[0];
    return mappedDeputy;
  }

  if (typeof birthDate.seconds === 'number') {
    mappedDeputy.birthDate = new Date(birthDate.seconds * 1000).toISOString().split('T')[0];
    return mappedDeputy;
  }

  mappedDeputy.birthDate = null;
  return mappedDeputy;
}

const mapPlDeputyTemporaryBirthDate = mapDeputyTemporaryBirthDate;

module.exports = {
  createDeputiesHandler,
  mapDeputyTemporaryBirthDate,
  mapPlDeputyTemporaryBirthDate,
};
