
    const admin = require('firebase-admin');
    const snowball = require('node-snowball');
    const getPolishStem = require('stemmer_pl');
    const { SecretManagerServiceClient } = require('@google-cloud/secret-manager');
    const { Resend } = require('resend');

    if (!admin.apps.length) {
    admin.initializeApp();
    }

    const db = admin.firestore();
    const auth = admin.auth();
    const stemmers = { 'pl': getPolishStem, 'eng': (w) => snowball.stemword(w, 'english'), 'fr': (w) => snowball.stemword(w, 'french'), 'es': (w) => snowball.stemword(w, 'spanish'), 'pt': (w) => snowball.stemword(w, 'portuguese'), 'it': (w) => snowball.stemword(w, 'italian'), 'de': (w) => snowball.stemword(w, 'german'), 'nl': (w) => snowball.stemword(w, 'dutch') };

    function localizeDocument(docData, langCode = 'pl') {
    if (!docData) return null;
    const getLocalizedValue = (baseFieldName, isArray = false, fallbackValue = null) => {
        let value = docData[`${langCode}_${baseFieldName}`] ?? docData[`pl_${baseFieldName}`] ?? docData[baseFieldName] ?? fallbackValue;
        return value ?? (isArray ? [] : null);
    };
    
    const aiTitle = getLocalizedValue('ai_title');
    const nativeTitle = getLocalizedValue('title');
    const finalTitle = aiTitle || nativeTitle || docData.titleOfficial || '';

    return {
        ...Object.keys(docData).reduce((acc, key) => {
            if (!key.match(/^(pl|eng|de|it|pt|fr|nl|es)_/)) acc[key] = docData[key];
            return acc;
        }, {}),
        title: finalTitle,
        description: getLocalizedValue('summary', false, getLocalizedValue('description')) || docData.status || '',
        key_Points: getLocalizedValue('key_points', true, []),
        statusText: docData.description ?? null,
        id: docData.id
    };
    }

    const supportedLangs = ['pl', 'eng', 'de', 'it', 'pt', 'fr', 'nl', 'es'];
    const defaultLang = 'eng'; 
    const langAliases = {
    'polish': 'pl', 'pol': 'pl', 'pl': 'pl',
    'english': 'eng', 'eng': 'eng', 'en': 'eng',
    'german': 'de', 'ger': 'de', 'deu': 'de', 'de': 'de',
    'italian': 'it', 'ita': 'it', 'it': 'it',
    'portuguese': 'pt', 'por': 'pt', 'pt': 'pt',
    'french': 'fr', 'fre': 'fr', 'fra': 'fr', 'fr': 'fr',
    'dutch': 'nl', 'dut': 'nl', 'nld': 'nl', 'nl': 'nl',
    'spanish': 'es', 'spa': 'es', 'es': 'es',
    };

    const countryToDefaultLang = {
        'pl': 'pl',
        'us': 'eng',
        'uk': 'eng',
        'ue': 'eng',
        'de': 'de',
        'fr': 'fr',
        'es': 'es',
        'it': 'it',
        'pt': 'pt',
        'nl': 'nl'
    };

    // --- SEARCH ---

    const search = async (req, res) => {
        if (req.body.warmup === true) {
            console.log("search: Otrzymano żądanie rozgrzewające.");
            return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
        }
        const startTime = Date.now();
            try {
            const data = req.body.data || req.body;
            const { type, country, searchQuery, lang: uiLang, term, limit: queryLimit, offset: queryOffset, ...otherParams } = data;
            const offset = parseInt(queryOffset) || 0;
            const limit = parseInt(queryLimit) || 20;

            const searchLang = countryToDefaultLang[country] || 'eng';
            const normalizedUiLang = langAliases[uiLang?.toLowerCase()] || defaultLang;
            const displayLang = supportedLangs.includes(normalizedUiLang) ? normalizedUiLang : defaultLang;

            if (!type || !searchQuery || !country || !uiLang) {
                return res.status(400).json({ error: { code: 'invalid-argument', message: "Brak wymaganych parametrów: type, country, searchQuery, lang." } });
            }
            if (type === 'legislations' && !term) {
                return res.status(400).json({ error: { code: 'invalid-argument', message: "Brak wymaganego parametru 'term' dla wyszukiwania legislacji." } });
            }
            const normalizedRawText = searchQuery.toLowerCase()
                .replace(/[äăâàá]/g, 'a').replace(/[öôòó]/g, 'o').replace(/[üûùú]/g, 'u')
                .replace(/ß/g, 'ss').replace(/[ęėèé]/g, 'e').replace(/[ąãà]/g, 'a')
                .replace(/[ćčç]/g, 'c').replace(/[łľ]/g, 'l').replace(/[ńňñ]/g, 'n')
                .replace(/[śšş]/g, 's').replace(/[żźž]/g, 'z').replace(/[ýỳ]/g, 'y')
                .replace(/[îì]/g, 'i').replace(/[^a-z0-9\s]/g, '');
            
            const rawTokens = normalizedRawText.split(/\s+/).filter(w => w.length > 0);

            if (rawTokens.length === 0) {
                return res.status(200).json({ data: { results: [], meta: { total: 0, count: 0 } } });
            }

            const jobKey = `${country}_${type}${term ? `_term_${term}` : ''}`;
            const wordsCollectionRef = db.collection('_searchIndex').doc(jobKey).collection('words');
            const docIdSets = [];
            const priorityIds = new Map(); 

            const getStemmer = (lang) => stemmers[lang] || ((t) => t);

            for (const rawToken of rawTokens) {
                const stem1 = getStemmer(searchLang)(rawToken);       
                const stem2 = getStemmer(normalizedUiLang)(rawToken); 
                
                const wordsToCheck = new Set([stem1, stem2]);
                if (rawToken.length > 2) wordsToCheck.add(rawToken); 
                
                const docRefs = [];
                wordsToCheck.forEach(w => {
                    docRefs.push(wordsCollectionRef.doc(w));
                    docRefs.push(wordsCollectionRef.doc(`id_${w}`));
                });

                const docsSnapshots = await db.getAll(...docRefs);

                const idsForThisToken = new Set();
                let tokenExistsInDB = false;

                docsSnapshots.forEach(docSnap => {
                    if (!docSnap.exists) return;
                    tokenExistsInDB = true;
                    
                    const data = docSnap.data();
                    const isIdDoc = docSnap.id.startsWith('id_');

                    const collect = (lang) => {
                         if (data[lang] && Array.isArray(data[lang])) {
                             data[lang].forEach(id => {
                                 idsForThisToken.add(id);
                                 if (isIdDoc) {
                                     const currentScore = priorityIds.get(id) || 0;
                                     priorityIds.set(id, currentScore + 1);
                                 }
                             });
                         }
                    };

                    collect(searchLang);
                    if (searchLang !== normalizedUiLang) collect(normalizedUiLang);
                });

                if (idsForThisToken.size > 0) {
                    docIdSets.push(idsForThisToken);
                } else if (tokenExistsInDB && rawToken.length > 2) {
                    // Token istnieje w bazie, ale brak wyników dla naszych języków.
                    // Jeśli słowo długie (>2) -> Traktujemy jako brak dopasowania (AND fail).
                    // Jeśli krótkie (<=2) -> Ignorujemy (Soft AND dla spójników "do", "i").
                    return res.status(200).json({ data: { results: [], meta: { total: 0, count: 0 } } });
                }
            }

            if (docIdSets.length === 0) {
                return res.status(200).json({ data: { results: [], meta: { total: 0, count: 0 } } });
            }
                    
            let intersection = docIdSets.reduce((a, b) => new Set([...a].filter(x => b.has(x))));
            const finalIds = Array.from(intersection);

            if (finalIds.length === 0) {
                return res.status(200).json({ data: { results: [], meta: { total: 0, count: 0 } } });
            }

            const collectionName = `${country}_${type}`;
            let allMatchingDocs = [];
            for (let i = 0; i < finalIds.length; i += 30) {
                const chunk = finalIds.slice(i, i + 30);
                if (chunk.length === 0) continue;
                const snapshot = await db.collection(collectionName).where(admin.firestore.FieldPath.documentId(), 'in', chunk).get();
                snapshot.forEach(doc => allMatchingDocs.push({ id: doc.id, ...doc.data() }));
            }

                    let finalResults = (type === 'legislations') ? allMatchingDocs.map(doc => localizeDocument(doc, displayLang)) : allMatchingDocs;
            if (type === 'deputies' && otherParams.club) {
                finalResults = finalResults.filter(item => item.club === otherParams.club);
            }

            const lowerQuery = searchQuery.toLowerCase();

            finalResults.sort((a, b) => {
                const aIdBoost = priorityIds.get(a.id) || 0;
                const bIdBoost = priorityIds.get(b.id) || 0;
                if (aIdBoost !== bIdBoost) return bIdBoost - aIdBoost;

                // 2. Priorytet Frazy (Czy tytuł/opis zawiera wpisany tekst?)
                const checkPhrase = (doc) => {
                    // Sprawdzamy tytuły (oryginalny, AI, oficjalny) oraz opis
                    const title = (doc.title || doc[`${displayLang}_ai_title`] || doc.titleOfficial || '').toLowerCase();
                    const summary = (doc.description || doc[`${displayLang}_summary`] || '').toLowerCase();
                    
                    if (title.includes(lowerQuery)) return 2; // Tytuł to silne trafienie
                    if (summary.includes(lowerQuery)) return 1; // Opis to słabsze trafienie
                    return 0;
                };

                const aPhraseScore = checkPhrase(a);
                const bPhraseScore = checkPhrase(b);
                if (aPhraseScore !== bPhraseScore) return bPhraseScore - aPhraseScore;

                // 3. Sortowanie po Dacie (Najnowsze na górze)
                if (type === 'legislations') {
                    // Priorytet dla najnowszych dokumentów
                    const dateA = a.documentDate?._seconds || a.processStartDate?._seconds || 0;
                    const dateB = b.documentDate?._seconds || b.processStartDate?._seconds || 0;
                    if (dateB !== dateA) return dateB - dateA;
                    
                    // Dopiero na samym końcu popularność jako fallback
                    return (b.popularity || 0) - (a.popularity || 0);
                } else if (type === 'deputies') {
                    return (a.lastName || a.name || '').localeCompare(b.lastName || b.name || '');
                }
                return 0;
            });

            const total = finalResults.length;
            const paginatedResults = finalResults.slice(offset, offset + limit);

            const response = { results: paginatedResults, meta: { total, offset, limit, count: paginatedResults.length, searchQuery, searchTime: Date.now() - startTime, appliedFilters: otherParams } };
            return res.status(200).json({ data: response });

        } catch (error) {
            console.error('[Search] Błąd:', error);
            return res.status(500).json({ error: { code: 'internal', message: 'Wystąpił wewnętrzny błąd serwera podczas wyszukiwania.' } });
        }
    };

// --- CHECKUSERPROFILE ---

    const checkUserProfile = async (req, res) => {
        if (req.body.warmup === true) {
            console.log("checkUserProfile: Otrzymano żądanie rozgrzewające.");
            return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
        }
        const uid = req.user?.uid;
        if (!uid) {
            return res.status(401).json({ error: { code: 'unauthenticated', message: 'The function must be called with a userId.' } });
        }
        const userDocRef = db.collection("users").doc(uid);
        try {
            const userDoc = await userDocRef.get();
            if (userDoc.exists) {
                const userData = userDoc.data();
                
                return res.status(200).json({ 
                    data: { 
                        exists: true, 
                        profile: {
                            marketingConsent: userData.marketingConsent ?? false,
                            notificationsEnabled: userData.notificationsEnabled ?? false,
                            notificationParliamentId: userData.notificationParliamentId ?? null,
                            primaryParliamentId: userData.primaryParliamentId ?? null,
                            votes: userData.votes || {}
                        }
                    } 
                });
            } else {
                return res.status(200).json({ data: { exists: false } });
            }
        } catch (error) {
            console.error(`Błąd podczas sprawdzania profilu dla ${uid}:`, error);
            return res.status(500).json({ error: { code: 'internal', message: 'An internal error occurred while checking the user profile.' } });
        }
    };

    // --- USERONBOARDING ---

    const userOnboarding = async (req, res) => {
        if (req.body.warmup === true) {
            console.log("userOnboarding: Otrzymano żądanie rozgrzewające.");
            return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
        }

        const data = req.body.data || req.body;
        const { marketingConsent, parliamentId } = data;
        const uid = req.user?.uid;
        const email = req.user?.email;

        // LOGOWANIE BŁĘDU AUTORYZACJI
        if (!uid || !email) {
            console.error(`[AUTH_CRITICAL] userOnboarding odrzucony. UID: ${uid}, Email: ${email}. Token Auth mógł nie dotrzeć z Frontendu.`);
            return res.status(401).json({ error: { code: 'unauthenticated', message: 'The function must be called with a uid and email.' } });
        }
        
        if (typeof marketingConsent !== 'boolean' || !parliamentId || typeof parliamentId !== 'string') {
            return res.status(400).json({ error: { code: 'invalid-argument', message: 'Bad Request: Invalid or missing parameters.' } });
        }

        const userDocRef = db.collection("users").doc(uid);
        try {
            const userDoc = await userDocRef.get();
            if (userDoc.exists) {
                return res.status(200).json({ data: { status: "already_exists" } });
            }

            await userDocRef.set({
                email: email,
                createdAt: admin.firestore.FieldValue.serverTimestamp(),
                marketingConsent: marketingConsent,
                primaryParliamentId: parliamentId,
            });

            await auth.setCustomUserClaims(uid, { profileComplete: true });

            try {
                const client = new SecretManagerServiceClient();
                const [version] = await client.accessSecretVersion({
                name: 'projects/lustra-d8fdf/secrets/RESEND_API_KEY/versions/latest',
                });
                const apiKey = version.payload.data.toString();

                // 2. Wyślij
                const resend = new Resend(apiKey);
                await resend.emails.send({
                    from: 'Jacek from Lustra Initiative <jacek@lustra.news>',
                    reply_to: 'jacek@lustra.dev',
                    to: email,
                    subject: 'Welcome & How to use Lustra effectively.',
                    html: `
                <div style="font-family: Arial, sans-serif; color: #333; line-height: 1.6;">
                    <p>Hello Stranger,</p>
                    <p>While you are here, a quick note on what you just joined.</p>
                    <p>Lustra is <strong>not</strong> social media platform. We don't want your attention, we want your action.</p>
                    <p>Lustra is <strong>not</strong> a petition site like Change.org. We don't beg politicians, we audit them.</p>
                    
                    <h3>How to use it:</h3>
                    <ul>
                        <li><strong>Read the Facts:</strong> Our summaries strip away the political spin.</li>
                        <li><strong>Vote:</strong> Build a real-time public record of what citizens actually want.</li>
                        <li><strong>Share Evidence:</strong> Use the "Share" button to generate instant fact-cards for Instagram, X, TikTok, etc.</li>
                        <li><strong>Draft Laws:</strong> Collect support under your own projects. Create pressure.</li>
                    </ul>
                    
                    <p>You now have the same data as the lobbyists. Use it.</p>
                    <p>Jacek<br>Founder, Lustra.news<br><a href="https://reddit.com/r/civicevolution" style="color: #000; text-decoration: underline;">r/civicevolution</a></p>
                    </div>
                    `
                });
                console.log(`Welcome email sent to ${email}`);
            } catch (emailError) {
                console.error(`Failed to send welcome email to ${email}:`, emailError);
            }
            return res.status(200).json({ data: { status: "success" } });
        
        } catch (error) {
            console.error(`Błąd podczas tworzenia profilu dla ${uid}:`, error);
            return res.status(500).json({ error: { code: 'internal', message: 'An internal server error occurred.' } });
        }
    };

    // --- DELETEACCOUNT ---

    const deleteAccount = async (req, res) => {
        const uid = req.user?.uid;
        if (!uid) {
            return res.status(401).json({ error: { code: 'unauthenticated', message: 'The function must be called with a userId.' } });
        }

        const userDocRef = db.collection('users').doc(uid);
        try {
            const userDoc = await userDocRef.get();
        
            if (userDoc.exists) {
                const userData = userDoc.data();
                const userVotes = userData.votes;

                if (userVotes && Object.keys(userVotes).length > 0) {
                    console.log(`Znaleziono ${Object.keys(userVotes).length} głosów do usunięcia dla użytkownika ${uid}.`);
                    
                    const batch = db.batch();
                    
                    for (const voteKey in userVotes) {
                        const parts = voteKey.split('_');
                        
                        if (parts.length < 3) {
                            console.warn(`Nieprawidłowy format klucza głosu: ${voteKey}. Pomijam.`);
                            continue;
                        }
                        const countryPrefix = parts[0];
                        const targetType = parts[1];
                        const targetId = parts.slice(2).join('_');

                        let collectionName;
                        if (targetType === 'legislation') collectionName = `${countryPrefix}_legislations`;
                        else if (targetType === 'deputy') collectionName = `${countryPrefix}_deputies`;
                        else if (targetType === 'civic') collectionName = `${countryPrefix}_civic`; 
                        else {
                            console.warn(`Nieznany typ celu w kluczu głosu: ${voteKey}. Pomijam.`);
                            continue;
                        }

                        const targetDocRef = db.collection(collectionName).doc(targetId);
                        const voteDocRef = targetDocRef.collection('user_votes').doc(uid);
                        
                        
                        const voteSnapshot = await voteDocRef.get();
                        if (voteSnapshot.exists) {
                            const voteData = voteSnapshot.data();
                            const voteType = voteData.vote;

                            const decrementUpdate = {
                                popularity: admin.firestore.FieldValue.increment(-1),
                            };
                            if (voteType === 'like') {
                                decrementUpdate.likes = admin.firestore.FieldValue.increment(-1);
                            } else if (voteType === 'dislike') {
                                decrementUpdate.dislikes = admin.firestore.FieldValue.increment(-1);
                            }

                            batch.update(targetDocRef, decrementUpdate);
                            batch.delete(voteDocRef);
                        } else {

                            console.warn(`Brak subdokumentu głosu dla ${targetId}, mimo wpisu w profilu.`);
                        }
                    }
                    
                    await batch.commit();
                    console.log(`Pomyślnie usunięto głosy i zaktualizowano liczniki dla użytkownika ${uid}.`);
                }
                await userDocRef.delete();
            }
            
            await admin.auth().deleteUser(uid);
            return res.status(200).json({ data: { status: "success", message: "Account and associated votes deleted successfully." } });

        } catch (error) {
            console.error(`Błąd podczas usuwania konta dla ${uid}:`, error);
            return res.status(500).json({ error: { code: 'internal', message: 'Failed to delete account.', details: error.message } });
        }
    };

// --- UPDATEUSERPROFILE

    const updateUserProfile = async (req, res) => {
        if (req.body.warmup === true) {
            console.log("updateUserProfile: Otrzymano żądanie rozgrzewające.");
            return res.status(200).json({ data: { status: 'warmed_up_successfully' } });
        }
        const uid = req.user?.uid;
        if (!uid) {
            return res.status(401).json({ error: { code: 'unauthenticated', message: 'The function must be called while authenticated.' } });
        }
        const data = req.body.data || req.body;
        const allowedUpdates = ['notificationsEnabled', 'fcmToken', 'notificationParliamentId', 'marketingConsent'];
        const updateData = {};
        for (const key of allowedUpdates) {
            if (data[key] !== undefined) {
                updateData[key] = data[key];
            }
        }
        if (updateData['notificationsEnabled'] === false) {
            updateData['notificationParliamentId'] = admin.firestore.FieldValue.delete();
        }

        if (Object.keys(updateData).length === 0) {
            return res.status(400).json({ error: { code: 'invalid-argument', message: 'No valid fields to update were provided.' } });
        }
        const userDocRef = db.collection("users").doc(uid);
        try {
            await userDocRef.update({
                ...updateData,
                updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            });
            return res.status(200).json({ data: { status: "success", message: "User profile updated." } });
        } catch (error) {
            console.error(`Błąd podczas aktualizacji profilu dla ${uid}:`, error);
            return res.status(500).json({ error: { code: 'internal', message: 'An internal error occurred while updating the user profile.' } });
        }
    };

    // --- REPORTERROR ---

    const reportError = async (req, res) => {
        const data = req.body.data || req.body || {};
        const { targetId, targetType, message, source } = data;
        const uid = req.user?.uid;

        if (!uid) {
            return res.status(401).json({ error: { code: 'unauthenticated', message: 'The function must be called with a userId.' } });
        }

        try {
            if (!targetId || !targetType || !message || !source) {
                return res.status(400).json({ error: { code: 'invalid-argument', message: 'Bad Request: Missing targetId, targetType, message, or source.' } });
            }
        
            const sanitizedMessage = message.trim().replace(/<[^>]*>/g, '');
            if (sanitizedMessage.length === 0 || sanitizedMessage.length > 400) {
                return res.status(400).json({ error: { code: 'invalid-argument', message: 'Bad Request: Message is empty or too long (max 400 chars).' } });
            }
            if (!['legislation', 'deputy'].includes(targetType)) {
                return res.status(400).json({ error: { code: 'invalid-argument', message: 'Bad Request: Invalid targetType.' } });
            }

            const reportRef = db.collection('user_reports').doc();
            const reportData = { targetId, targetType, userId: uid, source, message: sanitizedMessage, createdAt: admin.firestore.FieldValue.serverTimestamp() };
            await reportRef.set(reportData);

            return res.status(200).json({ data: { success: true, message: 'Report has been sent successfully.' } });

        } catch (error) {
            console.error(`[reportError] Nieoczekiwany błąd dla użytkownika ${uid}:`, error);
            return res.status(500).json({ error: { code: 'internal', message: 'An internal server error occurred.' } });
        }
    };

    module.exports = {
    search,
    checkUserProfile,
    userOnboarding,
    deleteAccount,
    reportError,
    updateUserProfile
    };