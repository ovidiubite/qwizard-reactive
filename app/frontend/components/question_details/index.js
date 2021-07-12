import "./index.scss";

import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  reset() {
    this.element.src = '';
  }
}

