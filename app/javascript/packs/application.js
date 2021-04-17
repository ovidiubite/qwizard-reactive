// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'
import controller from '../controllers/application_controller'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
StimulusReflex.initialize(application, { consumer, controller, isolate: true })
StimulusReflex.debug = process.env.RAILS_ENV === 'development'

import "controllers"
