const admin = require('firebase-admin');

if (!admin.apps.length) {
  admin.initializeApp();
}
const db = admin.firestore();
const cache = new Map();
const CACHE_TTL_SECONDS = 6000;
const HOME_SCREEN_COLLECTION = 'ue_home_screen';
const DOC_ID_POPULAR_VOTED = 'mostPopularVoted';
const DOC_ID_UPCOMING_VOTE = 'topUpcomingVote';
const DOC_ID_POPULAR_IN_PROCESS = 'mostPopularInProcess';
const DOC_ID_TOP_DEPUTIES = 'topDeputies';

// --- GETMETADATA ---

const getMetadata = async (req, res) => {
  const data = req.body.data || req.body;

  try {
    if (req.body.warmup === true) {
      console.log("ue_getMetadata: Otrzymano żądanie rozgrzewające. Zwracam sukces.");
      return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }
    
    const { type, term } = data;
    let result;

    if (type === 'term_clubs') {
      let termToFetch = term;
      if (!termToFetch) {
        const currentTermData = await fetchCurrentTerm();
        termToFetch = currentTermData.currentTerm;
      }
      if (!termToFetch) {
        return res.status(400).json({ 
            error: { 
                code: 'invalid-argument', 
                message: 'Term not specified and default term could not be determined.' 
            } 
        });
      }
      result = await fetchTermClubs(termToFetch);

    } else if (type === 'current_term') {
      result = await fetchCurrentTerm();

    } else {
      result = await fetchBootstrapData();
    }
    
    return res.status(200).json({ data: result });

  } catch (error) {
    console.error(`[ue_getMetadata] Błąd dla zapytania:`, { type: data.type, term: data.term, error: error.message });

    if (error.statusCode === 404) {
      return res.status(404).json({ 
        error: { 
          code: 'not-found', 
          message: 'No data available.',
          details: error.details
        } 
      });
    }

    return res.status(500).json({ 
      error: { 
        code: 'internal', 
        message: 'An internal server error occurred.', 
        originalError: error.message 
      } 
    });
  }
};

async function fetchCurrentTerm() {
  try {
    console.log(`Pobieranie current_term z Firestore.`);
    const doc = await db.collection('ue_metadata').doc('last_update').get();
    const currentTerm = doc.exists() ? doc.data().currentTerm : 10;
    return { currentTerm, status: 'OK' };
  } catch (error) {
    console.error('[fetchCurrentTerm] Błąd:', error);
    throw error;
  }
}

async function fetchTermClubs(term) {
  try {
    console.log(`Pobieranie danych o klubach dla kadencji: ${term} z Firestore.`);
    const termClubsDocId = `term_clubs_${term}`;
    const termClubsDoc = await db.collection('ue_metadata').doc(termClubsDocId).get();

    if (!termClubsDoc.exists) {
      const error = new Error('No club data available for the specified term');
      error.statusCode = 404;
      error.details = { term: parseInt(term, 10), clubs: [], status: 'NOT_FOUND' };
      throw error;
    }

    return {
      term: parseInt(term, 10),
      clubs: termClubsDoc.data().clubs || [],
      status: 'OK'
    };
  } catch (error) {
      console.error(`[fetchTermClubs] Błąd dla kadencji ${term}:`, error);
      throw error;
  }
}

async function fetchBootstrapData() {
    try {
        console.log(`Pobieranie danych startowych (bootstrap) z Firestore.`);
        const generalMeta = await fetchGeneralMetadata();
        const currentTerm = generalMeta.currentTerm;

        let clubsData;
        try {
            clubsData = await fetchTermClubs(currentTerm);
        } catch (error) {
            if (error.statusCode === 404) {
                console.log(`[Bootstrap] Brak danych o klubach dla kadencji ${currentTerm}, zwracanie pustej listy.`);
                clubsData = { clubs: [] };
            } else {
                throw error; 
            }
        }
        const availableTerms = generalMeta.availableTerms || [];
        return {
            currentTerm: currentTerm,
            clubs: clubsData.clubs,
            lastUpdated: generalMeta.lastUpdated,
            availableTerms: availableTerms,
        };
    } catch (error) {
        console.error('[fetchBootstrapData] Błąd:', error);
        throw error;
    }
}

async function fetchGeneralMetadata() {
  try {
    console.log(`Pobieranie domyślnych metadanych z Firestore.`);
    const doc = await db.collection('ue_metadata').doc('last_update').get();
    if (!doc.exists) {
      return {
        currentTerm: 10, lastUpdated: null, availableTerms: [],
        status: 'No general metadata available yet'
      };
    } else {
      return { ...doc.data(), status: 'OK' };
    }
  } catch (error) {
      console.error('[fetchGeneralMetadata] Błąd:', error);
      throw error;
  }
}

// --- GETHOMESCREENDATA ---

async function getHomeScreenDoc(docId, langCode) {
  console.log(`[getHomeScreenDoc] Próba pobrania dokumentu: ${docId} dla języka: ${langCode}`);
  try {
    const docRef = db.collection(HOME_SCREEN_COLLECTION).doc(docId);
    const docSnap = await docRef.get();

    if (!docSnap.exists) {
      console.warn(`[getHomeScreenDoc] Dokument nie znaleziony: ${docId}`);
      return null;
    }
    console.log(`[getHomeScreenDoc] Pomyślnie pobrano dokument: ${docId}`);
    const originalData = docSnap.data();

    if (docId !== DOC_ID_TOP_DEPUTIES && originalData) {
      const localizedData = { ...originalData };

      localizedData.statusText = originalData.description || null;

      Object.keys(localizedData).forEach(key => {
        if (key.includes('_summary') || key.includes('_key_points') || key.includes('_ai_title')) {
          delete localizedData[key];
        }
      });

      localizedData.title = originalData[`${langCode}_ai_title`] || originalData[`ue_ai_title`] || originalData.title || 'Brak tytułu';
      localizedData.summary = originalData[`${langCode}_summary`] || originalData[`ue_summary`] || null;
      
      const keyPoints = originalData[`${langCode}_key_points`] || originalData[`ue_key_points`] || [];
      localizedData.key_points = Array.isArray(keyPoints) ? keyPoints : [];
      delete localizedData.description;
      return localizedData;
    }

    return originalData;
  } catch (error) {
    console.error(`[getHomeScreenDoc] Błąd podczas pobierania dokumentu ${docId}:`, error);
    return null;
  }
}

const getHomeScreenData = async (req, res) => {

  if (req.body.warmup === true) {
    console.log("ue_getHomeScreenData: Otrzymano żądanie rozgrzewające. Zwracam sukces.");
    return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
  }

  try {
    console.log("Wykonywanie funkcji ue_getHomeScreenData (handler Express)...");

    const data = req.body.data || req.body;

    const requestedLang = data.lang ? data.lang.toLowerCase() : null;
    const requestedTerm = data.term;

    if (!requestedTerm) {
      console.warn("Parametr 'term' nie został dostarczony w zapytaniu.");

      return res.status(400).json({ 
          error: { code: 'invalid-argument', message: "Brak wymaganego parametru 'term'." }
      });
    }

    const internalSupportedLangs = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];
    const defaultLang = 'pl';
    const langAliases = {
      'polish': 'pl', 'pol': 'pl', 'pl': 'pl',
      'english': 'eng', 'eng': 'eng', 'en': 'eng',
      'german': 'de', 'ger': 'de', 'deu': 'de', 'de': 'de',
      'italian': 'it', 'ita': 'it', 'it': 'it',
      'portuguese': 'pt', 'por': 'pt', 'pt': 'pt',
      'french': 'fr', 'fre': 'fr', 'fra': 'fr', 'fr': 'fr',
      'dutch': 'nl', 'dut': 'nl', 'nld': 'nl', 'nl': 'nl',
      'spanish': 'es', 'spa': 'es', 'es': 'es'
    };

    let lang = defaultLang;
    if (requestedLang && langAliases[requestedLang] && internalSupportedLangs.includes(langAliases[requestedLang])) {
      lang = langAliases[requestedLang];
    }
    const cacheKey = `homescreen-${requestedTerm}-${lang}`;
    if (cache.has(cacheKey)) {
      const cachedEntry = cache.get(cacheKey);
      const ageSeconds = (Date.now() - cachedEntry.timestamp) / 1000;
      if (ageSeconds < CACHE_TTL_SECONDS) {
        console.log(`[Cache HIT] Zwracanie danych dla zapytania: ${cacheKey}`);
        const result = await cachedEntry.promise;
        return res.status(200).json({ data: result });
      }
    }

    const fetchPromise = (async () => {
      const [ popularVotedData, upcomingVoteData, popularInProcessData, topDeputiesData ] = await Promise.all([
        getHomeScreenDoc(`${requestedTerm}_${DOC_ID_POPULAR_VOTED}`, lang),
        getHomeScreenDoc(`${requestedTerm}_${DOC_ID_UPCOMING_VOTE}`, lang),
        getHomeScreenDoc(`${requestedTerm}_${DOC_ID_POPULAR_IN_PROCESS}`, lang),
        getHomeScreenDoc(`${requestedTerm}_${DOC_ID_TOP_DEPUTIES}`, lang)
      ]);
      return { popularVoted: popularVotedData, upcomingVote: upcomingVoteData, popularInProcess: popularInProcessData, topDeputies: topDeputiesData };
    })();

    cache.set(cacheKey, { promise: fetchPromise, timestamp: Date.now() });
    
    const result = await fetchPromise;
    console.log("Pomyślnie pobrano dane home screen.");
    return res.status(200).json({ data: result });

  } catch (error) {
    console.error("KRYTYCZNY BŁĄD: Nie udało się pobrać danych home screen:", error);
    return res.status(500).json({ 
        error: { code: 'internal', message: 'Wystąpił wewnętrzny błąd serwera podczas pobierania danych.' }
    });
  }
};

// --- GETDETAILS ---

function localizeDocument(docData, langCode, defaultLang) {
    if (!docData) return null;
    const getLocalizedValue = (baseFieldName, isArray = false, fallbackValue = null) => {
        let value = docData[`${langCode}_${baseFieldName}`];
        if (value !== undefined && value !== null) return value;
        if (langCode !== defaultLang) {
            value = docData[`${defaultLang}_${baseFieldName}`];
            if (value !== undefined && value !== null) return value;
        }
        value = docData[baseFieldName];
        if (value !== undefined && value !== null) return value;
        if (fallbackValue !== null) return fallbackValue;
        return isArray ? [] : (baseFieldName.includes('title') ? 'Brak tytułu' : null);
    };
    const localized = {
        ...Object.keys(docData).reduce((acc, key) => {
            if (!key.match(/^(pl|eng|de|it|pt|fr|nl|es)_/)) {
                acc[key] = docData[key];
            }
            return acc;
        }, {}),
        title: getLocalizedValue('ai_title', false, getLocalizedValue('title', false, 'Brak tytułu')),
        description: getLocalizedValue('summary', false, getLocalizedValue('description')),
        key_Points: getLocalizedValue('key_points', true, []),
        statusText: docData.description ?? null
    };
    if (!Array.isArray(localized.key_Points)) {
        localized.key_Points = [];
    }
    return localized;
}


const getDetails = async (req, res) => {
    if (req.body.warmup === true) {
        console.log("ue_getDetails: Otrzymano żądanie rozgrzewające.");
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }

    try {
        const data = req.body.data || req.body;
        const { type, id, lang: requestedLangParam } = data;
        if (!type || !id) {
            return res.status(400).json({ error: { code: 'invalid-argument', message: "Brak wymaganego parametru 'type' lub 'id'." } });
        }

        const supportedLangs = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];
        const defaultLang = 'pl';
        const langAliases = {'polish': 'pl', 'pol': 'pl', 'pl': 'pl', 'english': 'eng', 'eng': 'eng', 'en': 'eng', 'german': 'de', 'ger': 'de', 'deu': 'de', 'de': 'de', 'italian': 'it', 'ita': 'it', 'it': 'it', 'portuguese': 'pt', 'por': 'pt', 'pt': 'pt', 'french': 'fr', 'fre': 'fr', 'fra': 'fr', 'fr': 'fr', 'dutch': 'nl', 'dut': 'nl', 'nld': 'nl', 'nl': 'nl', 'spanish': 'es', 'spa': 'es', 'es': 'es'};
        
        let lang = defaultLang;
        const normalizedLang = requestedLangParam ? requestedLangParam.toLowerCase() : null;
        if (normalizedLang && langAliases[normalizedLang] && supportedLangs.includes(langAliases[normalizedLang])) {
            lang = langAliases[normalizedLang];
        }

        let documentData;
        switch (type) {
            case 'bill':
                const legislationDoc = await db.collection('ue_legislations').doc(id).get();
                if (!legislationDoc.exists) {
                    return res.status(404).json({ error: { code: 'not-found', message: 'Nie znaleziono ustawy o podanym ID.' } });
                }
                documentData = localizeDocument(legislationDoc.data(), lang, defaultLang);
                break;
            case 'deputy':
                const deputyDoc = await db.collection('ue_deputies').doc(id).get();
                if (!deputyDoc.exists) {
                    return res.status(404).json({ error: { code: 'not-found', message: 'Nie znaleziono posła o podanym ID.' } });
                }
                documentData = deputyDoc.data();
                break;
            default:
                return res.status(400).json({ error: { code: 'invalid-argument', message: "Nieprawidłowy parametr 'type'. Użyj 'bill' lub 'deputy'." } });
        }
        
        return res.status(200).json({ data: { id, ...documentData } });

    } catch (error) {
        console.error('[ue_getDetails] Błąd:', error);
        return res.status(500).json({ error: { code: 'internal', message: 'Wystąpił wewnętrzny błąd serwera.' } });
    }
};

// --- GETDEPUTIES ---

const getDeputies = async (req, res) => {
    if (req.body.warmup === true) {
        console.log("ue_getDeputies: Otrzymano żądanie rozgrzewające.");
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }

    try {
        const data = req.body.data || req.body;
        const { club, term: requestedTerm, sortBy, limit: rawLimit, lastVisibleDocId } = data;
        const limit = parseInt(rawLimit) || 15;

        if (!requestedTerm) {
            return res.status(400).json({ error: { code: 'invalid-argument', message: "Brak wymaganego parametru 'term'." } });
        }
        
        let query = db.collection('ue_deputies');
        const termPrefix = `${requestedTerm}_`;
        query = query.where(admin.firestore.FieldPath.documentId(), '>=', termPrefix)
                     .where(admin.firestore.FieldPath.documentId(), '<', termPrefix + '\uf8ff');
        
        if (club) {
            query = query.where('club', '==', club);
        }
        
        if (sortBy === 'attendance') {
            query = query.orderBy('votingStats.attendance_percentage', 'asc');
        } else {
            query = query.orderBy('numberOfVotes', 'desc');
        }

        if (lastVisibleDocId) {
            const lastDoc = await db.collection('ue_deputies').doc(lastVisibleDocId).get();
            query = query.startAfter(lastDoc);
        }

        query = query.limit(limit);
        const snapshot = await query.get();

        const deputies = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
        const newLastVisibleDocId = snapshot.docs[snapshot.docs.length - 1]?.id || null;

        return res.status(200).json({ data: { deputies, nextCursor: newLastVisibleDocId } });

    } catch (error) {
        console.error('[ue_getDeputies] Błąd podczas pobierania posłów:', error);
        return res.status(500).json({ error: { code: 'internal', message: 'Wystąpił wewnętrzny błąd serwera.' } });
    }
};

// --- GETDEPUTYDETAILS ---

const getDeputyDetails = async (req, res) => {
    if (req.body.warmup === true) {
        console.log("ue_getDeputyDetails: Otrzymano żądanie rozgrzewające.");
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }

    try {
        const data = req.body.data || req.body;
        const { id: deputyId, dataType = 'votings', term: requestedTerm, limit, startAfterDocId, lang: requestedLang } = data;
        const requestedLimit = parseInt(limit, 10) || 10;
        
        const supportedLangs = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];
        const defaultLang = 'pl';
        const langAliases = {'polish': 'pl', 'pol': 'pl', 'pl': 'pl', 'english': 'eng', 'eng': 'eng', 'en': 'eng', 'german': 'de', 'ger': 'de', 'deu': 'de', 'de': 'de', 'italian': 'it', 'ita': 'it', 'it': 'it', 'portuguese': 'pt', 'por': 'pt', 'pt': 'pt', 'french': 'fr', 'fre': 'fr', 'fra': 'fr', 'fr': 'fr', 'dutch': 'nl', 'dut': 'nl', 'nld': 'nl', 'nl': 'nl', 'spanish': 'es', 'spa': 'es', 'es': 'es'};
        
        let lang = defaultLang;
        if (requestedLang && langAliases[requestedLang.toLowerCase()] && supportedLangs.includes(langAliases[requestedLang.toLowerCase()])) {
            lang = langAliases[requestedLang.toLowerCase()];
        }
        
        const cacheKey = `deputy-details-${deputyId}-${dataType}-${requestedTerm}-${lang}-${requestedLimit}-${startAfterDocId || 'firstPage'}`;
        if (cache.has(cacheKey)) {
            const cachedEntry = cache.get(cacheKey);
            const ageSeconds = (Date.now() - cachedEntry.timestamp) / 1000;
            if (ageSeconds < CACHE_TTL_SECONDS) {
                const result = await cachedEntry.promise;
                return res.status(200).json({ data: result });
            }
        }

        const fetchPromise = (async () => {
            if (!deputyId) {
                throw { status: 400, code: 'invalid-argument', message: 'Brak wymaganego parametru ID posła.' };
            }
            if (!requestedTerm && dataType === 'interpellations') {
                throw { status: 400, code: 'invalid-argument', message: "Brak wymaganego parametru 'term' dla interpelacji." };
            }

            const responseData = {};
            if (dataType === 'votings') {
                const deputyIdPartsForTermExtraction = deputyId.split('_');
                const termFromDeputyId = deputyIdPartsForTermExtraction.length > 1 ? parseInt(deputyIdPartsForTermExtraction[0], 10) : null;
                if (termFromDeputyId === null) {
                    throw { status: 400, code: 'invalid-argument', message: 'Nieprawidłowy format ID posła dla głosowań. Oczekiwano {term}_{id}.' };
                }
                const searchableDeputyId = `deputy_${deputyId}`;
                let votingsQuery = db.collection('ue_votes')
                    .where('participantIds', 'array-contains', searchableDeputyId)
                    .where('term', '==', termFromDeputyId)
                    .where('documentType', '==', 'projekt ustawy')
                    .orderBy('votingDate', 'desc');
                if (startAfterDocId) {
                    const lastVisibleDoc = await db.collection('ue_votes').doc(startAfterDocId).get();
                    if (lastVisibleDoc.exists) votingsQuery = votingsQuery.startAfter(lastVisibleDoc);
                }
                votingsQuery = votingsQuery.limit(requestedLimit + 1);
                const votingsSnapshot = await votingsQuery.get();
                const votings = [];
                votingsSnapshot.forEach(voteDoc => {
                    const voteData = voteDoc.data();
                    const participant = voteData.participants ? voteData.participants.find(p => p.deputyId === searchableDeputyId) : null;
                    if (participant) {
                        votings.push({
                            id: voteDoc.id,
                            title: voteData[`${lang}_ai_title`] || `Brak tytułu w języku: ${lang}`, 
                            votingDate: voteData.votingDate?.toDate().toISOString() || null,
                            deputyActualVote: participant.vote || 'Brak danych'
                        });
                    }
                });
                responseData.hasMoreVotings = votings.length > requestedLimit;
                if (responseData.hasMoreVotings) votings.pop();
                responseData.votings = votings;
                responseData.lastVoteId = votings.length > 0 ? votings[votings.length - 1].id : null;

            } else if (dataType === 'interpellations') {
                const numericDeputyId = deputyId.split('_').pop();
                let interpellationsQuery = db.collection('ue_interpellations')
                    .where('from', 'array-contains', numericDeputyId)
                    .where('term', '==', parseInt(requestedTerm))
                    .orderBy('sentDate', 'desc');
                if (startAfterDocId) {
                    const lastVisibleInterpDoc = await db.collection('ue_interpellations').doc(startAfterDocId).get();
                    if (lastVisibleInterpDoc.exists) interpellationsQuery = interpellationsQuery.startAfter(lastVisibleInterpDoc);
                }
                interpellationsQuery = interpellationsQuery.limit(requestedLimit + 1);
                const interpellationsSnapshot = await interpellationsQuery.get();
                const interpellationsPreview = [];
                interpellationsSnapshot.forEach(interp => {
                    const interpData = interp.data();
                    interpellationsPreview.push({
                        id: interp.id,
                        ...interpData,
                        sentDate: interpData.sentDate?.toDate().toISOString() || null,
                    });
                });
                responseData.hasMoreInterpellations = interpellationsPreview.length > requestedLimit;
                if (responseData.hasMoreInterpellations) interpellationsPreview.pop();
                responseData.interpellationsPreview = interpellationsPreview;
                responseData.lastInterpellationId = interpellationsPreview.length > 0 ? interpellationsPreview[interpellationsPreview.length - 1].id : null;
            } else {
                throw { status: 400, code: 'invalid-argument', message: "Nieprawidłowy parametr 'dataType'. Dozwolone wartości: 'votings', 'interpellations'." };
            }
            return responseData;
        })();

        cache.set(cacheKey, { promise: fetchPromise, timestamp: Date.now() });
        const result = await fetchPromise;
        return res.status(200).json({ data: result });

    } catch (error) {
        console.error('[ue_getDeputyDetails] Błąd:', error);
        if (error.status && error.code && error.message) {
            return res.status(error.status).json({ error: { code: error.code, message: error.message } });
        }
        return res.status(500).json({ error: { code: 'internal', message: 'Wystąpił wewnętrzny błąd serwera.' } });
    }
};

// --- GETLEGISLATIONS ---

const getLegislations = async (req, res) => {
	if (req.body.warmup === true) {
		console.log("ue_getLegislations: Otrzymano żądanie rozgrzewające.");
		return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
	}

	try {
		const data = req.body.data || req.body;
		
		const supportedLangs = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];
		const defaultLang = 'eng';
		const ACCEPTED_STATUS_VARIANTS = ["Adopted"];
		const REJECTED_STATUS_VARIANTS = ["Withdrawn", "Rejected"];
		const BILL_DOCUMENT_TYPES = ["COD", "CNS", "NLE", "AVC", "DEC", "INI", "INL", "DEA", "DCE", "REG", "IMM"];
		const RESOLUTION_DOCUMENT_TYPES = ["RSP", "RPS", "RSO", "INI", "INS", "APP", "SYN", "BUD", "GBD", "ACI", "COS", "BUI"];

		const { 
			status: statusFilter, category, sortBy: rawSortBy, sortOrder: rawSortOrder, 
			term: requestedTerm, documentType: documentTypeFilter, limit: rawLimit, lastVisibleDocId
		} = data;

		const limit = parseInt(rawLimit) || 20;
		let sortBy = rawSortBy || 'popularity';
		const sortOrder = rawSortOrder || 'desc';

		const langAliases = { 'polish': 'pl', 'pol': 'pl', 'pl': 'pl', 'english': 'eng', 'eng': 'eng', 'en': 'eng', 'german': 'de', 'ger': 'de', 'deu': 'de', 'de': 'de', 'italian': 'it', 'ita': 'it', 'it': 'it', 'portuguese': 'pt', 'por': 'pt', 'pt': 'pt', 'french': 'fr', 'fre': 'fr', 'fra': 'fr', 'fr': 'fr', 'dutch': 'nl', 'dut': 'nl', 'nld': 'nl', 'nl': 'nl', 'spanish': 'es', 'spa': 'es', 'es': 'es' };
		let lang = defaultLang;
		const requestedLangParam = data.lang ? data.lang.toLowerCase() : null;
		if (requestedLangParam && langAliases[requestedLangParam] && supportedLangs.includes(langAliases[requestedLangParam])) {
			lang = langAliases[requestedLangParam];
		}

		if (!requestedTerm) {
			throw { status: 400, code: 'invalid-argument', message: "Missing 'term' parameter." };
		}

		let query = db.collection('ue_legislations').where('term', '==', parseInt(requestedTerm, 10));

		if (statusFilter) {
			const statusArray = statusFilter.split(',').map(s => s.trim()).filter(s => s.length > 0);
			if (statusArray.length > 0) {
				const singleStatusFromQuery = statusArray[0].toLowerCase();
				if (singleStatusFromQuery === 'accepted') query = query.where('status', 'in', ACCEPTED_STATUS_VARIANTS);
				else if (singleStatusFromQuery === 'rejected') query = query.where('status', 'in', REJECTED_STATUS_VARIANTS);
				else query = query.where('status', '==', statusArray[0]);
			}
		} else {
			query = query.where('status', 'in', [...ACCEPTED_STATUS_VARIANTS, ...REJECTED_STATUS_VARIANTS]);
		}
		
		if (category && category.toLowerCase() !== 'wszystkie') query = query.where('category', 'array-contains', category);
		if (documentTypeFilter) {
			const filterLower = documentTypeFilter.toLowerCase().trim();
			if (filterLower === 'bill') query = query.where('documentType', 'in', BILL_DOCUMENT_TYPES);
			else if (filterLower === 'resolution') query = query.where('documentType', 'in', RESOLUTION_DOCUMENT_TYPES);
			else {
				const typesArray = documentTypeFilter.split(',').map(type => type.trim().toUpperCase()).filter(type => type.length > 0);
				if (typesArray.length > 0) query = query.where('documentType', 'in', typesArray);
			}
		}

		if (sortBy === 'title' || sortBy === 'documentDate' || sortBy === 'lastUpdated') {
			query = query.orderBy(sortBy, sortOrder);
		} else {
			query = query.orderBy('popularity', sortOrder);
		}

		if (lastVisibleDocId) {
			const lastDoc = await db.collection('ue_legislations').doc(lastVisibleDocId).get();
			query = query.startAfter(lastDoc);
		}

		query = query.limit(limit);
		const snapshot = await query.get();
		
		if (snapshot.empty) {
			return res.status(200).json({ data: { legislations: [], nextCursor: null } });
		}
		
		const raw = data.raw === 'true';
		const legislations = snapshot.docs.map(doc => {
			const docData = doc.data();
			return raw ? { id: doc.id, ...docData } : { id: doc.id, ...localizeDocument(docData, lang, defaultLang) };
		});
		
		const newLastVisibleDocId = snapshot.docs[snapshot.docs.length - 1]?.id || null;

		return res.status(200).json({ data: { legislations, nextCursor: newLastVisibleDocId } });

	} catch (error) {
		console.error('[ue_getLegislations] Error fetching legislations:', error);
		
		if (error.status && error.code) {
			return res.status(error.status).json({ error: { code: error.code, message: error.message } });
		}
		
		return res.status(500).json({ error: { code: 'internal', message: 'An unexpected error occurred.' } });
	}
};

// --- CITIZENVOTE ---

const citizenVote = async (req, res) => {
    if (req.body.warmup === true) {
        console.log("ue_citizenVote: Otrzymano żądanie rozgrzewające.");
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }
    
    const data = req.body.data || req.body;
    const { targetId, targetType, voteType, userId } = data;

    if (!userId) {
        return res.status(401).json({ error: { code: 'unauthenticated', message: 'Funkcja wymaga uwierzytelnienia.' } });
    }

    try {
        const userDocRef = db.collection('users').doc(userId);
        const userDoc = await userDocRef.get();
        if (!userDoc.exists) {
            return res.status(404).json({ error: { code: 'not-found', message: 'User profile does not exist.' } });
        }
        if (!targetId || !targetType || !voteType || !['like', 'dislike'].includes(voteType)) {
            return res.status(400).json({ error: { code: 'invalid-argument', message: 'Nieprawidłowe lub brakujące parametry.' } });
        }

        let collectionName;
        if (targetType === 'legislation') collectionName = 'ue_legislations';
        else if (targetType === 'deputy') collectionName = 'ue_deputies';
        else {
            return res.status(400).json({ error: { code: 'invalid-argument', message: 'Nieprawidłowy typ celu głosowania (oczekiwano "legislation" lub "deputy").' } });
        }

        const targetRef = db.collection(collectionName).doc(targetId);
        const userVoteRef = targetRef.collection('user_votes').doc(userId);

        const transactionResult = await db.runTransaction(async (transaction) => {
            const targetDocSnapshot = await transaction.get(targetRef);
            if (!targetDocSnapshot.exists) {
                throw { status: 404, code: 'not-found', message: `Cel głosowania (${targetType} o ID: ${targetId}) nie został znaleziony.` };
            }
            const userVoteDoc = await transaction.get(userVoteRef);
            const currentData = targetDocSnapshot.data();
            if (userVoteDoc.exists) {
                return { status: 'ALREADY_VOTED', counters: { likes: currentData.likes || 0, dislikes: currentData.dislikes || 0, popularity: currentData.popularity || 0 } };
            }

            const countryPrefix = 'ue';
            const voteKey = `${countryPrefix}_${targetType}_${targetId}`;
            const userProfileRef = db.collection('users').doc(userId);
            transaction.update(userProfileRef, { [`votes.${voteKey}`]: true });
            transaction.set(userVoteRef, { vote: voteType, timestamp: admin.firestore.FieldValue.serverTimestamp() });
            
            const updateData = { popularity: admin.firestore.FieldValue.increment(1) };
            if (voteType === 'like') updateData.likes = admin.firestore.FieldValue.increment(1);
            else updateData.dislikes = admin.firestore.FieldValue.increment(1);
            
            transaction.update(targetRef, updateData);
            
            return {
                status: 'VOTE_CAST',
                counters: {
                    likes: (currentData.likes || 0) + (voteType === 'like' ? 1 : 0),
                    dislikes: (currentData.dislikes || 0) + (voteType === 'dislike' ? 1 : 0),
                    popularity: (currentData.popularity || 0) + 1,
                }
            };
        });

        if (!transactionResult) {
            throw { status: 500, code: 'internal', message: 'Wystąpił nieoczekiwany błąd wewnętrzny (TR_UNDEFINED).' };
        }

        let responseBody;
        if (transactionResult.status === 'ALREADY_VOTED') {
            responseBody = { success: false, message: `Już oddano głos na ten cel (${targetType}).`, alreadyVoted: true, counters: transactionResult.counters };
        } else {
            responseBody = { success: true, message: 'Głos został pomyślnie oddany.', votedNow: true, counters: transactionResult.counters };
        }
        return res.status(200).json({ data: responseBody });

    } catch (error) {
        console.error('Błąd podczas głosowania:', { targetId, targetType, userId, voteType, error });
        if (error.status && error.code && error.message) {
            return res.status(error.status).json({ error: { code: error.code, message: error.message } });
        }
        return res.status(500).json({ error: { code: 'internal', message: 'Wystąpił błąd serwera podczas przetwarzania głosu.', details: error.message } });
    }
};

module.exports = {
  getMetadata,
  getHomeScreenData,
  getDetails,
  getDeputies,
  getDeputyDetails,
  getLegislations,
  citizenVote
};