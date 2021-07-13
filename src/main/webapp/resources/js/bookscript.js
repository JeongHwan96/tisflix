const content = "멋진 책를 추천해주세요"
const text = document.querySelector(".BooktypingContents") 
let index = 0;

function typing (){
    text.textContent += content[index++];
    
    if(index > content.length) {
        
        text.textContent = "멋진 책를 추천해주세요";
        index = 12;
        
    }
    
}

 setInterval(typing,200);	
