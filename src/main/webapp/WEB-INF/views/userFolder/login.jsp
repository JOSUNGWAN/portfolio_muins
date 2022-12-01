<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="resources/myLib/jquery-3.2.1.min.js"></script>
    <script defer src="resources/myLib/inCheck.js"></script>
    <script type="text/javascript">
	let iCheck=false;
	let pCheck=false;
	
	$(function() {
		$('#id').focus();
		//--------------------------idCheck--------------------------------
		$('#id').keydown(function(e) { // enterKey 누르면 다음으로 이동 -> keydown() 자동적으로 focusout 이벤트 발생하게됨
			if(e.which==13) {
				e.preventDefault();
				// => form 에 submit 이 있는경우
		        // => enter 누르면 자동 submit 발생되므로 이를 제거함
				$('#password').focus();
			}
		}).focusout(function() {
			iCheck = idCheckjs();
		});
		//--------------------------passwordCheck--------------------------------
		$('#password').keydown(function(e) { 
			if(e.which==13) {
				e.preventDefault();
				$('#password2').focus();
			}
		}).focusout(function() {
			pCheck = passwordCheckjs();
		});

	}); //ready

	
	function inCheck() {
			if (iCheck==false) { $('#idmessage').html(' 아이디를 잘못 입력했습니다.');}
			if (pCheck==false) { $('#passwordmessage').html(' 비밀번호를 잘못 입력했습니다.');}
			if ( iCheck && pCheck) {
					return true; // submit 진행
				} else {
					return false;
				}
		} //inCheck
	
	
	</script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            text-decoration: none;
        }

        body,
        html {
            height: 100%;
        }

        h1 {
            margin-bottom: 20px;
        }

        hr {
            margin: 20px 10px;
        }

        .bg {
            position: relative;
            background-image: url("resources/music_image/pexels-moose-photos-1037992.jpg");
            width: 100%;
            height: 100%;
            background-position: left;
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        /* Add styles to the form container */
        .container {
            position: absolute;
            border: solid 1px lightgray;
            right: 200px;
            top: 50%;
            transform: translateY(-50%);
            margin: 50px;
            max-width: 350px;
            padding: 16px;
            background-color: white;
        }

        /* Full-width input fields */
        input[type=text],
        input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus,
        input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Set a style for the submi button */
        .btn {
            text-align: center;
            font-size: 0.8rem;
            display: block;
            background-color: #04AA6D;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            margin: 10px 0;
            width: 100%;
            opacity: 0.9;
        }

        .btn:hover {
            opacity: 1;
        }
    </style>
</head>

<body>
    <main class="bg">
        <div class="container">
            <form action="login" method="post">
                <h1>Login</h1>
                <c:if test="${not empty message}">
                ${message}
                </c:if>
                <br>

                <label for="id"><b>ID</b></label>
                <input id="id" type="text" placeholder="Enter ID" name="id" required>			
                <label for="password"><b>Password</b></label>
                <input id="password" type="password" placeholder="Enter Password" name="password" required>
				<span id="idmessage" class="eMessage"></span>
				<br>
				<span id="passwordmessage" class="eMessage"></span>
                <button type="submit" class="btn" onclick="inCheck()">Login</button>
				
                <hr>
            </form>
            <a class="btn" href="signf">회원 가입</a>
            <a class="btn" href="home">회원 가입 없이 진행</a>
        </div>
    </main>
</body>
</html>