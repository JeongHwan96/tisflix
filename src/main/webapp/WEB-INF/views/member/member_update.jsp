<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link href="css/MemberUpdate.css" rel="stylesheet">
<body>
	<div class="topmenu">
		<img src="images/TIS3.png" class="logo" alt="로고"
		onclick="location.href='ContentsList.do'">
	</div>
	
	<div class="update" id="update">
		<h2>회원정보 수정</h2>
		<form action="MemberUpdate.do" method="POST" class="memberUpdateForm">
			<div class="form-group">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="${memberBean.id }" value="${memberBean.id }" readonly>		
			</div>				
			<div class="form-group">
				<label for="">NAME</label>
				<input type="text" class="form-control" id="name" name="name" value="${memberBean.name }">		
			</div>				
			<div class="form-group">
				<label for="">PASSWORD</label>
				<input type="password" class="form-control" id="password" name="password">		
			</div>				
			<div class="form-group">
				<label for="">EMAIL</label>
				<input type="text" class="form-control" id="email" name="email" value="${memberBean.email }">		
			</div>				
			<div class="form-group">
				<label for="">PHONE</label>
				<input type="text" class="form-control" id="phone" name="phone" value="${memberBean.phone }">		
			</div>
			<div class="form-group">
				<label for="">INTEREST</label>
				<select name="interest" id="interest" class="form-control">
					<option value="MOVIE">MOVIE</option>
					<option value="MUSIC">MUSIC</option>
					<option value="BOOK">BOOK</option>
				</select>
			</div>					
			<div class="form-group">
				<label for="">AGE</label>
				<select name="age" id="age" class="form-control">
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
			</div>			
			<div class="form-group">		
				<div class="btns">
					<input type="hidden" name="no" value="${memberBean.no }">
					<input type="submit" value="회원 정보 수정" id="join" class="btn btn-success">
					<a href="MemberList.do" class="btn btn-danger">취소</a>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>