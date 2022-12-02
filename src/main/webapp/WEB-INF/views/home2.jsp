<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="#">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>home</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="resources/myLib/main.css?after">
<script defer src="resources/myLib/home.js"></script>
<script type="text/javascript">

</script>
</head>

<body class="home_body_gradiant">
	<!-- header =============================================== -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header =============================================== -->

	<!-- nav =============================================== -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />	
	<!-- nav =============================================== -->

	<!-- main =============================================== -->
	<div> <img src="resources/music_image/concert.jpg" style="opacity: 0.4;"></div>
	<!-- main =============================================== -->
	
	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>
