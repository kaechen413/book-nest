import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// for cloudinary
import "bootstrap"
import "@popperjs/core"

export { application }
