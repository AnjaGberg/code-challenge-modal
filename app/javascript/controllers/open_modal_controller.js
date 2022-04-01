import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    console.log("open-modal controller connected");
  }

  show(event){
    console.log(event.currentTarget);
  }
}
