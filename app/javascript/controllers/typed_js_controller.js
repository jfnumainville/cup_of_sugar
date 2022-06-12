import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    new Typed(this.element, {
        strings: ['Why <strong><i>BUY</i> or <i>RENT</i></strong> when you can <strong><i>BORROW</i></strong>&nbsp; from your neighbours?'],
        typeSpeed: 70,
        backSpeed: 90,
        loop: true,
        loopCount: Infinity,
        showCursor: false
    });
  }
}
