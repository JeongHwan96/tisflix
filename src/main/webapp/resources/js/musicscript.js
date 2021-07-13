const content = "멋진 음악를 추천해주세요"
const text = document.querySelector(".MusictypingContents") 
let index = 0;

function typing (){
    text.textContent += content[index++];
    
    if(index > content.length) {
        
        text.textContent = "멋진 음악를 추천해주세요";
        index = 13;
        
    }
    
}

 setInterval(typing,200);	
