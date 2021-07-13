$(document).ready(function(){
	$('button.is-paused').click(function(){
		$('#slideTogglebox').slideToggle();
	})
});

$('#Toggle button').on('click', function() {
  $(this)
    .removeClass('is-paused')
    .toggleClass('is-active');
});