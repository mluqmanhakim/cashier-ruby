import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pos"
export default class extends Controller {
  static targets = [ "quantity", "total" ]

  connect() {
    this.calculateTotal()
  }

  calculateTotal() {
    let total = 0
    this.quantityTargets.forEach((target) => {
      const quantity = parseInt(target.value) || 0
      const price = parseFloat(target.dataset.price) || 0
      total += quantity * price
    })

    this.totalTarget.textContent = new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD'
    }).format(total)
  }
}
