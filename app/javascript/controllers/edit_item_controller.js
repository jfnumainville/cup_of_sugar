import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "infos", "form" ]

  connect() {
    this.outputTarget.textContent = 'Hello, Stimulus!'

  }
}
