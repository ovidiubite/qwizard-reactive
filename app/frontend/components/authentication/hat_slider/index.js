import "./index.scss";
import Carousel from "stimulus-carousel"

export class Controller extends Carousel {
  static targets = ["hat"];

  next() {
    this.hatTarget.value = this.swiper.activeIndex + 1;
  }

  previous() {
    this.hatTarget.value = this.swiper.activeIndex - 1;
  }
}
