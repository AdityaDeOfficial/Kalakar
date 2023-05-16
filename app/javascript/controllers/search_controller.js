import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "query", "results" ]

  connect() {
    this.resultsTarget.classList.add("hidden")
  }

  async search_manga() {
    const query = this.queryTarget.value
    fetch(`/mangas?search=${query}`)
    .then(response => response.json())
    .then(data => {
      this.resultsTarget.innerHTML = data.map(manga => `
        <li>${manga.title}</li>
      `).join("")
      this.resultsTarget.classList.remove("hidden")
    })
    .catch(error => {
      // Handle any errors
      console.error(error);
    });
  }
}

  // TODO

  // grab the object
  // inject in html
  // AJAX stuff happens from here

  // submit_manga(event) {
  //   event.preventDefault()
  //   console.log("working")
  //   const query = this.queryTarget.value
  //   fetch(`/mangas?search=${query}`)
  //     .then(response => response.text())
  //     .then(html => this.resultsTarget.innerHTML = html)
  // }

  // TODO resolve JSON not parsing issue. Revisit Tuesday
  // TODO auto suggested, popdown search
  // TODO remove button
}
