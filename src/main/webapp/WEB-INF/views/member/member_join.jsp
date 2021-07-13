<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../include/header.jsp" %>
		<link href="css/member_join.css" rel="stylesheet">

		<body>
			<div class="formBox">
				<img src="images/TIS3.png" class="Joinlogo" alt="로고" onclick="location.href='ContentsList.do'">
				<form action="MemberJoin.do" id="joinForm" method="POST" enctype="multipart/form-data">
					<table>
						<colgroup>
							<col style="width:150px">
							<col style="width:850px">
						</colgroup>
						<tbody class="JoinBody">
							<tr>
								<th>ID</th>
								<td>
									<input type="text" name="id" id="userID">
									<button id="btnIdCheck">아이디 중복확인</button>
								</td>
							</tr>
							<tr>
								<th>NAME</th>
								<td><input type="text" name="name" id="userName" value=""></td>
							</tr>
							<tr>
								<th>PASSWORD</th>
								<td><input type="password" name="password" id="userPassword"></td>
							</tr>
							<tr>
								<th>E-MAIL</th>
								<td><input type="text" name="email" value="" id="userEmail"></td>
							</tr>
							<tr>
								<th>PHONE</th>
								<td><input type="text" name="phone" value="" id="userPhone"></td>
							</tr>
							<tr>
								<th>INTEREST</th>
								<td>
									<select name="interest" id="">
										<option value="MOVIE">MOVIE</option>
										<option value="MUSIC">MUSIC</option>
										<option value="BOOK">BOOK</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>AGE</th>
								<td>
									<select name="age" id="">
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
										<option value="50">50</option>
									</select>
								</td>
							</tr>
							<tr>
								<th >PROFILE IMG</th>
								<td>
									<input type="file" name="multipartProfileImg" id="profileImg">
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btns">
						<input type="button" value="회원가입" id="join">
						<input type="reset" value="취소" id="cancel" onclick=" location.href='ContentsList.do'">
						
					</div>
				</form>
			</div>
			<%@ include file="../include/footer.jsp" %>

				<script>
					// front에서 db에 직접 접근 불가능

					$("#join").on("click", function () {
						if ($("#userID").val().length <= 0) {
							alert("ID는 필수입력사항입니다.");
							$("#userID").focus();
						} else if ($("#userName").val().length <= 0) {
							alert("이름은 필수입력사항입니다.");
							$("#userName").focus();
						} else if ($("#userPassword").val().length <= 0) {
							alert("비밀번호는 필수입력사항입니다.");
							$("#userPassword").focus();
						} else {
							$("#joinForm").submit();
						}
					})

					$("#btnIdCheck").on("click", function () {
						//ajax
						let id = $("#userID").val();
						console.log(id);
						$.ajax({
							url: "MemberIdCheck.do?id=" + id, //여기서 체크해서 결과를 리턴
							success: function (data) {
								//여기서 결과를 받는다.
								console.log("MemberIdCheck.do에서 넘겨받은 값===" + data.result);
								let result = data.result;
								if (result > 0) {
									alert("쓸 수 없는 ID입니다.");
									$("#userID").val("");
									$("#userID").focus();
								} else {
									let check = confirm("사용가능한 ID입니다.", "사용하시겠습니까?");
									if (check) {
										$("#userID").attr("readonly", true);
									} else {
										$("#userID").val("");
										$("#userID").focus();
									}
								}
							}
						})
						return false;
					})
				</script>
		</body>

		</html>