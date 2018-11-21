// selects first trip field inputs (city, start_date, end_date)
const tripField = document.querySelector('#trip-field-1');
function addNewCityField() {
  const addCityButton = document.querySelector('#add-city');
  addCityButton.addEventListener('click', (event) => {
    event.preventDefault();
    addCityButton.insertAdjacentHTML("beforebegin",
      `<div id=${newTripId()} class='trip-field'>${tripField.innerHTML}</div>`
    );
    newTripId()
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

newTripId()

export { addNewCityField };
