<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<link href="css/input_movie_form.css" rel="stylesheet">
<body >
	<div class="topmenu">
		<img src="images/TIS3.png" class="logo" alt="로고"
		onclick="location.href='ContentsList.do'">
		</div>
		
	<div class="formBox">
		<h2 class="typingContents"></h2>
		<form method="POST" action="MovieWrite.do" id="joinForm" enctype="multipart/form-data">
			
			<table>
				<colgroup>
					<col style="width:150px;">
					<col style="width:850px;">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" id="title" placeholder="제목을 입력하세요."></td>
					</tr>
					<tr>
						<th>감독</th>
						<td><input type="text" name="director" id="director"></td>
					</tr>
					<tr>
						<th>배우</th>
						<td><input type="text" name="actor" id="actor"></td>
					</tr>
					<tr>
						<th>장르</th>
						<td><input type="text" name="genre" id="genre"></td>
					</tr>
					<tr>
						<th>상영여부</th>
						<td><input type="text" name="onoff" id="onoff"></td>
					</tr>
					<tr>
						<th>상영시간</th>
						<td><input type="text" name="runningtime" id="runningtime"></td>
					</tr>
					<tr>
						<th>리뷰</th>
						<td><textarea name="review" id="review" style="resize: none;"></textarea> </td>
					</tr>
					<tr>
						<th>추천!</th>
						<td><input type="text" name="choochoo" id="choochoo" placeholder="이런 분에게 추천!"></td>
					</tr>
					<tr>
						<th>컨텐츠 IMG</th>
						<td><input type="file"  name="multipartFile" id="file"></td>
					</tr>
					
					<tr>
						<th>예고편</th>
						<td><input type="text" name="movieVideo" id="movieVideo" placeholder="유튜브 링크를 입력하세요."></td>
					</tr>
					<tr>
						<th>예고편2</th>
						<td><input type="text" name="movieVideo2" id="movieVideo2" placeholder="유튜브 링크를 입력하세요."></td>
					</tr>

					<tr>
						<th>줄거리</th>
						<td><textarea name="contentsofmovie" id="contentsofmovie" style="margin: 0px; width: 447px; height: 143px; resize: none;"></textarea> </td>
					</tr>
					
				</tbody>
			</table>
			<div class="btns">
				<input type="button" value="작성 완료" id="join">
				<input type="reset" value="취소" id="cancel" onclick="location.href='ContentsList.do'">
			</div>
		</form>
	</div>
	<script>
	// front에서 db에 직접 접근 불가능
	
	$("#join").on("click",function(){
		if($("#title").val().length <= 0){
			alert("제목은 필수입력사항입니다.");
			$("#title").focus();
		} else if($("#director").val().length <= 0){
			alert("감독은 필수입력사항입니다.");
			$("#director").focus();
		} else if($("#actor").val().length <= 0){
			alert("배우는 필수입력사항입니다.");
			$("#actor").focus();
		}  else if($("#genre").val().length <= 0){
			alert("장르는 필수입력사항입니다.");
			$("#genre").focus();
		} else if($("#onoff").val().length <= 0){
			alert("상영여부는 필수입력사항입니다.");
			$("#onoff").focus();
		} else if($("#runningtime").val().length <= 0){
			alert("상영시간은 필수입력사항입니다.");
			$("#runningtime").focus();
		} else if($("#review").val().length <= 0){
			alert("리뷰는 필수입력사항입니다.");
			$("#review").focus();
		} else if($("#choochoo").val().length <= 0){
			alert("추천는 필수입력사항입니다.");
			$("#choochoo").focus();
		} else if($("#file").val().length <= 0){
			alert("파일 IMG는 필수입력사항입니다.");
			$("#file").focus();
		} else if($("#movieVideo").val().length <= 0){
			alert("예고편은 필수입력사항입니다.");
			$("#movieVideo").focus();
		} else if($("#contentsofmovie").val().length <= 0){
			alert("줄거리는은 필수입력사항입니다.");
			$("#movieVideo").focus();
		} else {
			$("#joinForm").submit();
		}
	})
	</script>
</body>
<%@ include file="../../include/footer.jsp" %>
<script src="js/script.js"></script>
</html>