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
        .main-pannel__choice ul {
            display: flex;
            justify-content: space-between;
            align-items: center;
            /* margin: 0 3%; */
        }

        .main-pannel__choice li {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 150px;
            flex: 1 1 320px;
            margin: 10px;
            border-radius: 15px;
            overflow: hidden;
            box-sizing: border-box;
        }

        .main-pannel__mood-btn {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 101%;
            color: #fff;
            font-size: 20px;
            border-radius: 15px;
            font-weight: bold;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-sizing: border-box;
            border: 0;
        }

        button {
            cursor: pointer;
        }

        #CHARTrealtime a {
            font-size: 13px;
        }

        .col_menu {
            font-size: 10px;
        }
        
        .category-bar {
        	font-size: 13px;
        	width: 130px
        }
        
        #muserlist {
			max-width: 1500px;
			padding-bottom: 100px;
		}
        h2 {
        	text-align: center;
        	margin-top: 20px;
        }
        th {
        	width: 130px;
        	text-align: center;
        }
        table {
        	margin-top: 20px;
        	border: 1px solid gray;
        	font-size: 15px;
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
	<main class="main" id="muserlist">

		<h2>회원관리</h2>
		
		<table width=100%> 
		<tr bgcolor="pink" height="30">
			<th>Id</th><th>Name</th><th>E-Mail</th><th>Phone</th><th>Address</th>
				<th>NickName</th><th>UserGrade</th><th>BirthDate</th><th>JoinDate</th>
		</tr>
			<tr height="40">
				<td>rich</td>
				<td>조성완</td>
				<td>rich@naver.com</td>
				<td>010-1234-5678</td>
				<td>경기도 포시 영통구 영통동 여기저기</td>
				<td>와니</td>
				<td>프리미엄</td>
				<td>1989.10.30</td>
				<td>2022.10.30</td>
			</tr>

		</table>
	</main>
	<hr>
	<!-- main =============================================== -->
		
	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>