// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"
import "@fortawesome/fontawesome-free/css/all.css"
import $ from 'jquery'
window.jQuery = $;
window.$ = $;

import Swal from 'sweetalert2/dist/sweetalert2.js';
window.Swal = Swal
window.toastr = require("toastr");

// scss
import "../stylesheets/application"

// Import images
import "../image/home/intro-bg.jpg"
import "../image/home/menu-bg.jpg"
import "../image/home/admin-bg.jpg"

// custom js
import "./main"

Rails.start()
// Turbolinks.start()
ActiveStorage.start()
