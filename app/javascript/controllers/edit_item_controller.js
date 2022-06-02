import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'infos', 'form', 'card' ];

  displayForm() {
    console.log("displaying")
    this.infosTarget.classList.add("d-none");
    this.formTarget.classList.remove("d-none");
  }

  update(event) {
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
      //  this.cardTarget.outerHTML = data
      })
  }
}
