
$(document).ready(function() {

    var menu_offset = $('.HeaderMenuBar').offset();

    $(window).scroll(function() {

      if ($(document).scrollTop() > menu_offset.top) {

            $('.mainuparrow').addClass('fixed');

      }else {

            $('.mainuparrow').removeClass('fixed');

      }

    });

});





$('.mainuparrow').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});


