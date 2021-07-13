<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link href="css/MemberInfo.css" rel="stylesheet">
<body>
	
	<div class="topmenu">
		<img src="images/TIS3.png" class="logo" alt="로고"
		onclick="location.href='ContentsList.do'">
		<div class="btns">
			<a href="MemberUpdateForm.do?no=${memberBean.no }" class="btn btn-warning Modify">회원 수정</a>
			<a href="MemberDeleteForm.do?no=${memberBean.no }" class="btn btn-danger Delete">회원 삭제</a>
			<a href="MemberList.do" class="btn btn-info Cancel">회원 목록</a>
		</div>
	</div>


	<!-- 	no값을 받아서.... -->
	<!-- 	한사람에 대한 정보를 뽑아온다... -->

	<div class="formBox" id="update">
<!-- 		<h2>회원 정보</h2> -->
<!-- 		<form action="MemberUpdate.do" method="POST"> -->
			<div class="profileImgBox">
				<img src="${memberBean.profileImg}" class="profileImg">
			</div>
			<table class="table">
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>
<!-- 					<tr> -->
<!-- 						<th>ID</th> -->
<!-- 						<td><input type="text" name="id" readonly></td> -->
<!-- 					</tr> -->
					<tr>
						<th>NAME</th>
						<td>${memberBean.name }</td>
					</tr>
					
					<tr>
						<th>E-MAIL</th>
						<td>${memberBean.email }</td>
					</tr>
					<tr>
						<th>PHONE</th>
						<td>${memberBean.phone}</td>
					</tr>
					<tr>
						<th>INTEREST</th>
						<td>${memberBean.interest }</td>
					</tr>
					<tr>
						<th>AGE</th>
						<td>${memberBean.age }</td>
					</tr>
				</tbody>
			</table>
<!-- 			<div class="btns"> -->
<%-- 				<a href="MemberUpdateForm.do?no=${memberBean.no }" class="btn btn-warning">회원 수정</a> --%>
<%-- 				<a href="MemberDeleteForm.do?no=${memberBean.no }" class="btn btn-danger">회원 탈퇴</a> --%>
<!-- 				<a href="MemberList.do" class="btn btn-info">회원 목록</a> -->
<!-- <!-- 				<a href="MemberJoinForm.do">회원 가입</a> --> -->
<!-- 			</div> -->
<!-- 		</form> -->
	</div>
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>