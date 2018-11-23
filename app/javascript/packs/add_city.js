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
  const newDiv = document.createElement("div");
  newDiv.className = "trip-field";
  newDiv.id = newTripId;
  newDiv.innerHTML = `
      <input type="text" name="stops[${tripNumber}][city]" id="city${tripNumber}" class="nested-input" required="required">
      <input type="date" name="stops[${tripNumber}][start_date]" id="start_date${tripNumber}" class="nested-input" required="required">
      <input type="date" name="stops[${tripNumber}][end_date]" id="end_date${tripNumber}" class="nested-input" required="required">
      <button id="delete-city-${tripNumber} class="delete-city">x</button>
  `;
  return newDiv;
}

addNewCityField();
// export { addNewCityField };
