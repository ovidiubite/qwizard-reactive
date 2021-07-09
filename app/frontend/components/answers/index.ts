import "./index.scss";

import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  static targets = ["answer", "selectedAnswers", "answerContainer"];
  static classes = ["active", "disabled"];

  declare readonly answerTargets: HTMLInputElement[]
  declare readonly selectedAnswersTarget: HTMLInputElement
  declare readonly selectedAnswerTargets: HTMLInputElement[]
  declare readonly answerContainerTargets: Element[]

  declare readonly activeClass: string
  declare readonly disabledClass: string

  connect() {}

  selectAnswer(event) {
    // the answer has 3 divs, and when you click you can't be sure that you click on the one that has the target on it
    // that's why we search for the div with the target (box-half)
    const containerDiv = event.target.closest('div.box-half');

    if(containerDiv.classList.contains(this.disabledClass)) {
      return;
    }

    const selectedIndex = this.answerTargets.indexOf(containerDiv);

    this.answerTargets.forEach((input, index) => {
      index === selectedIndex ? this.selectedAnswersTarget.value = input.dataset.answersAnswer : ''
    });

    this.answerContainerTargets.forEach((input, index) => {
      index === selectedIndex ? input.classList.add(this.activeClass) : input.classList.remove(this.activeClass)
    })
  }
}
