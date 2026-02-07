const express = require('express');
const app = express();
const { getAppCheck } = require('firebase-admin/app-check');
const admin = require('firebase-admin');
const cors = require('cors');

app.use(cors({ origin: true }));
app.use(express.json());

const firebaseAuthMiddleware = async (req, res, next) => {
    if (req.body && req.body.warmup === true) {
        return next();
    }
    const appCheckToken = req.header('X-Firebase-AppCheck');
    if (!appCheckToken) {
        console.error('[AUTH_CRITICAL] Brak nagłówka X-Firebase-AppCheck.');
        return res.status(401).send('Unauthorized: Missing App Check token.');
    }
    try {
        await getAppCheck().verifyToken(appCheckToken);
    } catch (err) {
        console.error(`[AUTH_CRITICAL] App Check ODRZUCONY: ${err.message}`);
        return res.status(401).send('Unauthorized: Invalid App Check token.');
    }
    const authToken = req.headers.authorization?.split('Bearer ')[1];
    if (authToken) {
        try {
            const decodedToken = await admin.auth().verifyIdToken(authToken);
            req.user = decodedToken;
        } catch (error) {
            console.warn('Nieprawidłowy token autoryzacyjny użytkownika, ale kontynuuję (endpoint może być publiczny):', error.message);
        }
    }
    return next();
};

app.use(firebaseAuthMiddleware);

const globalHandlers = require('./handlers/global_handlers');
const plHandlers = require('./handlers/pl_handlers');
const deHandlers = require('./handlers/de_handlers');
const ueHandlers = require('./handlers/ue_handlers');
const frHandlers = require('./handlers/fr_handlers');
const usHandlers = require('./handlers/us_handlers');
const ukHandlers = require('./handlers/uk_handlers');

const functionsMap = {
// --- GLOBAL ---
    'search': globalHandlers.search,
    'checkUserProfile': globalHandlers.checkUserProfile,
    'userOnboarding': globalHandlers.userOnboarding,
    'deleteAccount': globalHandlers.deleteAccount,
    'reportError': globalHandlers.reportError,
    'updateUserProfile': globalHandlers.updateUserProfile,
// --- PL ---
    'pl_getMetadata': plHandlers.getMetadata,
    'pl_getHomeScreenData': plHandlers.getHomeScreenData,
    'pl_getDetails': plHandlers.getDetails,
    'pl_getDeputies': plHandlers.getDeputies,
    'pl_getDeputyDetails': plHandlers.getDeputyDetails,
    'pl_getLegislations': plHandlers.getLegislations,
    'pl_citizenVote': plHandlers.citizenVote,
// --- DE ---
    'de_getMetadata': deHandlers.getMetadata,
    'de_getHomeScreenData': deHandlers.getHomeScreenData,
    'de_getDetails': deHandlers.getDetails,
    'de_getDeputies': deHandlers.getDeputies,
    'de_getDeputyDetails': deHandlers.getDeputyDetails,
    'de_getLegislations': deHandlers.getLegislations,
    'de_citizenVote': deHandlers.citizenVote,
// --- UE ---
    'ue_getMetadata': ueHandlers.getMetadata,
    'ue_getHomeScreenData': ueHandlers.getHomeScreenData,
    'ue_getDetails': ueHandlers.getDetails,
    'ue_getDeputies': ueHandlers.getDeputies,
    'ue_getDeputyDetails': ueHandlers.getDeputyDetails,
    'ue_getLegislations': ueHandlers.getLegislations,
    'ue_citizenVote': ueHandlers.citizenVote,
// --- FR ---
    'fr_getMetadata': frHandlers.getMetadata,
    'fr_getHomeScreenData': frHandlers.getHomeScreenData,
    'fr_getDetails': frHandlers.getDetails,
    'fr_getDeputies': frHandlers.getDeputies,
    'fr_getDeputyDetails': frHandlers.getDeputyDetails,
    'fr_getLegislations': frHandlers.getLegislations,
    'fr_citizenVote': frHandlers.citizenVote,
// --- US ---
    'us_getMetadata': usHandlers.getMetadata,
    'us_getHomeScreenData': usHandlers.getHomeScreenData,
    'us_getDetails': usHandlers.getDetails,
    'us_getDeputies': usHandlers.getDeputies,
    'us_getDeputyDetails': usHandlers.getDeputyDetails,
    'us_getLegislations': usHandlers.getLegislations,
    'us_getCivicProjects': usHandlers.getCivicProjects,
    'us_citizenVote': usHandlers.citizenVote,
// --- UK ---
    'uk_getMetadata': ukHandlers.getMetadata,
    'uk_getHomeScreenData': ukHandlers.getHomeScreenData,
    'uk_getDetails': ukHandlers.getDetails,
    'uk_getDeputies': ukHandlers.getDeputies,
    'uk_getDeputyDetails': ukHandlers.getDeputyDetails,
    'uk_getLegislations': ukHandlers.getLegislations,
    'uk_citizenVote': ukHandlers.citizenVote,
};

app.post(/.*/, (req, res) => {
  const functionName = req.path.substring(1);
  const targetFunction = functionsMap[functionName];

  if (targetFunction) {
    console.log(`Wywołuję funkcję: ${functionName}`);
    targetFunction(req, res);
  } else {
    console.error(`Nie znaleziono funkcji dla ścieżki: ${functionName}`);
    res.status(404).send({ error: { code: 'not-found', message: `Function '${functionName}' not found.` } });
  }
});

// --- START ---
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Lustra Backend nasłuchuje na porcie ${PORT}`);
});