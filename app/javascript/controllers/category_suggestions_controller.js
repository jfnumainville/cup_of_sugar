import { Controller } from "@hotwired/stimulus"


export default class extends Controller {

  connect() {
    console.log("Listening for item names and returning categories suggestions")
  }

  retrieve(e) {
    console.log(e)

    if (e.key.length >= 5){

      console.log(e.key)
    }
  }
}
