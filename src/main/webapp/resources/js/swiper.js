const mainSlider = new Swiper(".swiper-container.mainSlide", {
	effect: "slide", //효과 slide/fade/flip/cover-flow/cube
	speed: 1000, // 속도
	loop: 1, // 반복
	autoplay: {
		delay: 2000,
		disableOnInteraction: true
	},
});



const MovielistSlider = new Swiper(".swiper-container.listSlide", {
	effect: "slide", //효과 slide/fade/flip/cover-flow/cube
	speed: 1000, // 속도
	loop: 0, // 반복
	slidesPerView: 3,
	slidesPerGroup: 3,
	navigation: {
		nextEl: " .NextButton",
		prevEl: " .PrevButton",
		
	},

});

const MusiclistSlider = new Swiper(".swiper-container.MusiclistSlide", {
	effect: "slide", //효과 slide/fade/flip/cover-flow/cube
	speed: 1000, // 속도
	loop: 0, // 반복
	slidesPerView: 3,
	slidesPerGroup: 3,
	navigation: {
		nextEl: " .MusicNextButton",
		prevEl: " .MusicPrevButton",
		
	},

});    

const BooklistSlider = new Swiper(".swiper-container.BooklistSlide", {
	effect: "slide", //효과 slide/fade/flip/cover-flow/cube
	speed: 1000, // 속도
	loop: 0, // 반복
	slidesPerView: 3,
	slidesPerGroup: 3,
	navigation: {
		nextEl: " .BookNextButton",
		prevEl: " .BookPrevButton",
		
	},

});        
    

   