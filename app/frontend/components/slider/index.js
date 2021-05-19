import "./index.scss";

import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  static targets = ["rangeSlider", "outputValue"];

  connect() {
    // ...
  }

  sliderChange(event) {
    this.outputValueTarget.textContent = this.rangeSliderTarget.value;
  }
}
