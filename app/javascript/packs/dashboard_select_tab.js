 function selectDashboardTab() {
  const firstTab = document.querySelectorAll('.tablinks')[0];

  document.addEventListener("DOMContentLoaded", () => {
    firstTab.click();
  });
}

selectDashboardTab();

