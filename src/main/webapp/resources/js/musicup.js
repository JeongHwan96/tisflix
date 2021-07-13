
$(document).ready(function() {

    var menu_offset = $('.topmenu').offset();

    $(window).scroll(function() {

      if ($(document).scrollTop() > menu_offset.top) {

            $('.musicuparrow').addClass('menu-fixed');

      }else {

            $('.musicuparrow').removeClass('menu-fixed');

      }

    });

});





$('.musicuparrow').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});




