<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/book_info.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
					<div class="Modify" onclick=" location.href='BookUpdateForm.do?no=${bookBean.no }'">수정</div> 
		            <div class="Delete" onclick=" location.href='BookDelete.do?no=${bookBean.no }'">삭제</div> 
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
		
		
			<div class="img" >
				<img class="Detailposter" src="${bookBean.contentsImg }"alt="">
			</div>
	
			
			<div class="Total">

				<div class="explanation">
					<h1 class="title">${bookBean.title}</h1>
				</div>	

				<div class="explanation2">
					<div class="write">저자</div>
					<div class="write2">${bookBean.writer}</div>
				</div>

				<div class="explanation3">
					<div class="publisher">출판사</div>
					<div class="publisher2">${bookBean.publisher}</div>
				</div>
				
				<div class="explanation4">
					<div class="Genre">장르</div>
					<div class="Genre2">${bookBean.genre}</div>
				</div>

				<div class="explanation5">
					<div class="review">리뷰</div>
					<div class="review2">${bookBean.review}</div>
				</div>

				<div class="explanation6" >
					<div class="recommendation">추천</div>
					<div class="recommendation2">${bookBean.choochoo}</div>
				</div>
				
				<div class="underline"></div>
				
				<div class="explanation7" >
					<div class="contentsofbook">책내용</div>
					<p class="contentsofbook2 depth1">${bookBean.contentsofbook}</p>
				</div>
				
				

				<div class="hidden1">
					<div class="more1">더보기</div>
					<div class="close1">접기</div>
				</div>

				<div class="underline2"></div>

				<div class="explanation8" >
					<div class="category">목차</div>
					<div class="category2">${bookBean.category}</div>
				</div>

				<div class="hidden2">
					<div class="more2">더보기</div>
					<div class="close2">접기</div>
				</div>

				<div class="underline3"></div>

			</div>

			<div class="uparrow">
				<span class="up material-icons">expand_less</span>
			</div>

		<div class="replyBookForm">
		<!--                            댓글                                   -->
		<%@ include file="../../include/book_reply.jsp"%>
		<!--                            댓글   끝                                -->
		</div>	

		
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
				 formObj.attr("action", "BookReplyWrite.do");
				 formObj.submit();
			}
		});
		</script>
		<script src="js/more.js"></script>
		<script src="js/more2.js"></script>
		<script src="js/bookup.js"></script>
	<%@ include file="../../include/footer.jsp"%>
		
</body>
</html>