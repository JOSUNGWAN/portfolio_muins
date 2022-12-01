<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	
	table input[type=text] {
		width : 100%;
		height : 100%;
		border: 0 none;
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
		<form id="user-section" action="musicInsert" method="post" enctype="multipart/form-data">
		<h2>음악 수정</h2>
			<table> 
				<tr>
					<th>mname</th>
					<td><input type="text" name="mname" ></td>
				</tr>
				<tr>
					<th>aname</th>
					<td><input type="text" name="aname" ></td>
				</tr>
				<tr>
					<th>album</th>
					<td><input type="text" name="album" ></td>
				</tr>
				<tr>
					<th>mcategory</th>
					<td><input type="text" name="mcategory" ></td>
				</tr>
				<tr>
					<th>regdate</th>
					<td><input type="text" name="regdate" ></td>
				</tr>
				<tr>
					<th>lyrics</th>
					<td><input type="text" name="lyrics" ></td>
				</tr>
				<tr>
					<th>imagefile</th>
					<td><input type="file" name="uploadimagef" ></td>
				</tr>
				<tr>
					<th>musicfile</th>
					<td><input type="file" name="uploadmusicf" ></td>
				</tr>
				<tr>
			</table>
			<input class="btn float-right" type="submit" value="추가">
		</form>
	</main>
	
	<!-- main =============================================== -->
		
	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>