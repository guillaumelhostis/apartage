import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quizz-wizzard"
export default class extends Controller {
  static targets = ["previous"]
  connect() {
    console.log("Connected to Quizz Wizzard Controller")

  }


  next() {
    this.previousTarget.classList.remove('d-none')
    let current = document.querySelector('.active')
    let nextSibling = current.nextElementSibling
    current.classList.remove('active')
    current.classList.add('d-none')
    nextSibling.classList.remove('d-none')
    nextSibling.classList.add('active')
    console.log(nextSibling)
  }

  previous() {

    let current = document.querySelector('.active')
    let previousSibling = current.previousElementSibling
    current.classList.remove('active')
    current.classList.add('d-none')
    previousSibling.classList.remove('d-none')
    previousSibling.classList.add('active')
    console.log(previousSibling)
  }

}
