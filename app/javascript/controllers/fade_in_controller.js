import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"]

  connect() {
    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add("opacity-100")
          entry.target.classList.remove("opacity-0")
          observer.unobserve(entry.target)
        }
      })
    }, {
      threshold: 0.1
    })

    this.cardTargets.forEach(el => observer.observe(el.querySelector('.card')))
  }
}
