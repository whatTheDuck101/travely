var places = require('places.js');

(function () {
  var placesAutocomplete = places({
    appId: process.env.ALGOLIA_ID,
    apiKey: process.env.ALGOLIA_API_KEY,
    container: document.querySelector('#city-input'),

  }).configure({
    type: 'city',
    aroundLatLngViaIP: false,
  });
})();
