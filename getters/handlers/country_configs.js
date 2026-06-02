const { mapDeputyTemporaryBirthDate } = require('../unified/deputies');

const countryConfigs = {
  pl: {
    country: 'pl',
    defaultLang: 'pl',
    // TODO(PL temporary): remove when PL birthDate is migrated to String|null.
    mapDeputy: mapDeputyTemporaryBirthDate,
    metadata: {
      defaultTerm: 10,
    },
  },

  us: {
    country: 'us',
    defaultLang: 'eng',
    metadata: {
      defaultTerm: 119,
    },
  },

  uk: {
    country: 'uk',
    defaultLang: 'eng',
    // TODO(UK temporary): remove when UK birthDate is migrated to String|null.
    mapDeputy: mapDeputyTemporaryBirthDate,
    metadata: {
      defaultTerm: 119,
    },
  },
};

module.exports = {
  countryConfigs,
};
