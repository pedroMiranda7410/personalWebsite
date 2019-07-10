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
