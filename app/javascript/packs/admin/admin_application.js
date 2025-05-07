// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"
// stop conversion to SVG
// import "@fortawesome/fontawesome-free/js/all"
import "@fortawesome/fontawesome-free/css/all.css";
import $ from 'jquery'
window.jQuery = $;
window.$ = $;

require('admin-lte');

import Sortable from 'sortablejs';
window.Sortable = Sortable
import Swal from 'sweetalert2/dist/sweetalert2.js';
window.Swal = Swal
window.toastr = require("toastr");

// 添加 Cocoon 支持
import "@nathanvda/cocoon";

// scss
import "../../stylesheets/admin/admin_application"

// custom js
document.addEventListener('DOMContentLoaded', function() {
  // Cocoon 新增嵌套表單
  document.addEventListener('cocoon:after-insert', function(e) {
    // 可以在這裡添加新增表單後的回調
    console.log('新表單已添加');
  });
  
  // Cocoon 移除嵌套表單
  document.addEventListener('cocoon:after-remove', function(e) {
    // 可以在這裡添加移除表單後的回調
    console.log('表單已移除');
  });
});

Rails.start()
// Turbolinks.start()
ActiveStorage.start()
