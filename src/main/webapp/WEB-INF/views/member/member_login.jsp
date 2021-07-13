<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<link href="css/Loginlayout.css" rel="stylesheet">
<body class="loginbody">
	<div class="formBox">
		<h2><img src="images/LoginTISFLIX2.png" class="Loginlogo" alt="로고" onclick="location.href='ContentsList.do'"></h2>
		<form action="MemberLogin.do" id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody class="LoginForm">
					<tr>
						
						<td>
							<input type="text" name="id" id="userID" placeholder="아이디"
							style="width:300px;height:50px;font-size:20px;border: solid 1px #dadada;" >
						</td>
					</tr>
					
					<tr>
						
						<td><input type="password" name="password" id="userPassword" placeholder="비밀번호"
						style="width:300px;height:50px;font-size:20px;border: solid 1px #dadada;"></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="submit" value="로그인" id="join">
				<div onclick="location.href='MemberJoinForm.do'"  class="Regi">회원 가입</div>
			</div>
		</form>
	</div>
	<script src="js/join.js"></script>
	<script src="js/addclass.js"></script>
	<%@ include  file="../include/footer.jsp" %>
</body>
</html>