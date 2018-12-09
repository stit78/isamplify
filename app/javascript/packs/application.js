import "bootstrap";

import { chartQuality } from 'charts/chartQuality';
// import { sampleCreateForm } from 'components/samplecreate.js'

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
