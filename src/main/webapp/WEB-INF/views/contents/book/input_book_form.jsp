<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<link href="css/input_book_form.css" rel="stylesheet">
<body>
	<div class="formBox">
		<div class="topmenu">
			<img src="images/TIS3.png" class="logo" alt="로고"
			onclick="location.href='ContentsList.do'">
		<h2 class="BooktypingContents"></h2>
		<form method="POST" action="BookWrite.do" id="joinForm" enctype="multipart/form-data">
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
						<th>글쓴이</th>
						<td><input name="writer" id="writer"></input> </td>
					</tr>
					<tr>
						<th>출판사</th>
						<td><input type="text" name="publisher" id="publisher" ></td>
					</tr>
					<tr>
						<th>장르</th>
						<td><input name="genre" id="genre"></input> </td>
					</tr>
					<tr>
						<th>책소개</th>
						<td><textarea name="contentsofbook" id="contentsofbook" style="resize: none;"></textarea> </td>
					</tr>
					<tr>
						<th>항목</th>
						<td><textarea name="category" id="category" style="resize: none;"></textarea> </td>
					</tr>
					<tr>
						<th>리뷰</th>
						<td><textarea name="review" id="review" style="resize: none;"></textarea> </td>
					</tr>
					<tr>
						<th>컨텐츠 IMG</th>
						<td><input type="file" name="multipartFile" id="file"></td>
					</tr>
					<tr>
						<th>추천!</th>
						<td><input type="text" name="choochoo" id="choochoo" placeholder="이런 분에게 추천!"></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="button" value="작성 완료" id="join">
				<input type="button"  value="취소" id="cancel" onclick="location.href='ContentsList.do'">
			</div>
		</form>
	</div>
	<script>
	// front에서 db에 직접 접근 불가능
	
	$("#join").on("click",function(){
		if($("#title").val().length <= 0){
			alert("제목은 필수입력사항입니다.");
			$("#title").focus();
		} else if($("#writer").val().length <= 0){
			alert("글쓴이는 필수입력사항입니다.");
			$("#writer").focus();
		} else if($("#contentsofbook").val().length <= 0){
			alert("책소개는 필수입력사항입니다.");
		} else if($("#category").val().length <= 0){
			alert("항목은 필수입력사항입니다.");
			$("#translator").focus();
		}  else if($("#genre").val().length <= 0){
			alert("장르는 필수입력사항입니다.");
			$("#genre").focus();
		} else if($("#review").val().length <= 0){
			alert("리뷰는 필수입력사항입니다.");
			$("#review").focus();
		} else if($("#choochoo").val().length <= 0){
			alert("추천는 필수입력사항입니다.");
			$("#choochoo").focus();
		} else if($("#publisher").val().length <= 0){
			alert("출판사는 필수입력사항입니다.");
			$("#publisher").focus();
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
<script src="js/bookscript.js"></script>
</html>