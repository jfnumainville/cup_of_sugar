import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    new Typed(this.element, {
        strings: ['<h1 class = "display-landing">Why <strong><i>BUY</i> or <i>RENT</i></strong><br> when you can <strong><i>BORROW</i></strong>&nbsp; from your neighbours?</h1>'],
        typeSpeed: 70,
        backSpeed: 90,
        loop: true,
        loopCount: 2,
        showCursor: false
    });
  }
}
