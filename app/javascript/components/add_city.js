const tripField = document.querySelector('#trip-field-1');
console.log(tripField)
function addNewCityField() {
  const addCityButton = document.querySelector('#add-city');
  addCityButton.addEventListener('click', (event) => {
    event.preventDefault();
    addCityButton.insertAdjacentHTML("beforebegin", tripField.innerHTML);
  });
}


export { addNewCityField };
