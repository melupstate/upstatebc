import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home-pages"
export default class extends Controller {
  static targets = ["image", "text"]

  connect() {
    this.handleScroll = this.handleScroll.bind(this)
    window.addEventListener("scroll", this.handleScroll)
  }

  disconnect() {
    window.removeEventListener("scroll", this.handleScroll)
  }

  handleScroll() {
    const scrollY = window.scrollY
    const maxScroll = 400

    // Image fade
    const opacity = Math.max(1 - scrollY / maxScroll, 0)
    this.imageTarget.style.opacity = opacity

    // Text color transition
    const colorValue = Math.min(Math.round((scrollY / maxScroll) * 255), 255)
    this.textTarget.style.color = `rgb(${colorValue}, ${colorValue}, ${colorValue})`
  }
}