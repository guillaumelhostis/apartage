import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="junior-dashboard"
export default class extends Controller {
  static targets = ["map"]
  connect() {
    console.log("junior dashboard stimulus controller")
    const currentUrl = window.location.href;
    const referrerUrl = document.referrer;
    if (referrerUrl !== currentUrl) {
      window.location.reload(true);
    }
  }

  search() {
    this.mapTarget.classList.remove('d-none')
  }
}
