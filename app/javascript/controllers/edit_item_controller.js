import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'infos', 'form', 'card' ];

  displayForm() {
    this.infosTarget.classList.add("d-none");
    this.formTarget.classList.remove("d-none");
  }

  update(event) {
    console.log("something new")
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/html" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.cardTarget.outerHTML = data
        // TODO: notification popup
      })
    this.infosTarget.classList.remove("d-none");
    this.formTarget.classList.add("d-none");
  }
}
