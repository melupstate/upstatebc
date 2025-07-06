import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "button"]
  
  connect() {
    this.cards = [
      {
        title: "Card 1 Title",
        text: "This is the content for the first card. You can add anything here including links or formatted text."
      },
      {
        title: "Card 2 Title",
        text: "This is the second card. Maybe describe services, steps, or testimonials."
      },
      {
        title: "Card 3 Title",
        text: "Third card content. You can load this dynamically too if needed."
      }
    ]
  }

  show(event) {
    const index = parseInt(event.target.dataset.index)
    const card = this.cardTarget
    card.innerHTML = `
      <h5 class="card-title">${this.cards[index].title}</h5>
      <p class="card-text">${this.cards[index].text}</p>
    `

    this.buttonTargets.forEach(btn => btn.classList.remove("active"))
    event.target.classList.add("active")
  }
}
