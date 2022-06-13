import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", 'list' ]

  // connect() {
  //   console.log(this.formTarget);
  //   console.log(this.listTarget);
  // }
  update(e) {
    e.preventDefault();
    const category = e.target;
    const categories = category.parentElement.children;
    // looping through categories to ensure that only one category can be selected at a given time
    Object.keys(categories).forEach(function (key){
      if (categories[key].classList.contains('button-categories-gold-clicked')) {
        categories[key].classList.remove('button-categories-gold-clicked');
      }
    })
    // adding toggle to select & remove selection
    category.classList.toggle('button-categories-gold-clicked');
    // fetching url through catgory name and outputting index
    const url = `${this.formTarget.action}?query=${category.innerHTML}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
    // scrolling down to see results when category is selected
    this.listTarget.scrollIntoView();
  }
}
