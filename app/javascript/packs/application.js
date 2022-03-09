// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { initFlatpickr } from "../plugins/flatpickr";
import { navbarEffectOnScroll } from "../components/navbar_effect";


Rails.start()
Turbolinks.start()
ActiveStorage.start()


document.addEventListener('turbolinks:load', () => {
  initFlatpickr();
  navbarEffectOnScroll();
});

import "controllers"
import "bootstrap"


//= require Chart.bundle
//= require chartkick

//= require_tree
//= require jquery
//= require chartkick
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

require("chartkick")
require("chart.js")
