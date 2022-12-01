<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>일반 게시판</title>
<link rel="stylesheet" href="resources/myLib/bootstrap.min.css">
<link rel="stylesheet" href="resources/myLib/main.css">
<link rel="stylesheet" href="resources/myLib/board.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script defer src="resources/myLib/board.js"></script>

</head>

<body>
	<!-- header =============================================== -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header =============================================== -->

	<!-- nav =============================================== -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />	
	<!-- nav =============================================== -->

	<!-- main boardList =============================================== -->
	<br>
	<main class="main">
		<hr>
		<div class="container">
			<h2 class="writing-header">일반 게시판</h2>
			<div class="date">
				<br>
			</div>
			<form id="form" class="frm" action="binsert" method="post">
				<div class="board clear ">
					<div class="side">
						<input name="id" type="text" value="${loginID}" class="idarea" readonly><br>
					</div>
				</div>
				<input class="title" name="title" type="text" placeholder="제목을 입력 해주세요." required><br>
				<textarea name="content" rows="20" placeholder="내용을 입력해 주세요."></textarea>
				<br>
				<button type="submit" id="writeBtn" class="btnf btn-write">등록</button>
				<button type="reset" id="resetBtn" class="btnf btn-reset">취소</button>
			</form>
		</div>
		<hr>
	</main>
</body>
<!-- main boardList =============================================== -->

	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->
</body>
</html>