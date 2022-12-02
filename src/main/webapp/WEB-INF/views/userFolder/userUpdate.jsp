<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>userUpdate</title>
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
		<form action="userUpdate" method="post">
		<h1>내 정보 수정</h1>
		<hr>
		<!-- ===== id ===== -->
		<label><b>ID</b></label>
		<div>
			<input type="text" value="${user.id}" id="id" name="id" min="8" max="15" readonly>
		</div>

<%--
 		<!-- ===== Password ===== -->
		<label><b>Password</b></label>
		<div>
			<input type="password" value="${user.password}" id="password"
				name="password" min="8" max="15" required>
		</div>

		<!-- ===== Check Password ===== -->
		<label><b>Check Password</b></label>
		<div>
			<input type="password" value="Enter Password..." id="password2"
				name="password2" required>
		</div>
 --%>
		<!-- ===== Name ===== -->
		<label><b>Name</b></label>
		<div>
			<input type="text" value="${user.name}" id="name" name="name"
				required>
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
		<div id="email-update" >
			<input type="text" value="${user.email}" id="email" name="email" required>
				<select id="selectemail" name="selectemail">
				<option value="@naver.com">@naver.com</option>
				<option value="@daum.net">@daum.net</option>
				<option value="@google.com">@google.com</option>
				<option value="directinput">직접 입력</option>
			</select>
		</div>

		<!-- ===== Nick-Name ===== -->
		<label><b>Nick-Name</b></label>
		<div>
			<input type="text" value="${user.nickname}" id="nickname"
				name="nickname" min="8" max="15" required>
		</div>

		<!-- ===== Address ===== -->
		<label><b>Address</b></label>
		<div>
			<input type="text" value="${user.address}" id="address"
				name="address" required>
		</div>

		<!-- ===== Birth-Day ===== -->
		<label><b>Birth-Day</b></label>
		<div>
			<input type="text" value="${user.birthdate}"
				id="birthdate" name="birthdate" required>
		</div>

		<!-- ===== Phone-Number ===== -->
		<label><b>Phone-Number</b></label>
		<div>
			<input type="text" value="${user.phone}"	id="phone" name="phone" required>
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