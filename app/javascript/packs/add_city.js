var places = require('places.js');


// selects first trip field inputs (city, start_date, end_date)
const firstTripField = document.querySelector("#trip-field-1");

function addNewCityField() {
  const addCityButton = document.querySelector("#add-city");
  const formInputs = document.querySelector(".trip-fields");
  if (addCityButton) {
    addCityButton.addEventListener("click", event => {
      event.preventDefault();
      const newTripId = generateNewTripId();
      const tripField = buildNewCityFields(newTripId);
      formInputs.append(tripField);
      bindEventLister(tripField);
      assignAutocompleteToLastCityInput(newTripId.slice(-1));
    });
  }
}

function bindEventLister(element) {
  const btn = element.querySelector("button");
  btn.addEventListener("click", event => {
    event.preventDefault();
    element.remove();
  });
}

function assignAutocompleteToLastCityInput(tripId) {
  var placesAutocomplete = places({
    appId: process.env.ALGOLIA_ID,
    apiKey: process.env.ALGOLIA_API_KEY,
    container: document.querySelector(`#stops_${tripId}_city`),
    style: false
  }).configure({
    type: 'city',
    aroundLatLngViaIP: false,
  });
};

//retrieves the last trip id and generates a new one by incrementing the id
function generateNewTripId() {
  const tripForms = document.querySelectorAll(".trip-field");
  const lastTripIdNumber = Number(
    tripForms[tripForms.length - 1].id.split("-")[2]
  );
  const newTripIdNumber = lastTripIdNumber + 1;
  const newTripId = `trip-field-${newTripIdNumber}`;
  return newTripId;
}

function buildNewCityFields(newTripId) {
  const tripNumber = Number(newTripId.split("-")[2]);
  const today = new Date();
  const new_start_date = document.getElementById(`stops_${tripNumber-1}_end_date`).value || (today.getFullYear() + "-" + today.getMonth() + "-"  + today.getDate())
  let new_end_date = new Date(new_start_date);
  new_end_date.setDate(new_end_date.getDate() + 8);
  let year = new_end_date.getFullYear()
  let month = ("0" + (new_end_date.getMonth()+1)).slice(-2)
  let day = (("0" + new_end_date.getDate()).slice(-2))
  new_end_date = year + "-" + month + "-" + day;
  const newDiv = document.createElement("div");
  newDiv.className = "trip-field";
  newDiv.id = newTripId;
  newDiv.innerHTML = `
      <input type="text" name="stops[${tripNumber}][city]" id="stops_${tripNumber}_city" class="nested-input city-size city-input" required="required" placeholder="Enter Destination">
      <input type="date" name="stops[${tripNumber}][start_date]" id="stops_${tripNumber}_start_date" class="nested-input date-size" required="required" value=${new_start_date}>
      <input type="date" name="stops[${tripNumber}][end_date]" id="stops_${tripNumber}_end_date" class="nested-input date-size" required="required" value=${new_end_date}>
      <button id="delete-city-${tripNumber}" class="delete-city"><i class="fas fa-times-circle"></i></button>
  `;
  return newDiv;
}

addNewCityField();

// export { addNewCityField };
