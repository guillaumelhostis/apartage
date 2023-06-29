import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="junior-dashboard"
export default class extends Controller {
  static targets = ["map"]
  connect() {
    console.log("hello from pages stimulus controller")
  }

search() {
  this.mapTarget.classList.remove('d-none')
}
}
