import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { tripId: Number }
  static targets = ["messages", "form"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "TripChannel", id: this.tripIdValue },
      { received: data => this.insertMessageScrollDownAndResetForm(data)}),
      console.log(`Subscribe to the chatroom with the id ${this.tripIdValue}.`)
}

insertMessageScrollDownAndResetForm(data) {
  this.messagesTarget.insertAdjacentHTML("beforeend", data)
  this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  this.formTarget.reset()
}
}
