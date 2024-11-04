import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { timeout: Number };

  connect() {
    this.resetTimer();
    this.setListeners();
  }

  setListeners() {
    this.resetTimer = this.resetTimer.bind(this);
    window.addEventListener("mousemove", this.resetTimer);
    window.addEventListener("keypress", this.resetTimer);
  }

  resetTimer() {
    clearTimeout(this.timer);
    this.timer = setTimeout(() => this.logout(), this.timeoutValue);
  }

  logout() {
    fetch("/logout", { method: "DELETE" })
      .then(response => {
        if (response.ok) window.location.href = "/";
      })
      .catch(error => console.error("Logout failed:", error));
  }

  disconnect() {
    clearTimeout(this.timer);
    window.removeEventListener("mousemove", this.resetTimer);
    window.removeEventListener("keypress", this.resetTimer);
  }
}