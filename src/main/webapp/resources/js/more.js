$(".more1").on("click",function(){
    $('.contentsofbook2').toggleClass("show");
    $('.more1').toggleClass("hide");
    $('.close1').toggleClass("show")
})

$(".close1").on("click",function(){
    $('.contentsofbook2').toggleClass("show");
    $('.more1').toggleClass("hide");
    $('.close1').toggleClass("show")
})






$(".more2").on("click",function(){
    $('.category2').toggleClass("show");
    $('.more2').toggleClass("hide");
    $('.close2').toggleClass("show")
})

$(".close2").on("click",function(){
    $('.category2').toggleClass("show");
    $('.more2').toggleClass("hide");
    $('.close2').toggleClass("show")
})




// document.addEventListener('DOMContentLoaded', function(){
//     document.querySelector('.more').addEventListener('click',function(e){
//         let classList = document.querySelector('.contentsofbook2').classList;
//         let close = document.querySelector('.close').classList;
//         let mo = document.querySelector('.more').classList;
//         let contentheight = document.querySelector('.contentsofbook2').offsetHeight;
        
//         if(contentheight >100){
//             classList.add('depth2');
//             mo.add('hide');
//             mo.remove('show');
//             close.add('show');
//         }
        
      
//     })
// })



// document.addEventListener('DOMContentLoaded', function(){
//     document.querySelector('.close').addEventListener('click',function(e){
//         let classList = document.querySelector('.contentsofbook2').classList;
//         let close = document.querySelector('.close').classList;
//         let mo = document.querySelector('.more').classList;
//         let contentheight = document.querySelector('.contentsofbook2').offsetHeight;
        
//         if(contentheight >100){
//             classList.remove('depth2');
//             mo.add('show');
//             close.remove('show');
//             close.add('hide');
//         }
        
      
//     })
// })


// document.querySelector('.more').addEventListener('click',function(e){
//     e.target.classList.add('hide');
//     document.querySelector('.close').classList.add('show');
    
// });

// document.querySelector('.close').addEventListener('click',function(e){
//     e.target.classList.add('hide');
//     e.target.classList.remove('show');
    
//     document.querySelector('more').classList.add('show');
//     document.querySelector('.contentsofbook2').classList.remove('depth1');
// });