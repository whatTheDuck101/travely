const form = document.querySelector("#form");
// const submitButton = submitButtons[0];

function showLoader() {
  console.log("hello from showLoader")
  var donut = document.querySelector(".donut");
  setTimeout(function(){ donut.style.display = "block" }, 220)
}

form.addEventListener("submit", showLoader);




