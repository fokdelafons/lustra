const { createHomeScreenDataV2Handler } = require('../unified/home_screen_v2');
const { createMetadataHandler } = require('../unified/metadata');
const { createDetailsHandler } = require('../unified/details');
const { createDeputiesHandler } = require('../unified/deputies');
const { createDeputyDetailsHandler } = require('../unified/deputy_details');
const { createLegislationsHandler } = require('../unified/legislations');
const { createCivicProjectsHandler } = require('../unified/civic_projects');
const { DEFAULT_CACHE_TTL_SECONDS } = require('../config/cache');

function pickDefined(values) {
  return Object.fromEntries(
    Object.entries(values).filter(([, value]) => value !== undefined)
  );
}

function getLocaleDefaults(defaultLang) {
  if (defaultLang === 'pl') {
    return {
      noTitleFallback: 'Brak tytułu',
      noSummaryFallback: 'Przepraszamy, brak podsumowania w tym momencie.',
    };
  }

  return {};
}

function createCountryHandlers(config = {}) {
  const {
    country,
    defaultLang = 'eng',
    cacheTtlSeconds = DEFAULT_CACHE_TTL_SECONDS,
    noTitleFallback,
    noSummaryFallback,
    mapDeputy,
    metadata = {},
    homeScreen = {},
    details = {},
    deputies = {},
    deputyDetails = {},
    legislations = {},
    civicProjects = {},
  } = config;

  if (!country) {
    throw new Error("createCountryHandlers requires 'country' config.");
  }

  const localeDefaults = getLocaleDefaults(defaultLang);
  const commonLocalizedConfig = pickDefined({
    country,
    defaultLang,
    cacheTtlSeconds,
    noTitleFallback: noTitleFallback ?? localeDefaults.noTitleFallback,
    noSummaryFallback: noSummaryFallback ?? localeDefaults.noSummaryFallback,
  });

  const homeScreenDataV2 = createHomeScreenDataV2Handler({
    ...commonLocalizedConfig,
    ...homeScreen,
  });

  return {
    getMetadata: createMetadataHandler({
      country,
      ...metadata,
    }),
    getHomeScreenData: homeScreenDataV2,
    getHomeScreenDataV2: homeScreenDataV2,
    getDetails: createDetailsHandler({
      ...commonLocalizedConfig,
      mapDeputy,
      ...details,
    }),
    getDeputies: createDeputiesHandler({
      ...pickDefined({ country, cacheTtlSeconds, mapDeputy }),
      ...deputies,
    }),
    getDeputyDetails: createDeputyDetailsHandler({
      ...commonLocalizedConfig,
      mapDeputyProfile: mapDeputy,
      ...deputyDetails,
    }),
    getLegislations: createLegislationsHandler({
      ...commonLocalizedConfig,
      ...legislations,
    }),
    getCivicProjects: createCivicProjectsHandler({
      ...commonLocalizedConfig,
      ...civicProjects,
    }),
  };
}

function createCountryRoutes(countryCode, handlers, sharedHandlers = {}) {
  const routes = {
    [`${countryCode}_getMetadata`]: handlers.getMetadata,
    [`${countryCode}_getHomeScreenData`]: handlers.getHomeScreenDataV2,
    [`${countryCode}_getDetails`]: handlers.getDetails,
    [`${countryCode}_getDeputies`]: handlers.getDeputies,
    [`${countryCode}_getDeputyDetails`]: handlers.getDeputyDetails,
    [`${countryCode}_getLegislations`]: handlers.getLegislations,
    [`${countryCode}_getCivicProjects`]: handlers.getCivicProjects,
    [`${countryCode}_getHomeScreenDataV2`]: handlers.getHomeScreenDataV2,
  };

  if (sharedHandlers.citizenVote) {
    routes[`${countryCode}_citizenVote`] = sharedHandlers.citizenVote;
  }

  return routes;
}

module.exports = {
  createCountryHandlers,
  createCountryRoutes,
};
