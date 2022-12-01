<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script defer src="resources/myLib/navhide.js"></script>
</head>

<body>
	<nav class="nav background-color-black vertical-middle">
		<div class="nav-start">
			<ul class="vertical-middle">
				<li><a href="home">MAIN</a></li>
				<li><a href="musicCri">Music</a></li>
				<li><a href="themaf">Thema</a></li>
			</ul>
		</div>

		<div class="nav-center">
			<ul class="vertical-middle">
				<li><a href="bcrilist">일반 게시판</a></li>
				<li><a href="pdbcrilist">작곡 게시판</a></li>
			</ul>
		</div>

		<div class="nav-end">
			<!-- ===== 로그인 후 ===== -->
			<c:if test="${not empty loginID}">
				<ul>
					<li>${loginName}</li>
					<li>
						<!-- openBtn -->
						<div id="dropdown">
							<span id="dropbutton">▼</span>
							<div id="myDropdown" class="dropdown-content hidden">
								<a href="userDetail?id=${loginID}">내 정보 보기</a> <a
									href="userUpdatef?id=${loginID}">내 정보 수정하기</a> 
									<a href="userPrePassword">암호변경하기</a>
								<hr>
								<a href="logout">로그 아웃</a>
								<hr>
								<a href="userDelete">회원 탈퇴</a>
								<!-- admin 관리 목록 -->
								<c:if test="${loginID == 'admin' }">
									<hr>
									<a href="usertotal">유저 관리</a>
									<a href="musictotal">음악 관리</a>
									<a href="adminBcrilist">일반게시판 관리</a>
									<a href="adminpdBcrilist">작곡게시판 관리</a>
								</c:if>
								<!-- admin 관리 목록 -->
							</div>
						</div>
					</li>
				</ul>
			</c:if>

			<!-- ===== 로그인 전 ===== -->
			<c:if test="${empty loginID}">
				<ul>
					<li><a href="loginf" class="btn btn-outline-light">Login</a></li>
					<li><a href="signf" class="btn btn-warning">Sign-up</a></li>
				</ul>
			</c:if>
		</div>
	</nav>
</body>
</html>