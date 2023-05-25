import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["query", "form", "dropdown"]

  connect() {
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
    const multiplier = form.length * 35;
    const dd = document.getElementById("dropdown-select");
    dd.style.height = multiplier + "px";
    dd.classList.remove("hidden"); // show the form
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
    try {
      const response = await fetch(`/mangas?search=${query}`);
      const data = await response.json();
      this.displayResults(data);
    } catch (error) {
      console.error(error);
    }
  };

  hoverDropdown() {
    const dd = document.getElementById("dropdown-select");
    dd.classList.remove("hidden"); // show the form
  };

  hoverHide() {
    const dd = document.getElementById("dropdown-select");
    dd.classList.add("hidden"); // hide the form
};
}
