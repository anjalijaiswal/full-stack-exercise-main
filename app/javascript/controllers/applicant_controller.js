// applicant_controller.js
import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="applicants"
export default class extends Controller {
  static targets = ["selectField"];
  static values = {
    original: String,
  };
  connect() {
    console.log('connected')
    this.showStatusHistory();
  }

  showStatusHistory() {
    let divElement = document.getElementById("status-history");
    let inputElement = document.getElementById("status-history-comment");

    if (this.originalValue == this.selectFieldTarget.value) {
      divElement.style.display = "none";
      inputElement.required = false;
    } else {
      divElement.style.display = "block";
      inputElement.required = true;
    }
  }
}