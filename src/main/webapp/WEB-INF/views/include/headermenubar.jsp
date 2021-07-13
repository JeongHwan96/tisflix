<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="HeaderMenuBar">
	<div class="MenuBar">
		<h1 class="TISFLIX1 TIS">
			<img src="images/TIS3.png" class="logo" alt="로고"
				onclick="location.href='ContentsList.do'">
		</h1>
	</div>
	<div class="MenuBar MoMenu">Movie</div>
	<div class="MenuBar MuMenu">Music</div>
	<div class="MenuBar BoMenu">Book</div>
	<c:choose>
		<c:when test="${loggedMemberInfo != null }">
			<c:choose>
				<c:when test="${userId == 'admin'}">

					<div class="MenuBar loginMenu1">
						<ul class="gnblist" >
							<li class="first">
								<a class="depth01" href="">글쓰기</a>
								<ul class="depth02" >
									<li><a class="MoiveWrite" href="MovieWriteForm.do">무비 글쓰기</a></li>
									<li><a class="MusicWrite" href="MusicWriteForm.do">뮤직 글쓰기</a></li>
									<li><a class="BookWrite" href="BookWriteForm.do">북 글쓰기</a></li>
								</ul>
							</li>
						</ul>
					</div>

					<div class="MenuBar joinMenu2">
						<div class="Member">
							<a href="MemberList.do" class="member">회원목록</a>
						</div>
					</div>
					<div class="MenuBar joinMenu3">
						<div class="LogOut">
							<a href="MemberLogOut.do" class="memberlogout">로그아웃</a>
						</div>
					</div>

				</c:when>
				<c:otherwise>
					<div class="MenuBar NotAdminloginMenu">
						<ul class="gnblist" >
							<li class="first">
								<a class="depth01" href="">글쓰기</a>
								<ul class="depth02" >
									<li><a class="MoiveWrite" href="MovieWriteForm.do">무비 글쓰기</a></li>
									<li><a class="MusicWrite" href="MusicWriteForm.do">뮤직 글쓰기</a></li>
									<li><a class="BookWrite" href="BookWriteForm.do">북 글쓰기</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="MenuBar NotAdminloginMenu">
						<div class="Member">
							<a href="MemberUpdateForm.do?no=${loggedMemberInfo.no}" class="member">회원정보</a>
						</div>
					</div>
					<div class="MenuBar NotAdminjoinMenu">
						<div class="LogOut">
							<a href="MemberLogOut.do" class="">로그아웃</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<div class="MenuBar NologinMenu">
				<h3 class="Login">
					<a href="MemberLoginForm.do" class="DetailLogin">Login</a>
				</h3>
			</div>
			<div class="MenuBar NojoinMenu">
				<h3 class="Join">
					<a href="MemberJoinForm.do" class="DetailJoin">Join</a>
				</h3>
			</div>
		</c:otherwise>
	</c:choose>
</div>