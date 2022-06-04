import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", 'list' ]

  connect() {
    console.log(this.formTarget);
    console.log(this.listTarget);
  }
  update(e) {
    e.preventDefault();
    const category = e.target;
    category.classList.toggle('button-gold-clicked');
    const url = `${this.formTarget.action}?query=${category.innerHTML}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
    this.listTarget.scrollIntoView();
  }
}
