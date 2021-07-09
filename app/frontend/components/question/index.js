import "./index.scss";

import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  static targets = ["timer"];

  connect() {
    let interval = setInterval(() => {
      let time = parseInt(this.timerTarget.innerText);

      if (time === 0) return clearInterval(interval);
      this.timerTarget.innerText -= 1;
    }, 1000);

    return () => clearInterval(interval);
  }
}
