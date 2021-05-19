import "./index.scss";

import {Controller as BaseController} from "stimulus";

export class Controller extends BaseController {
  static targets = ["placeholder", "imagePreview", "imageInput"];

  connect() {
    // ...
  }

  imageChange(event) {
    const file = event.target.files[0];
    if (!file?.type.match("image/*")) {
      return;
    }

    const reader = new FileReader();
    reader.onload = async () => {
      const preview = reader.result;

      this.placeholderTarget.style.display = "none";
      this.imagePreviewTarget.style['background-image'] = `url("${preview}")`;
      this.imagePreviewTarget.style['display'] = "block";
    };

    reader.onerror = (error) => {
      console.error(error);
    };
    reader.readAsDataURL(file);
  }
}
