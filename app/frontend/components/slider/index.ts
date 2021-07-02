import "./index.scss";

import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  declare readonly outputValueTarget: Element
  declare readonly rangeSliderTarget: HTMLInputElement

  static targets = ["rangeSlider", "outputValue"];

  connect() {
    this.element[this.identifier] = this;
  }

  sliderChange() {
    this.outputValueTarget.textContent = this.rangeSliderTarget.value;
  }
}
