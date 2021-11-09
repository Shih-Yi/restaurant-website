$(function () {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

// scroll animate
$(document).on('click', 'a.page-scroll', function() {
  if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
    var target = $(this.hash);
    target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
    if (target.length) {
      $('html,body').animate({
        scrollTop: target.offset().top - 55
      }, 900);
      return false;
    }
  }
});

// Show Menu on scroll
$(document.body).on('touchmove', onScroll); // for mobile
$(window).on('scroll', onScroll); // for desktop

function onScroll(){
  var navHeight = $(window).height() - 500;
  var scrollTop = Math.max(window.pageYOffset, document.documentElement.scrollTop, document.body.scrollTop)
  if (scrollTop > navHeight) {
    $('.navbar-default').addClass('on');
  } else {
    $('.navbar-default').removeClass('on');
  }
}

// Hide nav on click
$(document).on('click', '.navbar-nav li a', function (event) {
  // check if window is small enough so dropdown is created
  var toggle = $(".navbar-toggle").is(":visible");
  if (toggle) {
    $(".navbar-collapse").collapse('hide');
  }
});
