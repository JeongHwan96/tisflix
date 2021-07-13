<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link href="css/member_list.css" rel="stylesheet">
<script src="js/addclass.js"></script> 
<body>

	<div class="formBox" id="list">
		<button class="btn all">
            <span></span>
            <span></span>
            <span></span>
        </button>
		<div class="topAndside">
		<div class="sideslide">
			<div class="topmenu">
				<img src="images/TIS3.png" class="logo" alt="로고"
				onclick="location.href='ContentsList.do'">
			</div>

            <div class="sidesearch">
				<form action="MemberList.do" class="MemberSearch">
					<h3>회원 검색</h3>
					<select name="searchType" id="searchType" class="form-control">
						<option value="memberName">이름</option>
						<option value="memberInterest">취미</option>
						<option value="memberAge">나이</option>
					</select>
					<input type="text" name="keyword" id="keyword" class="form-control">
					<a href="MemberList.do" class="btn btn-success back">뒤로 가기</a>		
					<input type="submit" value="검색하기" class="btn btn-success search">
				</form>
            </div>
        </div>
	</div>
		<img src="images/TIS3.png" class="Mainlogo" alt="로고"
		onclick="location.href='ContentsList.do'">
		
			<table class="table table-striped active">
				<colgroup>
					<col style="width:50px">
					<col style="width:50px">
					<col style="width:100px">
					<col style="width:50px">
					<col style="width:100px">
					<col style="width:100px">
					<col style="width:50px">
					<col style="width:50px">
					<col style="width:50px">
				</colgroup>
				<thead class="MemberDetailList">
					<tr >
						<th class="MemberNo">NO</th>
						<th class="MemberId">ID</th>
						<th class="MemberName">NAME</th>
						<th class="MemberProfile">PROFILE</th>
						<th class="MemberEmail">E-MAIL</th>
						<th class="MemberPhone">PHONE</th>
						<th class="MemberInterest">INTEREST</th>
						<th class="MemberAge">AGE</th>
						<th class="MemberDelete">회원 삭제</th>
					</tr>
				</thead>
				<tbody class="MemberDetail">
					<!-- ${memberList }게 MemberListController에서 memberList로 실어서 보낸 key -->
					<c:forEach var="memberBean" items="${memberList }" >
						<tr >
							<td class="MemberDetaliNo">${memberBean.no}</td>
							<td class="MemberDetaliId"><a href="MemberInfo.do?no=${memberBean.no}">${memberBean.id}</a></td>
							<td class="MemberDetaliName">${memberBean.name}</td>
							<td class="MemberDetaliProfile"><img src="${memberBean.profileImg}" class="profileImg"></td>
							<td class="MemberDetaliEmail">${memberBean.email}</td>
							<td class="MemberDetaliPhone">${memberBean.phone}</td>
							<td class="MemberDetaliInterest">${memberBean.interest}</td>
							<td class="MemberDetaliAge">${memberBean.age}</td>
							<td class="MemberDetaliAge"><a href="MemberDeleteForm.do?no=${memberBean.no }" class="btn btn-danger">회원 탈퇴</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
			
	</div>
		<%@ include file="../include/footer.jsp"%>
</body>
</html>