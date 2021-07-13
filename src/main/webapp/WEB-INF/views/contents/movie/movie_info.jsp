<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/movie_info.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>		
<script src="js/bootstrap.js"></script>

<body class="Detail">
	<div class="topmenu">
		<img src="images/TIS3.png" class="logo" alt="로고"
		onclick="location.href='ContentsList.do'">
		<c:choose>
			<c:when test="${userId == 'admin'}">
				<div class="btns">
					<div class="Modify" onclick=" location.href='MovieUpdateForm.do?no=${movieBean.no }'">수정</div> 
		            <div class="Delete" onclick=" location.href='MovieDelete.do?no=${movieBean.no }'">삭제</div> 
		            <div class="Cancel" onclick=" location.href='ContentsList.do'">취소</div>
				</div>
			</c:when>

			<c:otherwise>
				<div class="btns">
		            <div class="Cancel" onclick=" location.href='ContentsList.do'">뒤로 가기</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

</div>

	<div class="formBox" id="info">

		<div class="img"><img class="Detailposter"
			src="${movieBean.contentsImg }" alt="">
		</div>

		<div class="explanation">
			<h1 class="movieTitle">${movieBean.title}</h1>
		</div>
		
		<div class="explanation2">
			<span class="Genre">${movieBean.genre}</span>
			<span class="slush">▪</span>
			<span class="status">${movieBean.onoff}</span>
			<span class="slush">▪</span>
			<span class=RunningTime>${movieBean.runningtime}</span>
		</div>

		
		<div class="explanation3">
			<div class="Director">감독</div>
			<div class="DirectorList">${movieBean.director }</div>
			
		</div>

		<div class="explanation4">
			<div class="Actor">배우</div>
			<div class="ActorList">${movieBean.actor }</div>
		</div>

		<div class="explanation5">
			<div class="Review">한줄 리뷰</div>
			<div class="Review2">${movieBean.review}</div>	
		</div>

		<div class="explanation6">
			<div class="Recommendation">한줄 추천</div>
			<div class="Recommendation2">${movieBean.choochoo}</div>
		</div>

		<div class="explanation7">
			<div class="Preview">Preview</div>

			<iframe class="PreviewVideo" width="450" height="200"
					src='${movieBean.movieVideo}' title="YouTube video player"
					frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				

			<iframe class="PreviewVideo2" width="450" height="200"
					src='${movieBean.movieVideo2}' title="YouTube video player"
					frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				
		</div>
		
		<div class="underline"></div>
		
		
		<div class="explanation8" >
			<div class="contentsofmovie">줄거리</div>
			<p class="contentsofmovie2">${movieBean.contentsofmovie}</p>

			<div class="hidden2">
				<div class="more2">더보기</div>
				<div class="close2">접기</div>
			</div>
			<!--                            댓글                                   -->
			<%@ include file="../../include/movie_reply.jsp"%>
			<!--                            댓글   끝                                -->	
			<div class="underline2"></div>
		</div>
	</div>
	<div class="movieuparrow">
		<span class="up material-icons">expand_less</span>
	</div>



		
		
		

	
	<script>
		$("#replyWrite").on("click", function() {
			var formObj = $("form[name='replyForm']");
			if ($("#writer").val().length <= 0) {
				alert("댓글을 입력하려면 로그인 해야 합니다.");
				location.href="MemberLoginForm.do";
			} else if ($("#content").val().length <= 0) {
				alert("댓글내용은 필수입력사항입니다.");
				$("#content").focus();
			} else {
				formObj.attr("action", "MovieReplyWrite.do");
				formObj.submit();
			}
		});

		// 		//댓글 수정 View
		// 		$(".replyUpdateBtn").on("click", function(){
		// 			location.href = "?rno=${movieBean.no}"
		// 							+ "&page=${scri.page}"
		// 							+ "&perPageNum=${scri.perPageNum}"
		// 							+ "&searchType=${scri.searchType}"
		// 							+ "&keyword=${scri.keyword}"
		// 							+ "&rno="+$(this).attr("data-rno");
		// 		});

		// 		//댓글 삭제 View
		// 		$(".replyDeleteBtn").on("click", function(){
		// 			location.href = "/contents/movie/replyDeleteView?bno=${movieBean.no}"
		// 				+ "&page=${scri.page}"
		// 				+ "&perPageNum=${scri.perPageNum}"
		// 				+ "&searchType=${scri.searchType}"
		// 				+ "&keyword=${scri.keyword}"
		// 				+ "&rno="+$(this).attr("data-rno");
		// 		});
	</script>
	<script src="js/more.js"></script>
	<script src="js/movieup.js"></script>

	<%@ include file="../../include/footer.jsp"%>
</body>
</html>