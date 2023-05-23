import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["query", "form", "dropdown"]

  connect() {
   console.log("yooooooooo")
  }
  // submitForm(event) {
  //   event.preventDefault();
  //   console.log('Submitting form');
  //   this.formTarget.submit();
  // }
  displayResults(data) {
    const form = this.dropdownTarget;
    const fullForm = this.formTarget;
    form.innerHTML = ``;
    data.forEach(option => {
      const optionElement = document.createElement('option');
      optionElement.value = option.manga_title;
      optionElement.text = option.manga_title;
      form.appendChild(optionElement);
    });
    form.size = form.length;
    const multiplier = form.length * 23;
    const dd = document.getElementById("dropdown-select");
    dd.style.height = multiplier + "px";
    console.log(dd);
    Array.from(dd).forEach(option => {
      console.log("Value: " + option.value + ", Text: " + option.text);
      option.addEventListener("click", (e) => {
        console.log(e.target.innerHTML)
        // fullForm.querySelector("input[name='myInput']").value = e.target.innerHTML;
        console.log(fullForm)
        fullForm.submit();
      })
    });
    // dd.forEach(value => {
    //   console.log(value)
    // })
    // this.formTarget.submit();
  };
  async searchManga() {
    const query = this.queryTarget.value;
    console.log(query);
    try {
      const response = await fetch(`/mangas?search=${query}`);
      const data = await response.json();
      this.displayResults(data);
      // this.openForm();
    } catch (error) {
      console.error(error);
    }
  };
}
