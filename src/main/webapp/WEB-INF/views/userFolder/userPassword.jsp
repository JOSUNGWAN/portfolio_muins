<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>userPassword</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="resources/myLib/main.css?after">
<link rel="stylesheet" href="resources/myLib/user.css?after">
<script type="text/javascript">
	
</script>
</head>

<body>
	<!-- header =============================================== -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header =============================================== -->

	<!-- nav =============================================== -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />	
	<!-- nav =============================================== -->

	<!-- main boardList =============================================== -->
	<main id="user-main">
		<aside id="user-aside">
			<c:if test="${not empty loginID}">
				<ul>
					<li><img src="resources/profile/basic_profile.png"></li>
					<li>${loginName}</li>
					<li><hr></li>
					<li><a href="userDetail?id=${loginID}">내 정보 보기</a></li>
					<li><a href="userUpdatef?id=${loginID}">내 정보 수정하기</a></li>
					<li><a href="#">암호 변경하기</a></li>
					<li><hr></li>
					<li><a href="logout">로그 아웃</a></li>
					<li><hr></li>
					<li><a href="userDelete(${loginID})">회원 탈퇴</a></li>
					
					<!-- admin 관리 목록 -->
					<c:if test="${loginID == 'admin' }">
					<li><hr></li>
					<li><a href="usertotal">유저 관리</a></li>	
					<li><a href="musictotal">음악 관리</a></li>	
					<li><a href="boardtotal">게시판 관리</a></li>	
					</c:if>
					<!-- admin 관리 목록 -->
				</ul>
			</c:if>
		</aside>
		
		<section id="user-section">
			<form action="userNextPassword" method="post">
			<h1>암호 변경</h1>
			<hr>
	
	 		<!-- ===== Password ===== -->
			<label><b>변경할 암호를 입력해 주세요.</b></label>
			<div>
				<input type="password" id="password" name="password" min="8" max="15" required>
			</div>
	
			<hr>
			<button type="submit" class="btn">수정</button>
	        <button type="reset" class="btn">Cancle</button>
			</form>
        <hr>
	</section>
	
	</main>

	<!-- main  =============================================== -->

	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>