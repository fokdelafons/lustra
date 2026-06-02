const express = require('express');
const app = express();
const { getAppCheck } = require('firebase-admin/app-check');
const admin = require('firebase-admin');
const cors = require('cors');

app.use(cors({ origin: true }));
app.use(express.json());

const APP_CHECK_PROTECTED_FUNCTIONS = new Set([
    'search',
    'checkUserProfile',
    'userOnboarding',
    'deleteAccount',
    'reportError',
    'updateUserProfile',
    'getUserInteractions',
    'toggleBillTracking',
    'getTrackedItems',
    'createCuratedList',
    'toggleBillInCuratedList',
    'subscribeToCuratedList',
    'getCuratedListFeed',
    'getMyCuratedLists',
    'deleteCuratedList',
    'updateCuratedListMeta',
    'setHighlightedBill',
    'sendCuratedListPush',
]);

function requiresAppCheck(functionName) {
    return APP_CHECK_PROTECTED_FUNCTIONS.has(functionName) || functionName.endsWith('_citizenVote');
}

const authMiddleware = async (req, res, next) => {
    if (req.body && req.body.warmup === true) {
        return next();
    }

    const functionName = req.path.substring(1);
    if (requiresAppCheck(functionName)) {
        const appCheckToken = req.header('X-Firebase-AppCheck');
        if (!appCheckToken) {
            console.error(`[AUTH_CRITICAL] Brak nagłówka X-Firebase-AppCheck dla funkcji: ${functionName}.`);
            return res.status(401).send('Unauthorized: Missing App Check token.');
        }
        try {
            await getAppCheck().verifyToken(appCheckToken);
        } catch (err) {
            console.error(`[AUTH_CRITICAL] App Check ODRZUCONY dla funkcji ${functionName}: ${err.message}`);
            return res.status(401).send('Unauthorized: Invalid App Check token.');
        }
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

app.use(authMiddleware);

const globalHandlers = require('./handlers/global_handlers');
const { countryConfigs } = require('./handlers/country_configs');
const { createCountryHandlers, createCountryRoutes } = require('./handlers/create_country_handlers');

function createUnifiedCountryRoutes(countryCodes) {
  return Object.fromEntries(
    countryCodes.flatMap((countryCode) => {
      const handlers = createCountryHandlers(countryConfigs[countryCode]);
      return Object.entries(createCountryRoutes(countryCode, handlers, { citizenVote: globalHandlers.citizenVote }));
    })
  );
}

const functionsMap = {
// --- GLOBAL ---
    'search': globalHandlers.search,
    'checkUserProfile': globalHandlers.checkUserProfile,
    'userOnboarding': globalHandlers.userOnboarding,
    'deleteAccount': globalHandlers.deleteAccount,
    'reportError': globalHandlers.reportError,
    'updateUserProfile': globalHandlers.updateUserProfile,
    'getUserInteractions': globalHandlers.getUserInteractions,
    'toggleBillTracking': globalHandlers.toggleBillTracking,
    'getTrackedItems': globalHandlers.getTrackedItems,
    'createCuratedList': globalHandlers.createCuratedList,
    'toggleBillInCuratedList': globalHandlers.toggleBillInCuratedList,
    'subscribeToCuratedList': globalHandlers.subscribeToCuratedList,
    'getCuratedListFeed': globalHandlers.getCuratedListFeed,
    'getMyCuratedLists': globalHandlers.getMyCuratedLists,
    'deleteCuratedList': globalHandlers.deleteCuratedList,
    'updateCuratedListMeta': globalHandlers.updateCuratedListMeta,
    'setHighlightedBill': globalHandlers.setHighlightedBill,
    'sendCuratedListPush': globalHandlers.sendCuratedListPush,
// --- UNIFIED COUNTRIES ---
    ...createUnifiedCountryRoutes(['pl', 'us', 'uk']),
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