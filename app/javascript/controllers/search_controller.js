import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["query", "form", "dropdown"]

  connect() {
   console.log("yooooooooo")
  }

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
    const multiplier = form.length * 38;
    const dd = document.getElementById("dropdown-select");
    dd.style.height = multiplier + "px";
    console.log(dd);
    Array.from(dd).forEach(option => {
      option.addEventListener("click", (e) => {
        const selectedOption = e.target.innerHTML;
        const selectedManga = data.find(option => option.manga_title === selectedOption);
        if (selectedManga) {
          window.location.href = `/mangas/${selectedManga.id}`;
        }
      })
    });

  };
  async searchManga() {
    const query = this.queryTarget.value;
    console.log(query);
    try {
      const response = await fetch(`/mangas?search=${query}`);
      const data = await response.json();
      this.displayResults(data);
    } catch (error) {
      console.error(error);
    }
  };
}
