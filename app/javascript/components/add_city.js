const tripField = document.querySelector('#trip-field-1');
function addNewCityField() {
  const addCityButton = document.querySelector('#add-city');
  addCityButton.addEventListener('click', (event) => {
    event.preventDefault();
    addCityButton.insertAdjacentHTML("beforebegin",
      `<div id='trip-field-${newTripId()}' class='trip-field'>${tripField.innerHTML}</div>`
    );
    newTripId()
  });
}

function newTripId() {
  const tripForms = document.querySelectorAll('.trip-field');
  const lastTripId = tripForms[tripForms.length - 1]
  return Number(lastTripId.id.split("-")[2]) + 1
}

newTripId()

export { addNewCityField };
