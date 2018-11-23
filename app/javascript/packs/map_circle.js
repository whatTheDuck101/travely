function highlightMap() {
//selectors:
  const circles = document.querySelectorAll('.circle');


  circles.forEach((circle) => {
    circle.addEventListener("click", event => {
      clearStyle();
      circle.classList.add("selected-circle");
    });
  });



  function clearStyle() {
    circles.forEach(el => {
      el.classList.remove("selected-circle");
    })
  }

}

function addMap() {
  const button = document.querySelector('#add-city');
  const lastMap = document.querySelectorAll('.circle')[document.querySelectorAll('.circle').length - 1];

  button.addEventListener("click", event => {
  const lastContainer = document.querySelectorAll('.container')[document.querySelectorAll('.container').length - 1];
    // const lastCircle = document.querySelector('#last-circle');
    const newMap = `<div class="container", style="height: 100px">
                      <div class="circle"></div>
                    </div>`;
    lastContainer.insertAdjacentHTML("beforebegin", newMap);

    });

}
// insertBefore

addMap();
highlightMap();
