<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="resources/myLib/pay.js"></script>
</head>
	<!-- header =============================================== -->
	<header class="header background-color-black">
		<div id="menu-icon2" class="hidden">
			<img class="width-100 hidden" alt="#" src="resources/icons/menu.png">
		</div>
		<ul id="menu-icon2-drop" class="hidden">
			<li><a href="home">MAIN</a></li>
			<li><a href="musicCri">Music</a></li>
			<li><a href="themaf">Thema</a></li>
			<li><a href="bcrilist">일반 게시판</a></li>
			<li><a href="pdbcrilist">작곡 게시판</a></li>
			<c:if test="${empty loginID}">
				<li><hr></li>
				<li><a href="loginf">로그인</a></li>
				<li><a href="signf">회원 가입</a></li>
				<li><hr></li>
			</c:if>
			<c:if test="${not empty loginID}">
				<li><hr></li>
				<li>${loginName}</li>
				<li><hr></li>
				<li><a href="userDetail?id=${loginID}">내 정보 보기</a></li>
				<li><a href="userUpdatef?id=${loginID}">내 정보 수정하기</a></li>
				<li><a href="userPrePassword">암호 변경하기</a></li>
				<li><hr></li>
				<li><a href="logout">로그 아웃</a></li>
				<li><hr></li>
				<li><a href="#">회원 탈퇴</a></li>
				<c:if test="${loginID == 'admin' }">
					<!-- admin 관리 목록 -->
					<li><a href="usertotal">유저 관리</a></li>
					<li><a href="musictotal">음악 관리</a></li>
					<li><a href="adminBcrilist">일반게시판 관리</a></li>
					<li><a href="adminpdBcrilist">작곡게시판 관리</a></li>
				</c:if>
			</c:if>
		</ul>

		<form id="header-form" action="mainsearch">
			<input name="keywords" id="keywords" class="form-control" type="text"
				placeholder="Search..."> <input id="header-searchBtn"
				class="btn" type="submit" value="검색">
			<c:if test="${not empty loginID && userGrade == '프리미엄'}">
				<a class="pay hidden" href="payf" target="_blank">구독결제</a>
			</c:if>
			<c:if test="${not empty loginID && userGrade == '일반'}">
				<a class="pay" onclick="payf('${loginID}','${loginPhone}','${loginAddress}')" target="_blank">구독결제</a>
			</c:if>
			<c:if test="${empty loginID}">
				<a class="pay" id="pay_check_click">구독결제</a>
			</c:if>
		</form>
	</header>
	<!-- header =============================================== -->
</html>