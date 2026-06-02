const admin = require('firebase-admin');
const { DEFAULT_CACHE_TTL_SECONDS } = require('../config/cache');
const { normalizeLang } = require('./home_screen_v2');

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();
const cache = new Map();
const DEFAULT_SUPPORTED_LANGS = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];

function toDateMillis(value) {
  if (!value) return 0;
  if (typeof value.toMillis === 'function') return value.toMillis();
  if (typeof value.toDate === 'function') return value.toDate().getTime();
  if (value instanceof Date) return value.getTime();
  if (typeof value._seconds === 'number') return value._seconds * 1000;
  if (typeof value.seconds === 'number') return value.seconds * 1000;
  const parsed = Date.parse(value);
  return Number.isNaN(parsed) ? 0 : parsed;
}

function toIsoString(value) {
  if (!value) return null;
  if (typeof value === 'string') return value;
  if (typeof value.toDate === 'function') return value.toDate().toISOString();
  if (value instanceof Date) return value.toISOString();
  if (typeof value._seconds === 'number') return new Date(value._seconds * 1000).toISOString();
  if (typeof value.seconds === 'number') return new Date(value.seconds * 1000).toISOString();
  return null;
}

function createDeputyDetailsHandler(config = {}) {
  const {
    country,
    defaultLang = 'eng',
    supportedLangs = DEFAULT_SUPPORTED_LANGS,
    cacheTtlSeconds = DEFAULT_CACHE_TTL_SECONDS,
    deputyCollectionPath = `global_deputies/${country}/members`,
    sponsorsCollectionPath = `global_sponsors/${country}/process`,
    votingRecordsCollectionGroup = 'voting_records',
    mapDeputyProfile = profile => profile,
  } = config;

  if (!country) {
    throw new Error("createDeputyDetailsHandler requires 'country' config.");
  }

  return async (req, res) => {
    if (req.body.warmup === true) {
      console.log(`${country}_getDeputyDetails: Otrzymano żądanie rozgrzewające.`);
      return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }

    try {
      const data = req.body.data || req.body;
      const {
        id: deputyId,
        dataType = 'votings',
        term: requestedTerm,
        limit,
        startAfterDocId,
        lang: requestedLang,
      } = data;

      const requestedLimit = parseInt(limit, 10) || 10;
      const lang = normalizeLang(requestedLang, defaultLang, supportedLangs);

      const cacheKey = `${country}-deputy-details-${deputyId}-${dataType}-${requestedTerm}-${lang}-${requestedLimit}-${startAfterDocId || 'firstPage'}`;
      if (cache.has(cacheKey)) {
        const cachedEntry = cache.get(cacheKey);
        const ageSeconds = (Date.now() - cachedEntry.timestamp) / 1000;
        if (ageSeconds < cacheTtlSeconds) {
          console.log(`[Cache] Serving from cache for key: ${cacheKey}`);
          const result = await cachedEntry.promise;
          return res.status(200).json({ data: result });
        }
      }

      const fetchPromise = (async () => {
        if (!deputyId) {
          throw { status: 400, code: 'invalid-argument', message: 'Brak wymaganego parametru ID posła.' };
        }

        const responseData = {};
        const deputyDoc = await db.collection(deputyCollectionPath).doc(deputyId).get();
        if (deputyDoc.exists) {
          Object.assign(responseData, mapDeputyProfile(deputyDoc.data()));
        } else {
          console.warn(`[${country}_getDeputyDetails] Nie znaleziono profilu posła dla ID: ${deputyId}`);
        }

        const deputyIdWithoutTerm = deputyId.split('_').pop();
        const termFromDeputyId = parseInt(deputyId.split('_')[0], 10);
        const normalizedSponsorId = `${termFromDeputyId}_${deputyIdWithoutTerm}`;

        if (dataType === 'votings') {
          if (!termFromDeputyId || !deputyIdWithoutTerm) {
            throw { status: 400, code: 'invalid-argument', message: 'Nieprawidłowy format ID posła. Oczekiwano {term}_{id}.' };
          }

          const searchableDeputyId = `deputy_${termFromDeputyId}_${deputyIdWithoutTerm}`;
          let votingsQuery = db.collectionGroup(votingRecordsCollectionGroup)
            .where('parliament', '==', country)
            .where('participantIds', 'array-contains', searchableDeputyId)
            .where('term', '==', termFromDeputyId)
            .orderBy('votingDate', 'desc');

          if (startAfterDocId) {
            console.log(`[Pagination] Attempting to start after document with id: ${startAfterDocId}`);
            const cursorQuery = db.collectionGroup(votingRecordsCollectionGroup)
              .where('parliament', '==', country)
              .where('id', '==', startAfterDocId)
              .limit(1);
            const cursorSnapshot = await cursorQuery.get();
            if (!cursorSnapshot.empty) {
              const lastVisibleDoc = cursorSnapshot.docs[0];
              console.log(`[Pagination] Found cursor document at path: ${lastVisibleDoc.ref.path}`);
              votingsQuery = votingsQuery.startAfter(lastVisibleDoc);
            } else {
              console.warn(`[Pagination] Could not find a document with id: ${startAfterDocId}. Returning first page.`);
            }
          }

          votingsQuery = votingsQuery.limit(requestedLimit + 1);

          const sponsorsCountQuery = db.collection(sponsorsCollectionPath)
            .where('term', '==', termFromDeputyId)
            .where('sponsors', 'array-contains', deputyIdWithoutTerm)
            .count();

          const cosponsorsCountQuery = db.collection(sponsorsCollectionPath)
            .where('term', '==', termFromDeputyId)
            .where('cosponsors', 'array-contains', deputyIdWithoutTerm)
            .count();

          const [votingsSnapshot, sCountSnap, cCountSnap] = await Promise.all([
            votingsQuery.get(),
            sponsorsCountQuery.get(),
            cosponsorsCountQuery.get(),
          ]);

          responseData.sponsoredBillsCount = sCountSnap.data().count;
          responseData.cosponsoredBillsCount = cCountSnap.data().count;

          const votings = [];
          for (const voteDoc of votingsSnapshot.docs) {
            const voteData = voteDoc.data();
            const participants = Array.isArray(voteData.participants) ? voteData.participants : [];
            const participant = participants.find((p) => {
              const participantId = typeof p.deputyId === 'string' ? p.deputyId.trim() : '';
              return participantId === deputyIdWithoutTerm.trim() || participantId === searchableDeputyId;
            });

            if (participant) {
              votings.push({
                id: voteData.id || voteDoc.id,
                legislationId: voteData.legislationId,
                votingUrl: voteData.votingUrl || null,
                title: voteData[`${lang}_ai_title`] || voteData.titleOfficial || 'No public official document is available',
                votingDate: toIsoString(voteData.votingDate),
                deputyActualVote: participant.vote || 'No data',
              });
            }
          }

          responseData.hasMoreVotings = votings.length > requestedLimit;
          if (responseData.hasMoreVotings) votings.pop();
          responseData.votings = votings;
          responseData.lastVoteId = votings.length > 0 ? votings[votings.length - 1].id : null;
        } else if (dataType === 'sponsorships') {
          if (!requestedTerm) {
            throw { status: 400, code: 'invalid-argument', message: "Brak wymaganego parametru 'term' dla sponsorów." };
          }

          const termAsNumber = parseInt(requestedTerm, 10);
          const sponsorsQuery = db.collection(sponsorsCollectionPath)
            .where('term', '==', termAsNumber)
            .where('sponsors', 'array-contains', normalizedSponsorId);

          const cosponsorsQuery = db.collection(sponsorsCollectionPath)
            .where('term', '==', termAsNumber)
            .where('cosponsors', 'array-contains', normalizedSponsorId);

          const [sponsorsSnapshot, cosponsorsSnapshot] = await Promise.all([
            sponsorsQuery.get(),
            cosponsorsQuery.get(),
          ]);

          responseData.sponsoredBillsCount = sponsorsSnapshot.size;
          responseData.cosponsoredBillsCount = cosponsorsSnapshot.size;
          console.log(`[DEBUG_${country.toUpperCase()}_COUNTS] ID: ${deputyId} | Sponsored: ${responseData.sponsoredBillsCount} | Cosponsored: ${responseData.cosponsoredBillsCount}`);

          const allSponsorships = new Map();
          sponsorsSnapshot.forEach(doc => {
            allSponsorships.set(doc.id, { ...doc.data(), sponsorshipType: 'sponsor', id: doc.id });
          });
          cosponsorsSnapshot.forEach(doc => {
            if (!allSponsorships.has(doc.id)) {
              allSponsorships.set(doc.id, { ...doc.data(), sponsorshipType: 'cosponsor', id: doc.id });
            }
          });

          const sortedSponsorships = Array.from(allSponsorships.values())
            .sort((a, b) => toDateMillis(b.lastUpdated) - toDateMillis(a.lastUpdated));

          let startIndex = 0;
          if (startAfterDocId) {
            const foundIndex = sortedSponsorships.findIndex(item => item.id === startAfterDocId);
            if (foundIndex !== -1) startIndex = foundIndex + 1;
          }

          const paginatedSponsorships = sortedSponsorships.slice(startIndex, startIndex + requestedLimit + 1);
          const sponsorshipsPreview = paginatedSponsorships.map(item => ({
            id: item.id,
            title: item[`${lang}_ai_title`] || item.titleOfficial || 'No public official document is available',
            sponsorshipType: item.sponsorshipType,
          }));

          responseData.hasMoreInterpellations = sponsorshipsPreview.length > requestedLimit;
          if (responseData.hasMoreInterpellations) sponsorshipsPreview.pop();
          responseData.interpellationsPreview = sponsorshipsPreview;
          responseData.lastInterpellationId = sponsorshipsPreview.length > 0
            ? sponsorshipsPreview[sponsorshipsPreview.length - 1].id
            : null;
        } else {
          throw {
            status: 400,
            code: 'invalid-argument',
            message: "Nieprawidłowy parametr 'dataType'. Dozwolone wartości: 'votings', 'sponsorships'.",
          };
        }

        return responseData;
      })();

      cache.set(cacheKey, { promise: fetchPromise, timestamp: Date.now() });
      const result = await fetchPromise;
      return res.status(200).json({ data: result });
    } catch (error) {
      console.error(`[${country}_getDeputyDetails] Error:`, error);
      if (error.status && error.code) {
        return res.status(error.status).json({ error: { code: error.code, message: error.message } });
      }
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
  createDeputyDetailsHandler,
};
