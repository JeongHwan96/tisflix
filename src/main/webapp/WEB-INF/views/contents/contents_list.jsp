<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<html>
<head>
<meta charset="UTF-8">
<title>TISFLIX</title>
</head>
<body class="body">

	<%@ include file="../include/mainslide.jsp" %>

	<%@ include file="../include/headermenubar.jsp" %>
	
	<ul class="contentsList">
		<li class="list">
			<h2>Movie List</h2>

			<div class="swiper-container listSlide">
				<ul class="swiper-wrapper">
					<c:forEach var="movieBean" items="${movieList}">
						<li class="swiper-slide movieslide">
							<div class="contentsBox">
								<a href="MovieInfo.do?no=${movieBean.no }"> <img class="poster"
										src="${movieBean.contentsImg }" alt=""
										onmouseover="this.src='images/backread.png'"
										onmouseout="this.src=src='${movieBean.contentsImg }'">
								</a>
								<div class="MovieName">${movieBean.title}</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<%@ include file="../include/button.jsp" %>
		</li>
		<li class="list">
			<h2 class="MusicList">Music List</h2>
			<div class="swiper-container MusiclistSlide">
				<ul class="swiper-wrapper ">
					<c:forEach var="musicBean" items="${musicList}">
						<li class="swiper-slide musicslide ">
							<div class="MusiccontentsBox">
								<a href="MusicInfo.do?no=${musicBean.no }"> <img class="album"
										src="${musicBean.contentsImg }" alt=""
										onmouseover="this.src='images/backread.png'"
										onmouseout="this.src=src='${musicBean.contentsImg }'">
								</a>
								<div class="MusicName">${musicBean.title}</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<%@ include file="../include/Musicbutton.jsp" %>
		</li>

		<li class="list">
			<h2 class="Booklist">Book List</h2>
			<div class="swiper-container BooklistSlide">
				<ul class="swiper-wrapper">
					<c:forEach var="bookBean" items="${bookList}">
						<li class="swiper-slide bookslide">
							<div class="BookcontentsBox">
								<a href="BookInfo.do?no=${bookBean.no }">
									 <img src="${bookBean.contentsImg }" alt="" class="bookImg"
										onmouseover="this.src='images/backread.png'"
										onmouseout="this.src=src='${bookBean.contentsImg }'">
								</a>
								<div class="BookName">${bookBean.title}</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<%@ include file="../include/Bookbutton.jsp" %>
		</li>

	</ul>

	<div class="mainuparrow">
		<span class="up material-icons">expand_less</span>
	</div>

	<%@ include file="../include/footer.jsp" %>
		<script src="js/swiper.js"></script>
		<script src="js/scroll.js"></script>
		<script src="js/addclass.js"></script>
		<script src="js/mainup.js"></script>
<!-- 		<script src="js/isotope.js"></script> -->


<script>
//영화
let w = $(window).width() / 2;
let h = $(window).height() / 2;
let depth = 0;
console.log(w,"==",h);
$.ajax({
	url:"MoiveJsonList.do",
	success:function(data){
		//console.log(data);
		//console.log(data.movieList);
		$(".movieList").html("");
		const movieList = data.movieList;
		$.each(movieList, function(i,item){
			//console.log(i + "==" + item);
			$(".movieList").append(`
			<li class="grid-item" data-idx = "\${item.no}">
				<img src="\${item.contentsImg}">
			</li>`)
		});
		$(".movieList li").each(function(i){
			gsap.fromTo($(this), {left:-500,top:-500,scale:0}, {
				left:Math.random()*60-30, 
				top:Math.random()*60-30, 
				scale:Math.random()*0.25+1,
				rotation:Math.random() * 60-30,
				//0-5<Math.random()<10-5
				delay:i * 0.1
			});
		});
	}
});

</script>	
<script>
//음악
$.ajax({
	url:"MusicJsonList.do",
	success:function(data){
		//console.log(data);
		//console.log(data.movieList);
		$(".musicList").html("");
		const musicList = data.musicList;
		$.each(musicList, function(i,item){
			//console.log(i + "==" + item);
			$(".musicList").append(`
			<li class="grid-item" data-idx = "\${item.no}">
				<img src="\${item.contentsImg}">
			</li>`)
		});
		$(".musicList li").each(function(i){
			gsap.fromTo($(this), {left:-500,top:-500,scale:0}, {
				left:Math.random()*60-30, 
				top:Math.random()*60-30, 
				scale:Math.random()*0.25+1,
				rotation:Math.random() * 60-30,
				//0-5<Math.random()<10-5
				delay:i * 0.1
			});
		});
	}
})
</script>
<script>
//책
$.ajax({
	url:"BookJsonList.do",
	success:function(data){
		//console.log(data);
		//console.log(data.movieList);
		$(".bookList").html("");
		const bookList = data.bookList;
		$.each(bookList, function(i,item){
			//console.log(i + "==" + item);
			$(".bookList").append(`
			<li class="grid-item" data-idx = "\${item.no}">
				<img src="\${item.contentsImg}">
			</li>`)
		});
		$(".bookList li").each(function(i){
			gsap.fromTo($(this), {left:-500,top:-500,scale:0}, {
				left:Math.random()*60-30, 
				top:Math.random()*60-30, 
				scale:Math.random()*0.25+1,
				rotation:Math.random() * 60-30,
				//0-5<Math.random()<10-5
				delay:i * 0.1
			});
		});
	}
})
</script>			
		
</body>

</html>