
$(document).ready(function() {

    var menu_offset = $('.topmenu').offset();

    $(window).scroll(function() {

      if ($(document).scrollTop() > menu_offset.top) {

            $('.movieuparrow').addClass('menu-fixed');

      }else {

            $('.movieuparrow').removeClass('menu-fixed');

      }

    });

});





$('.movieuparrow').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});




