import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  connect() {
  }

  submitForm(e) {
    console.log('Submitting form')
    const input = e.currentTarget
    input.form.requestSubmit()
  }
}

  // old stimulus controller code. Working but too complex. Abandoned for tubro
  // displayResults(data) {
  //   let htmlString;
  //   let htmlString = ``;
  //   //this.resultsTarget.innerHTML = '';
  //   // clear html string

  //   data.forEach(value=> {
  //     htmlString += `<li><h3>${value.manga_title}</h3></li>`
  //   });

  //   console.log(htmlString);

  //   this.resultsTarget.insertAdjacentHTML('afterbegin', `<ul>${htmlString}</ul>`);
  //  // Loop through the array of objects and append each one to the results target

  //   const resultElement = document.createElement('div');
  //   resultElement.textContent = JSON.stringify(result);
  //   // Convert the object to JSON string

  //   this.resultsTarget.appendChild(resultElement);
  // };

  // async search_manga() {
  //   const query = this.queryTarget.value
  //   fetch(`/mangas?search=${query}`)
  //   .then(response => response.json())
  //   .then(data => {
  //     this.displayResults(data)
  //   })
  //   .catch(error => {
  //     console.error(error);
  //   });
  //  }
