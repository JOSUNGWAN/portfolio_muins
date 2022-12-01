<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main page</title>
    <script src="resources/myLib/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="resources/myLib/bootstrap.min.css">
    <link rel="stylesheet" href="resources/myLib/main.css">
    <style type="text/css">
    #user-main {
    	max-width : 1540px;
    }
    
    table {
		width : 100%;
		border : 1px solid gray;
	}
	
	table th {
		text-align : center;
		height: 40px;
		background-color: pink;
		border : 1px solid gray;
	}
	
	table td {
		height: 30px;
		border : 1px solid gray;
	}
	
	tr:hover {
		background-color: lightgray;
	}
    </style>
</head>

<body>
	<!-- header =============================================== -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header =============================================== -->

	<!-- nav =============================================== -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />	
	<!-- nav =============================================== -->

   <!-- main =============================================== -->
	<main id="user-main">
		<section id="user-section">
		<h2>음악 관리</h2>
		<a href="musicInsertf" class="btn float-right">음악 추가</a>
		<table style="width: 1280px"> 
		<tr>
			<th>mCode</th>
			<th>mname</th>
			<th>aname</th>
			<th>album</th>
			<th>mcategory</th>
			<th>regdate</th>
			<th class="hidden" style="overflow:hidden; width: 300px; white-space:nowrap; ;">lyrics</th>
			<th>count</th>
			<th>imagefile</th>
			<th>Delete</th>
			<th>Update</th>
		</tr>
		<c:if test="${not empty musicList}">
			<c:forEach var="music" items="${musicList}">
				<tr>
					<td>${music.music_code}</td>
					<td>${music.mname}</td>
					<td>${music.aname}</td>
					<td>${music.album}</td>
					<td>${music.mcategory}</td>
					<td>${music.regdate}</td>
					<td class="hidden" style="overflow:hidden; width: 300px; white-space:nowrap;">${music.lyrics}</td>
					<td>${music.count}</td>
					<td>${music.imagefile}</td>
					<td><a href="musicDelete?music_code=${music.music_code}">Delete</a></td>
					<td><a href="musicUpdatef?music_code=${music.music_code}">Update</a></td>
				</tr>
			</c:forEach>
		</c:if>
		</table>
		</section>
		
	<hr>
	</main>
	
	<!-- main =============================================== -->
		
	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>