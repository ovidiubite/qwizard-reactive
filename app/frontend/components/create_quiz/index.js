import "./index.scss";

import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  static targets = ["answer", "selectedAnswer", "selectedAnswerContainer", "selectedAnswerIcon"];
  static classes = ["active"]

  connect() {
    // ...
  }

  selectAnswer(event) {
    const selectedIndex = this.answerTargets.findIndex(e => e === event.target);
    this.selectedAnswerTargets.forEach((input, index) => input.value = index === selectedIndex);

//    const className = "<%= class_for('active') %>";

    this.selectedAnswerContainerTargets.forEach((input, index) => index === selectedIndex ? input.classList.add(this.activeClass) : input.classList.remove(this.activeClass));
    this.selectedAnswerIconTargets.forEach((input, index) => index === selectedIndex ? input.classList.add(this.activeClass) : input.classList.remove(this.activeClass));
  }
}

