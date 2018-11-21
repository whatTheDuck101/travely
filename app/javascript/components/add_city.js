// selects first trip field inputs (city, start_date, end_date)
const tripField = document.querySelector('#trip-field-1');
function addNewCityField() {
  const addCityButton = document.querySelector('#add-city');
  addCityButton.addEventListener('click', (event) => {
    event.preventDefault();
    const tripId = newTripId()
    addCityButton.insertAdjacentHTML("beforebegin", buildNewCityFields(tripId));
  });
}


//retrieves the last trip id and generates a new one by incrementing the id
function newTripId() {
  const tripForms = document.querySelectorAll('.trip-field');
  const lastTripIdNumber = Number(tripForms[tripForms.length - 1].id.split("-")[2])
  const newTripIdNumber = lastTripIdNumber + 1
  const newTripId = `trip-field-${newTripIdNumber}`
  return newTripId
}

function buildNewCityFields(newTripId) {
  const tripNumber = Number(newTripId.split("-")[2])
  const element = `<div id=${newTripId} class="trip-field">
    <label for="Please_insert_new_city:">Please insert city:</label>
      <input type="text" name="city${tripNumber}" id="city${tripNumber}" placeholder="New York, Montreal.." required="required">
      <label for="Start_date:">Start date:</label>
      <input type="date" name="start_date${tripNumber}" id="start_date${tripNumber}" value="2018-11-21" required="required">
      <label for="End_date:">End date:</label>
      <input type="date" name="end_date${tripNumber}" id="end_date${tripNumber}" value="2018-11-28" required="required">
      </div>`
  return element
}



export { addNewCityField };


