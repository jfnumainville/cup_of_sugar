import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["name", "text", "section", "dropdown"]

  connect() {
    //console.log("Listening for item names and returning categories suggestions")
    //console.log(this.dropdownTarget)
  }

  retrieve(e) {
     if (this.nameTarget.value.length >= 4){
        let url = `http://www.cupofsugar.org/categories/?query=${this.nameTarget.value}`

      fetch(url)
      .then( response => response.json())
      .then( data => {
        //This condition checks that the categories API is returning a value, if so it will display text and select that value in the category dropdown.
        if(data.length > 0 ){
          const categories = []
          for (let i = 0; i < data.length; i++) {
            categories.push(data[i].name)
          }
          this.#insertCategories(categories)
        }
        else{
          this.sectionTarget.classList.add("d-none");
          const dropdown = document.getElementById("item_category")
          this.dropdownTarget.selectedIndex = 0
          }
      }
      )

    }
  }

  #insertCategories(categories) {
    this.textTarget.innerText = `Suggested category: ${categories[0]}`
    this.sectionTarget.classList.remove("d-none")
    this.dropdownTarget.value = categories[0]
  }

}
