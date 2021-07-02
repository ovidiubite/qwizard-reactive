import "./index.scss";

import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  static targets = ["answer", "selectedAnswer", "selectedAnswerContainer", "selectedAnswerIcon", "form", "orderInput"];
  static classes = ["active"];

  declare readonly formTarget: HTMLFormElement
  declare readonly orderInputTarget: HTMLInputElement
  declare readonly answerTargets: Element[]
  declare readonly selectedAnswerTargets: HTMLInputElement[]
  declare readonly selectedAnswerContainerTargets: Element[]
  declare readonly selectedAnswerIconTargets: Element[]

  declare readonly activeClass: string

  connect() {
    // ...
  }

  reset() {
    const currentOrder = parseInt(this.orderInputTarget.value);

    this.formTarget.reset();

    const slider = document.querySelector('[data-controller="slider"]');
    (slider as any).slider.sliderChange();

    this.selectedAnswerTargets.forEach(input => input.value = false.toString());
    this.selectedAnswerContainerTargets.forEach(input => input.classList.remove(this.activeClass));
    this.selectedAnswerIconTargets.forEach(input => input.classList.remove(this.activeClass));

    this.orderInputTarget.value = (currentOrder + 1).toString();
  }

  selectAnswer(event) {
    const selectedIndex = this.answerTargets.findIndex(e => e === event.target);
    this.selectedAnswerTargets.forEach((input, index) => input.value = (index === selectedIndex).toString());

    this.selectedAnswerContainerTargets.forEach((input, index) => index === selectedIndex ? input.classList.add(this.activeClass) : input.classList.remove(this.activeClass));
    this.selectedAnswerIconTargets.forEach((input, index) => index === selectedIndex ? input.classList.add(this.activeClass) : input.classList.remove(this.activeClass));
  }
}

