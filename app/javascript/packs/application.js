import "bootstrap";
import "./progress_bar";

import { chartQuality } from 'charts/chartQuality';

if (document.getElementById("show-sample-historic-chart")) {
  chartQuality();
};
