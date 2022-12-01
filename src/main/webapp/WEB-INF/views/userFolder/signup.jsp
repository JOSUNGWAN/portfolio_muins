<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signUp</title>
    <script src="resources/myLib/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="resources/myLib/signup.css?after">
    <script defer type="text/javascript" src="resources/myLib/inCheck.js"></script>
    <style type="text/css">
		.bg {
			display: flex;
			flex-direction : column;
			justify-content: center;
			position: relative;
			width: 80%;
			height: 1280px;
			position: relative;
		    background-image: url("resources/music_image/pexels-pixabay-159376.jpg");
		    background-position: left;
		    background-repeat: no-repeat;
		    background-size: 70% 100%;    
		}
    </style>
</head>

<body>
    <main class="bg">
        <div class="container">
            <form action="signUp" method="post">
                <h1>Sign Up</h1>
                <hr>
				<!-- ===== id ===== -->
                <label><b>ID</b></label>
                <span class="message-font" id="idmessage"></span>
                <div>
                    <input type="text" placeholder="Enter ID..." id="id" name="id" min="8" max="15" required>
                    <input type="button" class="btn-idcheck" id="idDup" onclick="idDupCheck()" value="ID Check">
                </div>
                
				<!-- ===== Password ===== -->
                <label><b>Password</b></label>
                <span class="message-font" id="passwordmessage"></span>
                <div>
                    <input type="password" placeholder="Enter Password..." id="password" name="password" min="8" max="15" required>
                </div>
				 
				 <!-- ===== Check Password ===== -->
                <label><b>Check Password</b></label>
				<span class="message-font" id="password2message"></span>
                <div>
                    <input type="password" placeholder="Enter Password..." id="password2" name="password2" required>
                </div>
                
                <!-- ===== Name ===== -->
                <label><b>Name</b></label>
                <span class="message-font" id="namemessage"></span>
                <div>
                    <input type="text" placeholder="Enter Name..." id="name" name="name" required>
                </div>
                
                <!-- ===== E-Mail ===== -->
                <label><b>E-Mail</b></label>
                <span class="message-font" id="emailmessage"></span>
                <div>
                    <input type="text" placeholder="Enter E-Mail..." id="email" name="email" required>
                    <select id="selectemail" name="selectemail">
                    	<option value="@naver.com">@naver.com</option>
                    	<option value="@daum.net">@daum.net</option>
                    	<option value="@google.com">@google.com</option>
                    	<option value="directinput">직접 입력</option>
                    </select>
                </div>
                <div class="mail-check-box">
                <input id="checkno" class="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6">
                <input type="button" class="btn-idcheck" id="email_auth_key" value="E-mail Check">
                </div>
                <!-- ----11/16수정------------------------------------------ -->
                <input type="button" id="emailCheck" value="E-Mail 인증번호 받기" >
                <!-- ----11/16수정------------------------------------------ -->
                <div>
				<span id="mail-check-warn"></span>
                </div>
				
	
				<!-- ===== Nick-Name ===== -->
                <label><b>Nick-Name</b></label>
                <span class="message-font" id="nicknamemessage"></span>
                <div>
                    <input type="text" placeholder="Enter Nick-Name..." id="nickname" name="nickname" min="8" max="15" required>
                </div>
                
                <!-- ===== Address ===== -->
                <label><b>Address</b></label>
                <span class="message-font" id="addressmessage"></span>
                <div>
                    <input type="text" placeholder="Enter Address..." id="address" name="address" required>
                </div>

				<!-- ===== Birth-Day ===== -->
                <label><b>Birth-Day</b></label>
                <span class="message-font" id="birthdatemessage"></span>
                <div>
                    <input type="text" placeholder="Enter Birth-Day... ex)yyyymmdd" id="birthdate" name="birthdate" required>
                </div>
                
                <!-- ===== Phone-Number ===== -->
                <label><b>Phone-Number</b></label>
                <span class="message-font" id="phonemessage"></span>
                <div>
                    <input type="text" placeholder="Enter Phone Number... ex)01012341234" id="phone" name="phone" required>
                </div>
                <hr>

                <button type="submit" class="btn" onclick="return inCheck()">Sign</button>
                <button type="reset" class="btn">Cancle</button>
                <a class="btn" href="javascript:history.go(-1)">이전 화면으로</a>
            </form>
        </div>
    </main>
</body>
</html>