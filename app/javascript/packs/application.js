import "bootstrap";

import { chartQuality } from 'charts/chartQuality';
import { toggleCardMain } from 'components/cardMain';

if (document.getElementById("show-sample-historic-chart")) {
  const myId = document.getElementById("show-sample-historic-chart");
  const acidity = JSON.parse("[" + myId.dataset.acidity + "]");
  const clean = JSON.parse("[" + myId.dataset.clean + "]");
  const sweetness = JSON.parse("[" + myId.dataset.sweetness + "]");
  const labels = myId.dataset.labels.split(',');
  chartQuality(acidity, clean, sweetness, labels);
};

// if (document.getElementById("pending-create")) {
//   document.getElementById("pending-create").addEventListener('click', (event) => {
//     event.preventDefault();
//     sampleCreateForm(event);
//   });
// }
if (document.querySelector('.card-box')) {
  toggleCardMain();
};

if (document.querySelector(".removable a")) {
  document.querySelectorAll(".card-box").forEach((card) => {
    if (card.querySelector(".removable a")) {
      card.querySelector(".removable a").addEventListener("click", (event) => {
        card.classList.add("removed-item");
        setTimeout(() => { card.innerHTML = ""; }, 1000);
      });
    };
  });
};

if (document.querySelector(".modal_save")) {
  document.querySelectorAll(".card-box").forEach((card) => {
    document.getElementById('modal-' + card.id).querySelector('.modal_save').addEventListener("click", (event) => {
      $('#modal-close-' + card.id).click();

      // event.currentTarget.classList.add("hide")
      card.classList.add("removed-item");
      setTimeout(() => { card.innerHTML = ""; }, 1000);
    })
  })
}




// document.querySelector("[data-sample-id='<%= @sample.id %>']").remove();
