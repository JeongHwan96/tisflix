
$(document).ready(function() {

    var menu_offset = $('.topmenu').offset();

    $(window).scroll(function() {

      if ($(document).scrollTop() > menu_offset.top) {

            $('.uparrow').addClass('menu-fixed');

      }else {

            $('.uparrow').removeClass('menu-fixed');

      }

    });

});





$('.uparrow').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});




