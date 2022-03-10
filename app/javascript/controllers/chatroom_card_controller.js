import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["chatroom", "circle_chatroom", "notif"]

  revealChatroom() {
    // console.log(this.chatroomTarget)
    // console.log(`ici`)
    // console.log(this.chatroomTarget.classList)
    console.log(this.circle_chatroomTarget)
    this.chatroomTarget.classList.remove("d-none")
    this.circle_chatroomTarget.classList.add("d-none")
    this.notifTarget.classList.add("d-none");
  }


  hideChatroom(){
    console.log(this.chatroomTarget)
    this.chatroomTarget.classList.add("d-none")
    this.circle_chatroomTarget.classList.remove("d-none")

  }
}
