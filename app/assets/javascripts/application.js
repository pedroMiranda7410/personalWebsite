// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require bootstrap.bundle.min.js
//= require bootstrap.min.js
//= require_tree .
//= require_self
//= require Chart.js


jQuery.noConflict();


// MY JAVASCRIPT
var value=959;

if($(window).width() < value)
{
  $("#div-image").removeClass("col-md-4").addClass("col-md-12");
  $("#div-imageText").removeClass("col-md-8").addClass("col-md-12");
}

// END MY JS


$(document).ready(function() {
        // Transition effect for navbar
        $(window).scroll(function() {
          // checks if window is scrolled more than 500px, adds/removes solid class
          if($(this).scrollTop() > 500) {
              $('.navbar').addClass('solid');
          } else {
              $('.navbar').removeClass('solid');
          }
        });
});

$(".homeSouth").click(function() {
    var offset = 60;
    if($(window).width() < 992) {
        offset = 54;
    }
    $('html,body').animate({
        scrollTop: $(".aboutMe").offset().top - offset},'slow');
});


/*jQuery(document).ready(function($) {
  $(window).scroll(function() {
        var scrollTop = 0;
        scrollTop = $(window).scrollTop();

    if (scrollTop > 180) {
      navbar.addClass('alt-color');
    } else {
      navbar.removeClass('alt-color');
    }
  });
});

$(document).ready(function(){
    $("button").click(function(){
        $("p").slideToggle();
    });
});
*/
//
// $(window).resize(navScroll);
// $(document).ready(navScroll);
// $(window).scroll(navScroll);
// $(window).resize(navScroll_contact);
// $(document).ready(navScroll_contact);
// $(window).scroll(navScroll_contact);
// var toggle = 0;
//
// var url = window.location.pathname;
// var filename = (url.substring(0, url.lastIndexOf('/')));
// filename = filename.substring(filename.lastIndexOf('/') + 1);
//
// function navScroll(){
//     if($(window).width() >= 992) {
//         var scrollTop = 0;
//           scrollTop = $(window).scrollTop();
//            $('.counter').html(scrollTop);
//
//           if (scrollTop >= 100) {
//               $('#global-nav').css({
//                   "padding":"0px",
//
//
//               })
//               $(".scrollN").css({
//                   "color":"#101010",
//                   "padding-bottom":"0px",
//                   "padding-top":"0px"
//               })
//             $('#global-nav').addClass('scrolled-nav');
//             $('#global-nav').removeClass('x-navbar');
//
//         } else if (scrollTop < 100) {
//             $(".scrollN").css({
//                 "padding-bottom":"10px",
//                 "padding-top":"10px",
//                 "color":"white"
//             })
//             /*
//             if(!(filename === 'timelapse-auto-ramp') && !(filename === 'pathfinding')
//                 && !(filename === 'air-conditioner-DIY') && !(filename === 'contact') && !(filename === 'yt-desc')
//                 && !(filename === 'software') && !(filename === 'electronics')
//                 && !(filename === 'films') && !(filename === 'photography')) {
//                 $(".scrollN").css({
//                     "color":"white"
//                 })
//             }*/
//             $('#global-nav').addClass('x-navbar');
//             $('#global-nav').removeClass('scrolled-nav');
//           }
//     }
//     else {
//         $(".scrollN").css({
//             "color":"#101010",
//             "padding-bottom":"10px",
//             "padding-top":"10px"
//         })
//         $('#global-nav').css({
//             "padding":"21px",
//             "padding-top":"8px",
//             "padding-bottom":"8px",
//             "background-color":"white"
//         })
//         $('#global-nav').addClass('scrolled-nav');
//         $('#global-nav').removeClass('x-navbar');
//     }
// }
//
// $(".navbar-toggler").click(function() {
//     toggle++;
//     if(toggle % 2 == 1) {
//         console.log("ACTIVE TOGGLE");
//         $('#global-nav').removeClass('toggle-height');
//     }
//     else {
//         $('#global-nav').addClass('toggle-height');
//     }
// });
//
// function navScroll_contact(){
//     if($(window).width() >= 992) {
//         var scrollTop = 0;
//           scrollTop = $(window).scrollTop();
//            $('.counter').html(scrollTop);
//
//           if (scrollTop >= 50) {
//               $('#contact-nav').css({
//                   "padding":"0px",
//
//
//               })
//               $(".scrollN_contact").css({
//                   "color":"black",
//                   "padding-bottom":"0px",
//                   "padding-top":"0px"
//               })
//             $('#contact-nav').addClass('scrolled-nav');
//             $('#contact-nav').removeClass('x-navbar');
//
//         } else if (scrollTop < 100) {
//             $(".scrollN_contact").css({
//                 "padding-bottom":"3px",
//                 "padding-top":"3px",
//                 "color":"black"
//             })
//             /*
//             if(!(filename === 'timelapse-auto-ramp') && !(filename === 'pathfinding')
//                 && !(filename === 'air-conditioner-DIY') && !(filename === 'contact') && !(filename === 'yt-desc')
//                 && !(filename === 'software') && !(filename === 'electronics')
//                 && !(filename === 'films') && !(filename === 'photography')) {
//                 $(".scrollN").css({
//                     "color":"white"
//                 })
//             }*/
//             $('#contact-nav').addClass('x-navbar');
//             $('#contact-nav').removeClass('scrolled-nav');
//           }
//     }
//     else {
//         $(".scrollN_contact").css({
//             "color":"#101010",
//             "padding-bottom":"10px",
//             "padding-top":"10px"
//         })
//         $('#contact-nav').css({
//             "padding":"21px",
//             "padding-top":"8px",
//             "padding-bottom":"8px",
//             "background-color":"white"
//         })
//         $('#contact-nav').addClass('scrolled-nav');
//         $('#contact-nav').removeClass('x-navbar');
//     }
// }


$(document).ready(textShift);
$(window).resize(textShift);

var pathToggle = 0;
var psdToggle = 0;

$(".homeSouth").click(function() {
    var offset = 60;
    if($(window).width() < 992) {
        offset = 54;
    }
    $('html,body').animate({
        scrollTop: $(".container-fluid.aboutMe").offset().top - offset},'slow');
});
