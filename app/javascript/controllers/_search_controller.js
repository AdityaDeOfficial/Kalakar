import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="-search"
export default class extends Controller {
  static targets = [ "query", "results" ]

  connect() {
    console.log('Hello Mum')
    //console.log("results", this.resultsTarget)
  }

  submit(event) {
    // TODO intercept form & send AJAX request i.e fetch not GET
    // TODO create auto suggestions popup
}
}
