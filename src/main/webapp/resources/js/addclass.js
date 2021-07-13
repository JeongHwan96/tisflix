

$(document).ready(function() {

       var menu_offset = $('.HeaderMenuBar').offset();

       $(window).scroll(function() {

         if ($(document).scrollTop() > menu_offset.top) {

               $('.HeaderMenuBar').addClass('menu-fixed');

         }else {

               $('.HeaderMenuBar').removeClass('menu-fixed');

         }

       });

 });




 $(document).ready(function(){

      $(".all").click(function(){

            var offset = $('.all').offset();

            $('.sideslide').toggleClass('show');
            


      }) ;

});


 $(document).ready(function(){

      $(".more").click(function(){

            var offset = $('.more').offset();

            $('.more').addClass('hide');
            $('.close').addClass('show');


      }) ;

});


$(document).ready(function(){

      $(".close").click(function(){

            var offset = $('.close').offset();

            $('.close').addClass('hide');
            $('.hide').addClass('show');


      }) ;

});

