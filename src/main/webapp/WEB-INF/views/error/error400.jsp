<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error400</title>
<link rel="stylesheet" href="resources/myLib/bootstrap.min.css">
<link rel="stylesheet" href="resources/myLib/main.css?after">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script defer src="resources/myLib/listform.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<main style="max-width : initial;width : 1400px; height : 90vh;
	background-image: url('resources/images/errorImage/error400.png');
	background-size: 100% 100%;
	background-repeat: no-repeat;">
	</main>
	error400
	페이지가 작동하지 않습니다.
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>