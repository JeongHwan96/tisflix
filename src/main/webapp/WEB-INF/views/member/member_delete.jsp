<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link href="css/member_delete.css" rel="stylesheet">
<body>

	<div class="formBox" id="update">
		<div class="topmenu">
			<img src="images/TIS3.png" class="logo" alt="로고"
			onclick="location.href='ContentsList.do'">
			</div>
		<h2>회원탈퇴</h2>
		<form action="MemberDelete.do" method="GET">
			<table class="table table-hover">
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody >
					<tr>
						<th>ID</th>
						<td><input type="text" name="name" value="${memberBean.id }"></td>
					</tr>
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name" value="${memberBean.name }"></td>
					</tr>
					
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" value=""></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" name="no" value="${memberBean.no }">
				<input type="submit" value="회원 탈퇴" id="join" class="btn btn-primary">
				<input type="reset" value="취소" id="cancel" class="btn btn-default">
				
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>






