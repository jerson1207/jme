import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quote-modal"
export default class extends Controller {
  open(event) {
    event.preventDefault()

    let modal = document.getElementById("quote-modal")

    if (!modal) {
      this.createModal()
    } else {
      this.showModal(modal)
    }

    // const modal = document.getElementById("quote-modal")

    // if (modal) {
    //   // If it already exists, just show it
    //   modal.classList.remove("hidden")
    //   document.body.classList.add("overflow-hidden")
    // } else {
    //   // If it doesn't exist, fetch it
    //   fetch("/home/quote_modal")
    //     .then(response => response.text())
    //     .then(html => {
    //       const container = document.createElement("div")
    //       container.id = "quote-modal"
    //       container.innerHTML = html
    //       document.body.appendChild(container)
    //       document.body.classList.add("overflow-hidden")
    //     })
    // }
  }


 
createModal() {
    const modal = document.createElement("div")
    modal.id = "quote-modal"
    modal.className = "fixed inset-0 bg-black/50 flex justify-center items-center z-50 p-6"

    // Stimulus controller + ESC key
    modal.dataset.controller = "quote-modal"
    modal.dataset.action = "keyup@window->quote-modal#closeWithEscape"

    // Turbo Frame to load Rails new action
    modal.innerHTML = `
      <turbo-frame id="quote_request_modal" src="/quote_requests/new" loading="lazy">
        <p class="text-center text-gray-400">Loading…</p>
      </turbo-frame>
    `

    document.body.appendChild(modal)
  }

  showModal(modal) {
    modal.classList.remove("hidden")
    document.body.classList.add("overflow-hidden")
  }





  close(event) {
    event.preventDefault()
    const modal = document.getElementById("quote-modal")
    
    if (modal) {
      // Instead of .remove(), we just hide it
      modal.classList.add("hidden")
      document.body.classList.remove("overflow-hidden")
    }
  }

  closeWithEscape(event) {
    if (event.key === "Escape") {
      this.close(event)
    }
  }

  remove(event) {
    event.preventDefault()
    const modal = document.getElementById("quote-modal")

    if (modal) {
      modal.remove()
    }
  }
}
