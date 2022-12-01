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
    <link rel="stylesheet" href="resources/myLib/bootstrap.min.css">
    <link rel="stylesheet" href="resources/myLib/main.css">
    <script src="resources/myLib/jquery-3.2.1.min.js"></script>
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
		<h2>회원 관리</h2>
		
		<table> 
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>E-Mail</th>
			<th>Phone</th>
			<th>Address</th>
			<th>NickName</th>
			<th>Grade</th>
			<th>MyCategory</th>
			<th>BirthDate</th>
			<th>CreTime</th>
			<th>Delete</th>
		</tr>
		<c:if test="${not empty userlist}">
			<c:forEach var="user" items="${userlist}">
				<tr>
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>${user.phone}</td>
					<td>${user.address}</td>
					<td>${user.nickname}</td>
					<td>${user.usergrade}</td>
					<td>${user.mycategory}</td>
					<td>${user.birthdate}</td>
					<td>${user.createtime}</td>
					<td><a href="userDelete?id=${user.id}">Delete</a></td>
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