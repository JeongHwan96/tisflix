<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<link href="css/input_music_form.css" rel="stylesheet">
<body>
	<div class="topmenu">
		<img src="images/TIS3.png" class="logo" alt="로고"
		onclick="location.href='ContentsList.do'">
	<div class="formBox">
		<h2 class="MusictypingContents"></h2>
		<form method="POST" action="MusicWrite.do" id="joinForm" enctype="multipart/form-data">
			<table>
				<colgroup>
					<col style="width:150px;">
					<col style="width:850px;">
				</colgroup>
				<tbody>
					<tr>
						<th>앨범명</th>
						<td><input type="text" name="title" id="title" placeholder="앨범명을 입력하세요."></td>
					</tr>
					<tr>
						<th>음악명</th>
						<td><input type="text" name="titleSong" id="titleSong" style="margin: 0px; height: 32px; width: 175px; resize: none;"></input> </td>
					</tr>
					<tr>
						<th>아티스트</th>
						<td><input type="text" name="artist" id="artist" placeholder="아티스트을 입력하세요."></td>
					</tr>
					<tr>
						<th>리뷰</th>
						<td><input type="text" name="review" id="review" placeholder="리뷰를 입력하세요."></td>
					</tr>
					<tr>
						<th>추천!</th>
						<td><input type="text" name="choochoo" id="choochoo" placeholder="이런 분에게 추천!"></td>
					</tr>
					<tr>
						<th>발매일</th>
						<td><input type="text" name="releaseDate" id="releaseDate" placeholder="OO년OO월OO일"></td>
					</tr>
					<tr>
						<th>장르</th>
						<td><input type="text" name="genre" id="genre" placeholder="EDM/POP/JAZZ..."></td>
					</tr>
					<tr>
						<th>기획사</th>
						<td><input type="text" name="agency" id="agency" placeholder="기획사를 입력하세요."></td>
					</tr>
					<tr>
						<th>뮤직비디오</th>
						<td><input type="text" name="musicVideo" id="musicVideo" placeholder="유튜브 링크를 입력하세요."></td>
					</tr>
					<tr>
					<tr>
						<th>관련비디오</th>
						<td><input type="text" name="musicVideo2" id="musicVideo2" placeholder="유튜브 링크를 입력하세요."></td>
					</tr>
						<th>앨범 IMG</th>
						<td><input type="file" name="multipartFile" id="file"></td>
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
			alert("앨범명은 필수입력사항입니다.");
			$("#title").focus();
		} else if($("#titleSong").val().length <= 0){
			alert("타이틀송은 필수입력사항입니다.");
			$("#titleSong").focus();
		} else if($("#artist").val().length <= 0){
			alert("아티스트는 필수입력사항입니다.");
			$("#artist").focus();
		} else if($("#review").val().length <= 0){
			alert("리뷰는 필수입력사항입니다.");
			$("#review").focus();
		} else if($("#choochoo").val().length <= 0){
			alert("추천는 필수입력사항입니다.");
			$("#choochoo").focus();
		} else if($("#releaseDate").val().length <= 0){
			alert("발매일은 필수입력사항입니다.");
			$("#releaseDate").focus();
		} else if($("#genre").val().length <= 0){
			alert("장르는 필수입력사항입니다.");
			$("#genre").focus();
		} else if($("#agency").val().length <= 0){
			alert("기획사는 필수입력사항입니다.");
			$("#agency").focus();
		} else if($("#musicVideo").val().length <= 0){
			alert("뮤직비디오는 필수입력사항입니다.");
			$("#musicVideo").focus();
		} else if($("#file").val().length <= 0){
		 	alert("파일 IMG는 필수입력사항입니다.");
			$("#file").focus();
		} else {
			$("#joinForm").submit();
		}
	})
	</script>
	
</body>
<%@ include file="../../include/footer.jsp" %>
<script src="js/musicscript.js"></script>
</html>