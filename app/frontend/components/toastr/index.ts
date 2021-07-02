import {Controller as BaseController} from "stimulus";
const toastr = require("toastr/toastr")

export class Controller extends BaseController {
  connect() {
    const type = this.data.get('type');
    const message = this.data.get('message');

    toastr[type](message);
  }
}
