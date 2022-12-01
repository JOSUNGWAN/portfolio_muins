<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullPointerException</title>
<link rel="stylesheet" href="resources/myLib/bootstrap.min.css">
<link rel="stylesheet" href="resources/myLib/main.css?after">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script defer src="resources/myLib/listform.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<main style="max-width : initial;width : 1400px; height : 90vh;
	background-image: url('resources/images/errorImage/error404.png');
	background-size: 100% 100%;
	background-repeat: no-repeat;">
	</main>
	NullPointerException
	페이지가 존재하지 않거나, 사용할 수 없는 페이지 입니다.
	주소가 올바른지 다시 한번 확인해 주세요.
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>