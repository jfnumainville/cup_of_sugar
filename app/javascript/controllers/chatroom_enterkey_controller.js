import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("Listening to enter key in chat input form")
  }


  submit(e){
      if (e.key === "Enter"){
          console.log ("This is working");
        e.preventDefault()
        this.formTarget.submit()
      }
  }
}
