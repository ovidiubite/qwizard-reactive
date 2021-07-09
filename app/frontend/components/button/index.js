import "./index.scss";
import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  static targets = ['button'];

  connect () {
    const isDisabled = this.data.get('disabled');

    if(isDisabled === 'true') {
      this.buttonTarget.setAttribute('disabled',  isDisabled);
    } else {
      this.buttonTarget.removeAttribute('disabled');
    }
  }
}
