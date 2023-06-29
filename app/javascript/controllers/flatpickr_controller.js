import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {

  static targets = [ "checkin" ]

  connect() {
    console.log("flatpickr")
    console.log(this.checkinTarget)
    flatpickr(this.checkinTarget, {})
  }
}
