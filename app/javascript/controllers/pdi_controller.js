import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pdi"
export default class extends Controller {
  connect() {
    console.log('connect pdi')
    
  }
  populatePdiCategories(e) {
      const v_pdiid = document.getElementById("pdiid").value    
      const isChecked = e.target.checked; 
      const isChecked_value = e.target.value;
      const params = {pdiid: v_pdiid, categoryid: isChecked_value, checked: isChecked}
      fetch('/populate_category', {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
        'Content-Type': 'application/json',
        Accept: "text/vnd.turbo-stream.html",
      },
      body: JSON.stringify(params),  // Sending params directly
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
    .catch(error => console.error('Error:', error));
    }

}
