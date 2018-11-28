const form = document.querySelector("#form");

function showLoader() {
  var donut = document.querySelector(".donut");
  setTimeout(function(){ donut.style.display = "block" }, 220)
}

form.addEventListener("submit", showLoader);




