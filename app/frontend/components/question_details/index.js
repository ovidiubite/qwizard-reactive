import "./index.scss";

import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  static targets = ["answer", "selectedAnswer", "selectedAnswerContainer", "selectedAnswerIcon", "form"];
  static classes = ["active"]

  connect() {
    // ...
  }

  reset() {
    this.formTarget.reset();

    document.querySelector('[data-controller="slider"]').slider.sliderChange();

    this.selectedAnswerTargets.forEach(input => input.value = false);
    this.selectedAnswerContainerTargets.forEach(input => input.classList.remove(this.activeClass));
    this.selectedAnswerIconTargets.forEach(input => input.classList.remove(this.activeClass));
  }

  selectAnswer(event) {
    const selectedIndex = this.answerTargets.findIndex(e => e === event.target);
    this.selectedAnswerTargets.forEach((input, index) => input.value = index === selectedIndex);

    this.selectedAnswerContainerTargets.forEach((input, index) => index === selectedIndex ? input.classList.add(this.activeClass) : input.classList.remove(this.activeClass));
    this.selectedAnswerIconTargets.forEach((input, index) => index === selectedIndex ? input.classList.add(this.activeClass) : input.classList.remove(this.activeClass));
  }
}

