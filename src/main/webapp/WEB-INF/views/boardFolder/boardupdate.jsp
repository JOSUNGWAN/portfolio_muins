<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>bordDetail</title>
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
			<form id="form" class="frm" action="bupdate" method="post">
				<div class="date">
					<span>${bselectone.regdate}</span>
				</div>
				<div class="board clear ">
					<div class="side">
						<a href="">${bselectone.id}</a>
						<div class="side fr">
							<span>조회수 <b>${bselectone.cnt}</b></span> <span>추천수 <b>0</b></span>
							<span>댓글 <b>1</b></span>
						</div>
					</div>
				</div>
				<input class="title" name="title" type="text" value="${bselectone.title}"><br>
				<textarea name="content" rows="20">${bselectone.content}</textarea>
				<br>
				<button type="submit" id="modifyBtn" class="btnf btn-modify">
					<i class="fa fa-edit"></i> 수정완료
				</button>
				<button onclick="goBack()" id="listBtn" class="btnf btn-list">
					<i class="fa fa-bars"></i> 취소
				</button>
				<input name="id" value="${bselectone.id}" hidden> <input
					name="seq" value="${bselectone.seq}" hidden> <input
					name="cnt" value="${bselectone.cnt}" hidden> <input
					name="regdate" value="${bselectone.regdate}" hidden>
			</form>
		</div>

	</main>
</body>
<!-- main boardList =============================================== -->

	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>