const admin = require('firebase-admin');

if (!admin.apps.length) {
  admin.initializeApp();
}
const db = admin.firestore();

const cache = new Map();
const CACHE_TTL_SECONDS = 6000;

function normalizeLang(requestedLang, defaultLang) {
    const langAliases = {
        'polish': 'pl', 'pol': 'pl', 'pl': 'pl', 'english': 'eng', 'eng': 'eng', 'en': 'eng',
        'german': 'de', 'ger': 'de', 'deu': 'de', 'de': 'de', 'italian': 'it', 'ita': 'it', 'it': 'it',
        'portuguese': 'pt', 'por': 'pt', 'pt': 'pt', 'french': 'fr', 'fre': 'fr', 'fra': 'fr', 'fr': 'fr',
        'dutch': 'nl', 'dut': 'nl', 'nld': 'nl', 'nl': 'nl', 'spanish': 'es', 'spa': 'es', 'es': 'es'
    };
    const supportedLangs = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];
    
    if (requestedLang) {
        const normalized = requestedLang.toLowerCase();
        if (langAliases[normalized] && supportedLangs.includes(langAliases[normalized])) {
            return langAliases[normalized];
        }
    }
    return defaultLang;
}

/// --- GETMETADATA ---
const getMetadata = async (req, res) => {
    if (req.body.warmup === true) {
        console.log("us_getMetadata: Otrzymano żądanie rozgrzewające.");
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }
    try {
        const data = req.body.data || req.body;
        const { type, term } = data;
        let result;
        if (type === 'term_clubs') {
            let termToFetch = term || (await fetchCurrentTerm()).currentTerm;
            if (!termToFetch) {
                return res.status(400).json({ error: { code: 'invalid-argument', message: 'Term not specified and default term could not be determined.' } });
            }
            result = await fetchTermClubs(termToFetch);
        } else if (type === 'current_term') {
            result = await fetchCurrentTerm();
        } else {
            result = await fetchBootstrapData();
        }
        return res.status(200).json({ data: result });
    } catch (error) {
        console.error(`[us_getMetadata] Błąd dla zapytania:`, { type: data.type, term: data.term, error: error.message });
        if (error.statusCode === 404) {
            return res.status(404).json({ error: { code: 'not-found', message: 'No data available.', details: error.details } });
        }
        return res.status(500).json({ error: { code: 'internal', message: 'An internal server error occurred.', originalError: error.message } });
    }
};

async function fetchCurrentTerm() {
  try {
    console.log(`Pobieranie current_term z Firestore.`);
    const doc = await db.collection('us_metadata').doc('last_update').get();
    const currentTerm = doc.exists ? doc.data().currentTerm : 119;
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
    const termClubsDoc = await db.collection('us_metadata').doc(termClubsDocId).get();

    if (!termClubsDoc.exists) {
      const error = new Error('No club data available for the specified term');
      error.statusCode = 404;
      error.details = { term: parseInt(term, 10), clubs: [], status: 'NOT_FOUND' };
      throw error;
    }

    return {
      term: parseInt(term, 119),
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
    const doc = await db.collection('us_metadata').doc('last_update').get();
    if (!doc.exists) {
      return {
        currentTerm: 119, lastUpdated: null, availableTerms: [],
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

const getHomeScreenData = async (req, res) => {
    if (req.body.warmup === true) {
        console.log("us_getHomeScreenData: Otrzymano żądanie rozgrzewające.");
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }
    try {
        const data = req.body.data || req.body;
        const { lang: requestedLang, term: requestedTerm } = data;
        if (!requestedTerm) {
            return res.status(400).json({ error: { code: 'invalid-argument', message: "Brak wymaganego parametru 'term'." } });
        }

        const lang = normalizeLang(requestedLang, 'eng');
        const cacheKey = `us-homescreen-${requestedTerm}-${lang}`;
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
            const HOME_SCREEN_COLLECTION = 'us_home_screen';
            const DOC_ID_POPULAR_VOTED = 'mostPopularVoted';
            const DOC_ID_UPCOMING_VOTE = 'topUpcomingVote';
            const DOC_ID_POPULAR_IN_PROCESS = 'mostPopularInProcess';
            const DOC_ID_TOP_DEPUTIES = 'topDeputies';
            const DOC_ID_LATEST_CIVIC = 'latestCivicProject';
            
            const [
                popularVotedData,
                upcomingVoteData,
                popularInProcessData,
                topDeputiesData,
                civicProjectData
            ] = await Promise.all([
                getUsHomeScreenDoc(`${requestedTerm}_${DOC_ID_POPULAR_VOTED}`, lang, HOME_SCREEN_COLLECTION, DOC_ID_TOP_DEPUTIES),
                getUsHomeScreenDoc(`${requestedTerm}_${DOC_ID_UPCOMING_VOTE}`, lang, HOME_SCREEN_COLLECTION, DOC_ID_TOP_DEPUTIES),
                getUsHomeScreenDoc(`${requestedTerm}_${DOC_ID_POPULAR_IN_PROCESS}`, lang, HOME_SCREEN_COLLECTION, DOC_ID_TOP_DEPUTIES),
                getUsHomeScreenDoc(`${requestedTerm}_${DOC_ID_TOP_DEPUTIES}`, lang, HOME_SCREEN_COLLECTION, DOC_ID_TOP_DEPUTIES),
                getUsHomeScreenDoc(`${requestedTerm}_${DOC_ID_LATEST_CIVIC}`, lang, HOME_SCREEN_COLLECTION, DOC_ID_TOP_DEPUTIES)
            ]);
            return { popularVoted: popularVotedData, upcomingVote: upcomingVoteData, popularInProcess: popularInProcessData, topDeputies: topDeputiesData, civicProject: civicProjectData };
        })();

        cache.set(cacheKey, { promise: fetchPromise, timestamp: Date.now() });
        const result = await fetchPromise;
        return res.status(200).json({ data: result });

    } catch (error) {
        console.error("KRYTYCZNY BŁĄD: Nie udało się pobrać danych home screen dla USA:", error);
        return res.status(500).json({ error: { code: 'internal', message: 'Wystąpił wewnętrzny błąd serwera podczas pobierania danych.' } });
    }
};

async function getUsHomeScreenDoc(docId, langCode, collectionName, topDeputiesDocId) {
    try {
        const docSnap = await db.collection(collectionName).doc(docId).get();
        if (!docSnap.exists) return null;
        
        const originalData = docSnap.data();
        if (docId.includes(topDeputiesDocId) || !originalData) {
            return originalData;
        }

        const localizedData = { ...originalData };
        Object.keys(localizedData).forEach(key => {
            if (key.includes('_summary') || key.includes('_key_points') || key.includes('_ai_title')) {
                delete localizedData[key];
            }
        });
        localizedData.title = originalData[`${langCode}_ai_title`] || originalData['eng_ai_title'] || originalData.titleOfficial || 'No title';
        localizedData.summary = originalData[`${langCode}_summary`] || originalData['eng_summary'] || 'We are sorry! No summary available at the moment.';
        const keyPoints = originalData[`${langCode}_key_points`] || originalData['eng_key_points'] || [];
        localizedData.key_points = Array.isArray(keyPoints) ? keyPoints : [];
        delete localizedData.description;
        return localizedData;
    } catch (error) {
        console.error(`[getUsHomeScreenDoc] Błąd podczas pobierania dokumentu ${docId}:`, error);
        return null;
    }
}

// --- GETDETAILS ---

const getDetails = async (req, res) => {
    if (req.body.warmup === true) {
        console.log("us_getDetails: Otrzymano żądanie rozgrzewające.");
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }
    try {
        const data = req.body.data || req.body;
        let { type, id, lang: requestedLangParam } = data;
        if (!type || !id) {
            return res.status(400).json({ error: { code: 'invalid-argument', message: "Brak wymaganego parametru 'type' lub 'id'." } });
        }
        const lang = normalizeLang(requestedLangParam, 'eng');
        const defaultLang = 'eng';

        let documentData;
        switch (type) {
            case 'bill':
                const legislationDoc = await db.collection('us_legislations').doc(id).get();
                if (!legislationDoc.exists) {
                    return res.status(404).json({ error: { code: 'not-found', message: 'Nie znaleziono ustawy o podanym ID.' } });
                }
                documentData = localizeUsDocument(legislationDoc.data(), lang, defaultLang);
                break;
            case 'deputy':
                const deputyDoc = await db.collection('us_deputies').doc(id).get();
                if (!deputyDoc.exists) {
                    return res.status(404).json({ error: { code: 'not-found', message: 'Nie znaleziono posła o podanym ID.' } });
                }
                documentData = deputyDoc.data();
                break;
            case 'civic':
                const civicDoc = await db.collection('us_civic').doc(id).get();
                if (!civicDoc.exists) {
                    return res.status(404).json({ error: { code: 'not-found', message: 'Nie znaleziono projektu obywatelskiego.' } });
                }
                // Używamy tej samej funkcji lokalizującej co dla ustaw, bo struktura jest identyczna
                documentData = localizeUsDocument(civicDoc.data(), lang, defaultLang);
                break;
            default:
                return res.status(400).json({ error: { code: 'invalid-argument', message: "Nieprawidłowy parametr 'type'. Użyj 'bill' lub 'deputy'." } });
        }
        return res.status(200).json({ data: { id, ...documentData } });
    } catch (error) {
        console.error('[us_getDetails] Błąd:', error);
        return res.status(500).json({ error: { code: 'internal', message: 'Wystąpił wewnętrzny błąd serwera.' } });
    }
};

function localizeUsDocument(docData, langCode, defaultLang) {
    if (!docData) return null;
    const getLocalizedValue = (baseFieldName) => {
        return docData[`${langCode}_${baseFieldName}`] ?? docData[`${defaultLang}_${baseFieldName}`] ?? docData[baseFieldName];
    };
    const localized = { ...docData };
    localized.title = getLocalizedValue('ai_title') || getLocalizedValue('titleOfficial') || 'No Title';
    localized.description = getLocalizedValue('summary') || getLocalizedValue('description') || 'We are sorry! No summary has been generated so far. The official source text may be unavailable. If so, you can help by submitting a transparency request using our form.';
    localized.key_Points = getLocalizedValue('key_points') || [];
    return localized;
}

// --- GETDEPUTIES ---

const getDeputies = async (req, res) => {
    if (req.body.warmup === true) {
        console.log("us_getDeputies: Otrzymano żądanie rozgrzewające.");
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }
    try {
        const data = req.body.data || req.body;
        const { club, term: requestedTerm, sortBy, limit: rawLimit, lastVisibleDocId } = data;
        const limit = parseInt(rawLimit) || 15;

        if (!requestedTerm) {
            return res.status(400).json({ error: { code: 'invalid-argument', message: "Brak wymaganego parametru 'term'." } });
        }
        
        let query = db.collection('us_deputies');
        const termPrefix = `${requestedTerm}_`;
        query = query.where(admin.firestore.FieldPath.documentId(), '>=', termPrefix)
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
            const lastDoc = await db.collection('us_deputies').doc(lastVisibleDocId).get();
            if(lastDoc.exists) {
                query = query.startAfter(lastDoc);
            }
        }

        query = query.limit(limit);
        const snapshot = await query.get();
        const deputies = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
        const newLastVisibleDocId = snapshot.docs[snapshot.docs.length - 1]?.id || null;

        return res.status(200).json({ data: { deputies, nextCursor: newLastVisibleDocId } });

    } catch (error) {
        console.error('[us_getDeputies] Błąd podczas pobierania posłów:', error);
        return res.status(500).json({ error: { code: 'internal', message: 'Wystąpił wewnętrzny błąd serwera.' } });
    }
};

// --- GETDEPUTYDETAILS ---

const getDeputyDetails = async (req, res) => {
	if (req.body.warmup === true) {
		console.log("us_getDeputyDetails: Otrzymano żądanie rozgrzewające.");
		return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
	}
	try {
		const data = req.body.data || req.body;
		const { id: deputyId, dataType = 'votings', term: requestedTerm, limit, startAfterDocId, lang: requestedLang } = data;
		const requestedLimit = parseInt(limit, 10) || 10;
		const supportedLangs = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];
		const defaultLang = 'en';
		const langAliases = {'polish': 'pl', 'pol': 'pl', 'pl': 'pl', 'english': 'eng', 'eng': 'eng', 'en': 'eng', 'german': 'de', 'ger': 'de', 'deu': 'de', 'de': 'de', 'italian': 'it', 'ita': 'it', 'it': 'it', 'portuguese': 'pt', 'por': 'pt', 'pt': 'pt', 'french': 'fr', 'fre': 'fr', 'fra': 'fr', 'fr': 'fr', 'dutch': 'nl', 'dut': 'nl', 'nld': 'nl', 'nl': 'nl', 'spanish': 'es', 'spa': 'es', 'es': 'es'};
		
		let lang = langAliases[defaultLang] || defaultLang;
		if (requestedLang && langAliases[requestedLang.toLowerCase()] && supportedLangs.includes(langAliases[requestedLang.toLowerCase()])) {
			lang = langAliases[requestedLang.toLowerCase()];
		}
		
		const cacheKey = `deputy-details-${deputyId}-${dataType}-${requestedTerm}-${lang}-${requestedLimit}-${startAfterDocId || 'firstPage'}`;
		if (cache.has(cacheKey)) {
			const cachedEntry = cache.get(cacheKey);
			const ageSeconds = (Date.now() - cachedEntry.timestamp) / 1000;
			if (ageSeconds < CACHE_TTL_SECONDS) {
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

			// --- START MODYFIKACJI: POBIERANIE PROFILU ---
			const deputyDoc = await db.collection('us_deputies').doc(deputyId).get();
			if (deputyDoc.exists) {
				const profileData = deputyDoc.data();
				Object.assign(responseData, profileData);
			} else {
				console.warn(`[us_getDeputyDetails] Nie znaleziono profilu posła dla ID: ${deputyId}`);
			}
			// --- KONIEC MODYFIKACJI ---

			if (dataType === 'votings') {
				const deputyIdWithoutTerm = deputyId.split('_').pop();
				const termFromDeputyId = parseInt(deputyId.split('_')[0], 10);
				if (!termFromDeputyId || !deputyIdWithoutTerm) {
					throw { status: 400, code: 'invalid-argument', message: 'Nieprawidłowy format ID posła. Oczekiwano {term}_{id}.' };
				}
				const searchableDeputyId = `deputy_${termFromDeputyId}_${deputyIdWithoutTerm}`;
				let votingsQuery = db.collectionGroup('us_voting_records')
					.where('participantIds', 'array-contains', searchableDeputyId)
					.where('term', '==', termFromDeputyId)
					.orderBy('votingDate', 'desc');

				if (startAfterDocId) {
					console.log(`[Pagination] Attempting to start after document with id: ${startAfterDocId}`);
					const cursorQuery = db.collectionGroup('us_voting_records')
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

				const sponsorsCountQuery = db.collection('us_sponsors')
					.where('term', '==', termFromDeputyId)
					.where('sponsors', 'array-contains', deputyIdWithoutTerm)
					.count();
				
				const cosponsorsCountQuery = db.collection('us_sponsors')
					.where('term', '==', termFromDeputyId)
					.where('cosponsors', 'array-contains', deputyIdWithoutTerm)
					.count();

				const [votingsSnapshot, sCountSnap, cCountSnap] = await Promise.all([
					votingsQuery.get(),
					sponsorsCountQuery.get(),
					cosponsorsCountQuery.get()
				]);

				responseData.sponsoredBillsCount = sCountSnap.data().count;
				responseData.cosponsoredBillsCount = cCountSnap.data().count;
				const votings = [];
				for (const voteDoc of votingsSnapshot.docs) {
					const voteData = voteDoc.data();
					const participant = voteData.participants ? voteData.participants.find(p => p.deputyId.trim() === deputyIdWithoutTerm.trim()) : null;
					if (participant) {
						votings.push({
							id: voteData.id,
							legislationId: voteData.legislationId,
							votingUrl: voteData.votingUrl || null,
							title: voteData[`${lang}_ai_title`] || voteData.titleOfficial || `No public official document is available`, 
							votingDate: voteData.votingDate?.toDate().toISOString() || null,
							deputyActualVote: participant.vote || 'No data'
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
				const deputyIdWithoutTerm = deputyId.split('_').pop();
				const termAsNumber = parseInt(requestedTerm, 10);

				const sponsorsQuery = db.collection('us_sponsors')
					.where('term', '==', termAsNumber)
					.where('sponsors', 'array-contains', deputyIdWithoutTerm);
				
				const cosponsorsQuery = db.collection('us_sponsors')
					.where('term', '==', termAsNumber)
					.where('cosponsors', 'array-contains', deputyIdWithoutTerm);

				const [sponsorsSnapshot, cosponsorsSnapshot] = await Promise.all([sponsorsQuery.get(), cosponsorsQuery.get()]);
                // rozwazyc w przyszlosci agregacje po firebase, zeby nie pobierac wszystkich

                responseData.sponsoredBillsCount = sponsorsSnapshot.size;
				responseData.cosponsoredBillsCount = cosponsorsSnapshot.size;
                console.log(`[DEBUG_US_COUNTS] ID: ${deputyId} | Sponsored: ${responseData.sponsoredBillsCount} | Cosponsored: ${responseData.cosponsoredBillsCount}`);

				const allSponsorships = new Map();

				sponsorsSnapshot.forEach(doc => {
					allSponsorships.set(doc.id, { ...doc.data(), sponsorshipType: 'sponsor', id: doc.id });
				});

				cosponsorsSnapshot.forEach(doc => {
					if (!allSponsorships.has(doc.id)) {
						allSponsorships.set(doc.id, { ...doc.data(), sponsorshipType: 'cosponsor', id: doc.id });
					}
				});
				
				let sortedSponsorships = Array.from(allSponsorships.values())
					.sort((a, b) => b.lastUpdated.toMillis() - a.lastUpdated.toMillis());

				let startIndex = 0;
				if (startAfterDocId) {
					const foundIndex = sortedSponsorships.findIndex(item => item.id === startAfterDocId);
					if (foundIndex !== -1) {
						startIndex = foundIndex + 1;
					}
				}
				
				const paginatedSponsorships = sortedSponsorships.slice(startIndex, startIndex + requestedLimit + 1);
				
				const sponsorshipsPreview = paginatedSponsorships.map(item => ({
					id: item.id,
					title: item[`${lang}_ai_title`] || item.titleOfficial || `No public official document is available`,
					sponsorshipType: item.sponsorshipType,
				}));

				responseData.hasMoreInterpellations = sponsorshipsPreview.length > requestedLimit;
				if (responseData.hasMoreInterpellations) sponsorshipsPreview.pop();
				
				responseData.interpellationsPreview = sponsorshipsPreview;
				responseData.lastInterpellationId = sponsorshipsPreview.length > 0 ? sponsorshipsPreview[sponsorshipsPreview.length - 1].id : null;

			} else {
				throw { status: 400, code: 'invalid-argument', message: "Nieprawidłowy parametr 'dataType'. Dozwolone wartości: 'votings', 'sponsorships'." };
			}
			return responseData;
		})();

		cache.set(cacheKey, { promise: fetchPromise, timestamp: Date.now() });
		const result = await fetchPromise;
		return res.status(200).json({ data: result });
	} catch (error) {
		console.error('[us_getDeputyDetails] Error:', error);
		if (error.status && error.code) {
			return res.status(error.status).json({ error: { code: error.code, message: error.message } });
		}
		return res.status(500).json({ error: { code: 'internal', message: 'Wystąpił wewnętrzny błąd serwera.' } });
	}
};

// --- GETLEGISLATIONS ---

const getLegislations = async (req, res) => {
    if (req.body.warmup === true) {
        console.log("us_getLegislations: Otrzymano żądanie rozgrzewające.");
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }
    try {
        const data = req.body.data || req.body;
        // ZMIANA: Dodano 'processStartDateAfter' do listy
        const { status: statusFilter, category, sortBy: rawSortBy, sortOrder: rawSortOrder, term: requestedTerm, documentType: documentTypeFilter, limit: rawLimit, lastVisibleDocId, lang: requestedLangParam, raw, processStartDateAfter } = data;
        
        const limit = parseInt(rawLimit) || 20;
        let sortBy = 'popularity';
        let sortOrder = 'desc';

        if (rawSortBy) {
            const parts = rawSortBy.split('_');
            const potentialSortBy = parts[0];
            const allowedSortFields = ['title', 'documentDate', 'lastUpdated', 'votingDate', 'processStartDate', 'popularity'];

            if (allowedSortFields.includes(potentialSortBy)) {
                sortBy = potentialSortBy;
                if (parts.length > 1 && ['asc', 'desc'].includes(parts[1])) {
                    sortOrder = parts[1];
                }
            }
        }

        const lang = normalizeLang(requestedLangParam, 'eng');
        const defaultLang = 'eng';

        // ZMIANA: Nowa, inteligentna logika walidacji i pobierania kadencji
        if (!requestedTerm && !processStartDateAfter) {
            return res.status(400).json({ error: { code: 'invalid-argument', message: "Missing 'term' or 'processStartDateAfter' parameter." } });
        }

        let termToUse;
        if (processStartDateAfter) {
            // Zapytanie z powiadomienia: pobieramy aktualną kadencję z metadanych
            console.log("us_getLegislations: Wykryto zapytanie z powiadomienia. Pobieram aktualną kadencję.");
            const metadataDoc = await db.collection('us_metadata').doc('last_update').get();
            if (!metadataDoc.exists) {
                throw new Error('Dokument us_metadata/last_update nie istnieje.');
            }
            termToUse = metadataDoc.data().currentTerm;
        } else {
            // Standardowe zapytanie: używamy kadencji z żądania
            termToUse = requestedTerm;
        }

        let query = db.collection('us_legislations').where('term', '==', parseInt(termToUse, 10));

        if (statusFilter) {
            const statusArray = statusFilter.split(',').map(s => s.trim().toLowerCase()).filter(Boolean);
            if (statusArray.length > 0) {
                 query = query.where('subStatus', 'in', statusArray);
            }
        } else {
            query = query.where('subStatus', 'in', ["accepted", "rejected"]);
        }
        
        if (category) {
            query = query.where('category', 'array-contains', category);
        }

        if (documentTypeFilter) {
            const subTypes = documentTypeFilter.split(',').map(type => type.trim().toLowerCase()).filter(Boolean);
            if (subTypes.length > 0) {
                 query = query.where('subType', 'in', subTypes);
            }
        }

        // ZMIANA: Dodano filtrowanie po dacie dla zapytań z powiadomień
        if (processStartDateAfter) {
            const startDate = new Date(processStartDateAfter);
            query = query.where('processStartDate', '>=', startDate);
        }

        query = query.orderBy(sortBy, sortOrder).orderBy(admin.firestore.FieldPath.documentId(), 'asc');
        
        if (lastVisibleDocId) {
            const lastDoc = await db.collection('us_legislations').doc(lastVisibleDocId).get();
            if(lastDoc.exists) {
                query = query.startAfter(lastDoc);
            }
        }

        query = query.limit(limit);
        const snapshot = await query.get();
        
        if (snapshot.empty) {
            return res.status(200).json({ data: { legislations: [], nextCursor: null } });
        }
        
        const legislations = snapshot.docs.map(doc => {
            const docData = doc.data();
            return raw === 'true' ? { id: doc.id, ...docData } : { id: doc.id, ...localizeUsDocument(docData, lang, defaultLang) };
        });
        
        const newLastVisibleDocId = snapshot.docs[snapshot.docs.length - 1]?.id || null;
        return res.status(200).json({ data: { legislations, nextCursor: newLastVisibleDocId } });

    } catch (error) {
        console.error('[us_getLegislations] Błąd:', error);
        return res.status(500).json({ error: { code: 'internal', message: 'An unexpected error occurred.', details: error.message } });
    }
};

// --- GETCIVICPROJECTS ---

const getCivicProjects = async (req, res) => {
    if (req.body.warmup === true) {
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }
    try {
        const data = req.body.data || req.body;
        const { limit: rawLimit, lastVisibleDocId, lang: requestedLangParam, category } = data;
        let { sortBy } = data; // Pobieramy sortBy jako let, żeby móc nadpisać
        
        const limit = parseInt(rawLimit) || 20;
        let sortOrder = 'desc';

        // FIX: Jeśli frontend prosi o sortowanie po 'processStartDate', my w bazie szukamy po 'documentDate'
        if (sortBy === 'processStartDate') {
            sortBy = 'documentDate';
        }
        // Domyślne sortowanie, jeśli brak parametru
        if (!sortBy) {
            sortBy = 'popularity';
        }

        const lang = normalizeLang(requestedLangParam, 'eng');
        const defaultLang = 'eng';

        console.log(`[DEBUG] us_getCivicProjects: SortBy=${sortBy}, Category=${category}`);

        let query = db.collection('us_civic');

        if (category) {
            query = query.where('category', 'array-contains', category);
        }

        // Sortowanie
        query = query.orderBy(sortBy, sortOrder).orderBy(admin.firestore.FieldPath.documentId(), 'asc');

        if (lastVisibleDocId) {
            const lastDoc = await db.collection('us_civic').doc(lastVisibleDocId).get();
            if(lastDoc.exists) {
                query = query.startAfter(lastDoc);
            }
        }

        query = query.limit(limit);
        const snapshot = await query.get();

        if (snapshot.empty) {
            return res.status(200).json({ data: { projects: [], nextCursor: null } });
        }

        const projects = snapshot.docs.map(doc => {
            const docData = doc.data();
            const localized = localizeUsDocument(docData, lang, defaultLang);
            
            if (!localized.processStartDate && localized.documentDate) {
                localized.processStartDate = localized.documentDate;
            }

            return { id: doc.id, ...localized };
        });

        const newLastVisibleDocId = snapshot.docs[snapshot.docs.length - 1]?.id || null;
        return res.status(200).json({ data: { projects, nextCursor: newLastVisibleDocId } });

    } catch (error) {
        console.error('[us_getCivicProjects] Błąd:', error);
        return res.status(500).json({ error: { code: 'internal', message: 'An unexpected error occurred.', details: error.message } });
    }
};

// --- CITIZENVOTE ---

const citizenVote = async (req, res) => {
    if (req.body.warmup === true) {
        console.log("us_citizenVote: Otrzymano żądanie rozgrzewające.");
        return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
    }
    const data = req.body.data || req.body;
    const { targetId, targetType, voteType } = data;
    const userId = req.user?.uid;
    if (!userId) {
        return res.status(401).json({ error: { code: 'unauthenticated', message: 'Funkcja wymaga uwierzytelnienia.' } });
    }
    if (req.user.email_verified !== true) {
        return res.status(403).json({ error: { code: 'permission-denied', message: 'Głosowanie wymaga zweryfikowanego adresu email.' } });
    }

    try {
        const userDocRef = db.collection('users').doc(userId);
        const userDoc = await userDocRef.get();
        if (!userDoc.exists) {
            return res.status(404).json({ error: { code: 'not-found', message: 'User profile does not exist.' } });
        }
        const userData = userDoc.data();
        if (userData.primaryParliamentId !== 'United States Congress') {
            return res.status(403).json({ error: { code: 'permission-denied', message: 'This poll is restricted to users of the US.' } });
        }

        if (!targetId || !targetType || !voteType || !['like', 'dislike'].includes(voteType)) {
            return res.status(400).json({ error: { code: 'invalid-argument', message: 'Nieprawidłowe lub brakujące parametry.' } });
        }

        let collectionName;
        if (targetType === 'legislation') collectionName = 'us_legislations';
        else if (targetType === 'deputy') collectionName = 'us_deputies';
        else if (targetType === 'civic') collectionName = 'us_civic'; 
        else {
            return res.status(400).json({ error: { code: 'invalid-argument', message: 'Nieprawidłowy typ celu głosowania (oczekiwano "legislation", "deputy" lub "civic").' } });
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

            const countryPrefix = 'us';
            const voteKey = `${countryPrefix}_${targetType}_${targetId}`;
            transaction.update(db.collection('users').doc(userId), { [`votes.${voteKey}`]: true });
            transaction.set(userVoteRef, { vote: voteType, timestamp: admin.firestore.FieldValue.serverTimestamp() });
            
            const updateData = {
                popularity: admin.firestore.FieldValue.increment(1),
                [voteType === 'like' ? 'likes' : 'dislikes']: admin.firestore.FieldValue.increment(1)
            };
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
        
        let responseBody;
        if (transactionResult.status === 'ALREADY_VOTED') {
            responseBody = { success: false, message: `Już oddano głos na ten cel (${targetType}).`, alreadyVoted: true, counters: transactionResult.counters };
        } else {
            responseBody = { success: true, message: 'Głos został pomyślnie oddany.', votedNow: true, counters: transactionResult.counters };
        }
        return res.status(200).json({ data: responseBody });

    } catch (error) {
        console.error('Błąd podczas głosowania:', { targetId, targetType, userId, voteType, error });
        if (error.status && error.code) {
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
  getCivicProjects,
  citizenVote
};