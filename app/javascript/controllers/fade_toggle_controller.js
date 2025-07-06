import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fade-toggle"
export default class extends Controller {
static targets = ["section"]

  connect() {
    console.log("testing fade-toggle")
    this.observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          this.sectionTarget.classList.add("opacity-100")
          this.sectionTarget.classList.remove("opacity-0")
        } else {
          this.sectionTarget.classList.remove("opacity-100")
          this.sectionTarget.classList.add("opacity-0")
        }
      })
    }, { threshold: 0.3 })

    this.observer.observe(this.sectionTarget)
  }

  disconnect() {
    if (this.observer) {
      this.observer.disconnect()
    }
  }
}