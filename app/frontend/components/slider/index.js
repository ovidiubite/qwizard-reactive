import "./index.scss";

import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  static targets = ["rangeSlider", "outputValue"];

  connect() {
    this.element[this.identifier] = this;
  }

  sliderChange(event) {
    this.outputValueTarget.textContent = this.rangeSliderTarget.value;
  }
}
