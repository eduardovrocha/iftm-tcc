// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("flatpickr/dist/flatpickr.css")
require("channels")

import "flatpickr"

import '../stylesheets/application.scss'

// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import {Application} from "stimulus"
import {definitionsFromContext} from "stimulus/webpack-helpers"

const application = Application.start()
// const context_admin = require.context("controllers/admin", true, /.js$/)
// application.load(definitionsFromContext(context_admin))

document.addEventListener("turbolinks:load", () => {

    flatpickr("[data-behavior='flatpickr']", {
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
    })

})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
