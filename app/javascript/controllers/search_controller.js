import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "query", "results" ]

  submit(event) {
    event.preventDefault()
    const query = this.queryTarget.value
    fetch(`/mangas?search=${query}`)
      .then(response => response.text())
      .then(html => this.resultsTarget.innerHTML = html)
  }
}
