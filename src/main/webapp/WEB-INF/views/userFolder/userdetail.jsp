<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>userdetail</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="resources/myLib/main.css?after">
<link rel="stylesheet" href="resources/myLib/user.css?after">
<script type="text/javascript">
	
</script>
</head>
<style>
	
</style>
<body>
	<!-- header =============================================== -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header =============================================== -->

	<!-- nav =============================================== -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />	
	<!-- nav =============================================== -->

	<!-- main =============================================== -->
	<main id="user-main">
		<aside id="user-aside">
			<c:if test="${not empty loginID}">
				<ul>
					<li><img src="resources/profile/basic_profile.png"></li>
					<li>${loginName}</li>
					<li><hr></li>
					<li><a href="userDetail?id=${loginID}">내 정보 보기</a></li>
					<li><a href="userUpdatef?id=${loginID}">내 정보 수정하기</a></li>
					<li><a href="userPrePassword">암호 변경하기</a></li>
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
		<h1>내 정보</h1>
		<hr>
		<!-- ===== id ===== -->
		<label><b>ID</b></label>
		<div>
			<input type="text" placeholder="${user.id}" id="id" name="id" min="8" max="15" readonly>
		</div>

		<!-- ===== Password ===== -->
		<%-- <label><b>Password</b></label>
		<div>
			<input type="password" placeholder="${user.password}" id="password"
				name="password" min="8" max="15" readonly>
		</div> --%>

		<!-- ===== Check Password ===== -->
		<!-- <label><b>Check Password</b></label>
		<div>
			<input type="password" placeholder="Enter Password..." id="password2"
				name="password2" readonly>
		</div> -->

		<!-- ===== Name ===== -->
		<label><b>Name</b></label>
		<div>
			<input type="text" placeholder="${user.name}" id="name" name="name"
				readonly>
		</div>
		
		<!-- ----11/16수정------------------------------------------ -->
		<!-- ===== UserGrade ===== -->
		<label><b>UserGrade</b></label>
		<div id="usergradebox" >
			<input type="text" value="${user.usergrade}" id="usergrade" name="usergrade" readonly>
			
			<input type="text" value="${paydate.pay_date} ~ ${paydate.end_date}" id="psydate" name="psydate" readonly>
		</div>

		<!-- ----11/16수정------------------------------------------ -->

		<!-- ===== E-Mail ===== -->
		<label><b>E-Mail</b></label>
		<div>
			<input type="text" placeholder="${user.email}" id="email" name="email" readonly>
				<!-- <select id="selectemail" name="selectemail">
				<option value="@naver.com">@naver.com</option>
				<option value="@daum.net">@daum.net</option>
				<option value="@google.com">@google.com</option>
				<option value="directinput">직접 입력</option>
			</select> -->
		</div>

		<!-- ===== Nick-Name ===== -->
		<label><b>Nick-Name</b></label>
		<div>
			<input type="text" placeholder="${user.nickname}" id="nickname"
				name="nickname" min="8" max="15" readonly>
		</div>

		<!-- ===== Address ===== -->
		<label><b>Address</b></label>
		<div>
			<input type="text" placeholder="${user.address}" id="address"
				name="address" readonly>
		</div>

		<!-- ===== Birth-Day ===== -->
		<label><b>Birth-Day</b></label>
		<div>
			<input type="text" placeholder="${user.birthdate}"
				id="birthdate" name="birthdate" readonly>
		</div>

		<!-- ===== Phone-Number ===== -->
		<label><b>Phone-Number</b></label>
		<div>
			<input type="text" placeholder="${user.phone}"
				id="phone" name="phone" readonly>
		</div>
		<hr>
	</section>
	</main>

	<!-- main  =============================================== -->

	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>