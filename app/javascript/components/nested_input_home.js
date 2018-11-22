function highlightLabel() {
  const labels = document.querySelectorAll(".nested-input");
  const nestedLabel = document.querySelectorAll(".nested-label");

  labels.forEach((label) => {
    label.addEventListener("focus", event => {
      // event.preventDefault();
      // nestedLabel.classList.add("red");
      const formLabel = event.target.parentNode;
      const nestedLabel = formLabel.querySelector('.nested-label')
      // nestedLabel.style.color = "red";
      clearStyle();
      nestedLabel.classList.add("highlight-field");
    });

  });

  function clearStyle() {
    nestedLabel.forEach(el => {
      el.classList.remove("highlight-field");
    })
  }

}

export { highlightLabel };

