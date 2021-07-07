import "./index.scss";
import Carousel from "stimulus-carousel"

export class Controller extends Carousel {
  static targets = ["hat"];
  static values = { hats: Object }

  connect() {
    super.connect();

    if (this.hatTarget.value) {
      this.swiper.activeIndex = Object.keys(this.hatsValue)
        .find(key => this.hatsValue[key] === this.hatTarget.value);
    } else {
      this.hatTarget.value = this.hatsValue[0]
    }
  }

  next() {
    this.hatTarget.value = this.hatsValue[this.swiper.activeIndex + 1];
  }

  previous() {
    this.hatTarget.value = this.hatsValue[this.swiper.activeIndex - 1];
  }
}
