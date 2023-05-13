import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "query", "results" ]

  connect() {
    this.resultsTarget.classList.add("hidden")
  }

  async search_manga() {
    const query = this.queryTarget.value
    fetch(`/mangas?search=${query}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    } )
    .then(response => response.json())
    .then(data => console.log(data))
    console.log(query)
  }

  submit_manga(event) {
    event.preventDefault()
    console.log("working")
    const query = this.queryTarget.value
    fetch(`/mangas?search=${query}`)
      .then(response => response.text())
      .then(html => this.resultsTarget.innerHTML = html)
  }

  //TODO popup below search bar
  // populates suggestions as type
  //remove search button
}
