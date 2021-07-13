
let fp = null;
function loadJSON(url){
    $.ajax(url)
    .done(function(res){
        //console.log(res.clock[1].title);
        $("#main").html("");
        let clock = res.clock;
        $.each(clock,function(i,item){
            //console.log(i,"===",item);
            $("#main").append(
                `
                <div class="section" id="clock01" style="background-image:url(${item.bg})">
                    <div class="info">
                        <p class="category" data-splitting>${item.category}</p>
                        <p class="title" data-splitting>
                            ${item.title}
                        </p>
                        <p class="depth" data-splitting>
                            ${item.depth} MM
                        </p>
                        <p class="price" data-splitting>
                            CHF ${item.price}
                        </p>
                    </div>
                </div>
                `
            );
        });
        if(fp!==null){
            fullpage_api.destroy("all");
        }
        fp  = new fullpage("#main",{
            scrollBar:true,
            onLeave:function(original,destination,index){
                //console.log(destination);
                moveChar(`.section:nth-child(${destination.index+1}) .char`);
            }
        });
        Splitting();
        moveChar(`.section:nth-child(1) .char`);
    });
}
$("#gnb li").on("click",function(){
    if(!$(this).hasClass("on")){
        let _url = $(this).data("url")+".json";
        loadJSON(_url);
        $(this).addClass("on");
        $(this).siblings().removeClass("on");
        
    }
    return false;
});
function moveChar(char){
    gsap.from(char,{
        y:-200,
        opacity:0,
        ease:"bounce",
        duration:1.5,
        delay:0.5,
        stagger:{
            amount:1,
            from:"random"
        }
    });
}
loadJSON("bigbang.json");

// let height = 180;
// let weight = 90;
// let name = "장성호";

// let kim01height = 175;
// let kim01weight = 75;
// let kim01name = "김명집";

// let kim02height = 160;
// let kim02weight = 50;
// let kim02name = "김주희";

// let jang = {
//     name:"장성호",
//     weight:90,
//     height:180
// }
// let myoungzip = {
//     name:"김명집",
//     weight:70,
//     height:175
// }
// let juhee = {
//     name:"김주희",
//     weight:50,
//     height:162
// }
// let myClass = [
//     {
//         name:"장성호",
//         weight:90,
//         height:180
//     },
//     {
//         name:"김명집",
//         weight:70,
//         height:175
//     },
//     {
//         name:"김주희",
//         weight:50,
//         height:162
//     }

// ];
// console.log(myClass[0].name);







//let fruits = ["바나나","딸기"]


