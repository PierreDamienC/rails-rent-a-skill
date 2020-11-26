// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// import AOS for animated cards on the homepage
require("../plugins/init_flip_card")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import flatpickr from "flatpickr";

// Internal imports, e.g:
import { WhiteNavbar } from './components/navbar'
import { dynamicRating } from './components/fillstars'
import { buttonReviewFunction } from './components/hide_review'
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete'

// import flatpickr, which is a module for chosing a date in a calendar


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  WhiteNavbar();
  flatpickr(".datepicker", {});
  dynamicRating();
  buttonReviewFunction();
  initMapbox();
  initSelect2();
  initAutocomplete();
});
