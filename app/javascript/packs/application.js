
import "bootstrap";

import { chartQuality } from 'charts/chartQuality';
import { toggleCardMain } from 'components/cardMain';
import {closeModal} from 'components/closeModal';
import {loadDynamicBannerText} from 'components/typed';
import {sweetAlertCustom} from 'components/sweetAlert';


// if (document.getElementById("received-index")) {
//   closeModal();
// };

// if (document.querySelector(".archiving-sample")) {
//   const modalArchive = document.querySelector(".archiving-sample");
//   console.log('ccoucou');
//   console.log(modalArchive);
//   modalArchive.addEventListener('click', (event) => {
//     let modalContainer = document.querySelector(".modal");
//     console.log(modalContainer);
//     modalContainer.modal('toggle');

//   });
// };

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
  document.querySelectorAll(".card-removable").forEach((card) => {
    card.querySelector(".removable a").addEventListener("click", (event) => {
      card.classList.add("removed-item");
      setTimeout(() => { card.innerHTML = ""; }, 1000);
    });
  })
}

if (document.querySelector(".received")) {
  document.querySelectorAll(".card-box").forEach((card) => {
    document.getElementById('modal-' + card.id).querySelector('.modal_save').addEventListener("click", (event) => {
      console.log('#modal-close-' + card.id);
      $('#modal-close-' + card.id).click();

      // event.currentTarget.classList.add("hide")
      card.classList.add("removed-item");
      setTimeout(() => { card.innerHTML = ""; }, 1000);
    })
  })
}

if (document.querySelector(".title-main")) {
  loadDynamicBannerText();
}

if (document.getElementById("sweet-alert-sent")) {
  document.querySelectorAll(".card-box").forEach((card) => {
    card.addEventListener("click", (event) => {
      setTimeout(() => {sweetAlertCustom() }, 1500);
    });
  })
}

