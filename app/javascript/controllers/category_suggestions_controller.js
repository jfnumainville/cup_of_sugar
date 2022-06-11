import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["name", "buttons"]

  connect() {
    console.log("Listening for item names and returning categories suggestions")
  }

  retrieve(e) {
     if (this.nameTarget.value.length >= 4){
       let url = `http://localhost:3000/categories/?query=${this.nameTarget.value}`

      fetch(url)
      .then( response => response.json())
      .then( data => {
        const categories = []
        for (let i = 0; i < data.length; i++) {
          categories.push(data[i].name)
        }
        console.log(categories)
        this.#insertCategories(categories)
      })

    }
  }

  #insertCategories(categories) {
    this.buttonsTarget.innerText = `${categories[0]}`
  }

}
