<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<link href="css/reply_update_form.css" rel="stylesheet">
<body>
	<div class="topmenu">
		<img src="images/TIS3.png" class="logo" alt="로고"
		onclick="location.href='ContentsList.do'">
	</div>
	<div class="formBox">
	<h2>REPLY UPDATE</h2>
	<form method="POST" action="BookReplyUpdate.do" id="joinForm" >
		<table class="table table-hover">
			<colgroup>
				<col style="width:150px;">
				<col style="width:850px;">
			</colgroup>
			<tbody>
				<tr>
				<th>댓글 내용</th>
				<td><input type="text" name="content" id="content" value=""></td>
				</tr>
			</tbody>
		</table>
		<div class="btns col text-right" var="bookReplyBean" items="${bookReplyBean}">
			<input type="hidden" name="rno" id="rno" value="${bookReplyBean.rno}">	
			<button type="submit" class="btn btn-primary" id="join">작성 완료</button>
			<button type="reset" class="btn btn-default" onclick="location.href='ContentsList.do'">취소</button>
		</div>
	</form>
	</div>
	<%@ include file="../../include/footer.jsp" %>
</body>
</html>