<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/music_info.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="js/jquery-3.6.0.min.js"></script>		
<script src="js/bootstrap.js"></script>
<body class="Detail">
	<div class="topmenu">
		<img src="images/TIS3.png" class="logo" alt="로고"
		onclick="location.href='ContentsList.do'">
		<c:choose>
			<c:when test="${userId == 'admin'}">
				<div class="btns">
					<div class="Modify" onclick=" location.href='MusicUpdateForm.do?no=${musicBean.no }'">수정</div> 
		            <div class="Delete" onclick=" location.href='MusicDelete.do?no=${musicBean.no }'">삭제</div> 
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
	<div class="formBox" id="info">

	 		
		<div class="img">
			<img class="Detailposter" src="${musicBean.contentsImg }"alt="">
		</div>
	
	 <div class="Total">	
		<div class="explanation">
			<h1 class="titlesong">${musicBean.titleSong}</h1>
		</div>

		<div class="explanation2">
			<span class="Detaildate">${musicBean.releaseDate}</span>
			<span class="slush">▪</span>
			<span class="Detailgenre">${musicBean.genre}</span>
			<span class="slush">▪</span>
			<span class="company2">${musicBean.agency}</span>
		</div>

		<div class="explanation3">
			<div class="albumname">앨범명</div>
			<div class="albumname2">${musicBean.title}</div>
		</div>

		<div class="explanation4">
			<div class="artist">아티스트</div>
			<div class="artist2">${musicBean.artist}</div>
		</div>

		
		<div class="explanation6">
			<div class="Review">리뷰</div>
			<div class="Review2">${musicBean.review}</div>
		</div>
		
		<div class=explanation7>
			<div class="Recommendation">추천</div>
			<div class="Recommendation2">${musicBean.choochoo}</div>
		</div>

		<div class="explanation8">
			<div class="TotalVideo">
				<div class="MV">뮤직비디오</div>
				<iframe class="Video" width="380" height="250" src='${musicBean.musicVideo}' title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
				</iframe>
			</div>
		</div>
		
	</div>
	<div class="replyMusicForm">
		<!--                            댓글                                   -->
		<%@ include file="../../include/music_reply.jsp"%>
		<!--                            댓글   끝                                -->
	</div>
</div>

<div class="musicuparrow">
	<span class="up material-icons">expand_less</span>
</div>

		<script>
		$("#replyWrite").on("click",function(){
			var formObj = $("form[name='replyForm']");
			if($("#writer").val().length <= 0){
				alert("댓글을 입력하려면 로그인 해야 합니다.");
				location.href="MemberLoginForm.do";
			} else if($("#content").val().length <= 0){
				alert("댓글내용은 필수입력사항입니다.");
				$("#content").focus();
			} else {
				 formObj.attr("action", "MusicReplyWrite.do");
				 formObj.submit();
			}
		});
		</script>
			<script src="js/musicup.js"></script>
		<%@ include file="../../include/footer.jsp"%>
		
</body>
</html>