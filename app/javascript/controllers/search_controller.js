import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "query", "results" ]

  connect() {
    this.resultsTarget.classList.add("hidden")
  }

  displayResults(data_name) {
    debugger
    // clear previous results
    this.resultsTarget.innerHTML = '';
    this.resultsTarget.insertAdjacentHTML('afterbegin', `<h3>${data_name}</h3`)
   // Loop through the array of objects and append each one to the results target

    const resultElement = document.createElement('div');
    resultElement.textContent = JSON.stringify(result); // Convert the object to JSON string

    this.resultsTarget.appendChild(resultElement);
  };

  async search_manga() {
    const query = this.queryTarget.value
    fetch(`/mangas?search=${query}`)
    .then(response => response.json())
    .then(data => {
      data.forEach(object => {
        //console.log(object.manga_title);
        this.displayResults(object.manga_title)
      });
    })
    .catch(error => {
      // Handle any errors
      console.error(error);
    });
  }
}


  // TODO

  // grab the object, inject in html - if auto suggest works then..
  // ..AJAX popup in the search bar
