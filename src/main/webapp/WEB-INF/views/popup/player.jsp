<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="#">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>music player pop up</title>
<script src="../myLib/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function playMusic(no) {
	console.log(no);
	$.ajax({
		type: 'Get',
		url: 'selectMusic',
		data: {
			music_code: no
		},
		success: function(resultData) {
			// aside
			console.log(resultData);
			$('.popup-mname').html(resultData.vo.mname);
			$('.popup-aname').html(resultData.vo.aname);
			$('.popup-img').attr("src", resultData.vo.imagefile);

			$('#current-audio').attr("src", STR1 + resultData.vo.mname + STR3);
			curAudio.currentTime = 0;
			curAudio.play();
		}, error: function() {
			console.log("실패");
		}
	}); // ajax
	
	$.ajax({
		type : 'get',
		url : 'musicCountUp',
		data : {
			music_code : no
		}, success : function() {
			console.log("성공");
		}, error : function() {
			console.log("실패");
		}
	}); // ajax
} // playMusic
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

h1 {
	text-align: center;
	margin: 10px 0;
}
audio {
	width: 100%;
}

.popup-container {
	display: flex;
	height: 300px;
	flex-wrap: wrap;
	vertical-align: middle;
}

.popup-img-container {
	display: inline-block;
	width : 150px;
	height: 150px;
	padding: 10px;
}

.popup-img-container img {
	width : 100%;
	height: 100%;
}

.popup-content {
	display: inline-block;
	width : 150px;
	margin : 5px;
	
}

.popup-content div:nth-of-type(1){
	width : 300px;
	height: 75px;
	font-size: 1.2em;
}

.popup-content div:nth-of-type(2){
	width : 300px;
	height: 75px;
}

table {
	width: 100%;
	text-align: left;
	margin: 10px;
}

table tr {
	height: 40px;
}

table th:nth-of-type(1) {
	width: 30%;
}

table th:nth-of-type(2) {
	width: 60%;
}

tr:hover {
	background-color: lightGray;
}
</style>

</head>
<body>
	<header>
		<h1>Music Player</h1>
	</header>

	<main>
		<div class="popup-container">
			<div class="popup-img-container">
				<img class="popup-img" src="../images/cal.png">
			</div>
			
			<div class="popup-content">
				<div class="popup-mname">mname ${mname}</div>
				<hr>
				<div class="popup-aname">aname ${aname}</div>
			</div>
			<audio id="current-audio" controls muted src="#"></audio>
			
		</div>
		
		<hr>
		
		<table>
			<c:forEach items="${popplayList}" var="playList">
				<tr>
					<th>${playList.aname}</th>
					<th>${playList.mname}</th>
					<th onclick="playMusic(${playList.music_code})" title="${playList.mname}">
						<img	alt="듣기" src="../icons/play-button.png">
					</th>
				</tr>
			</c:forEach>
		</table>
	</main>

</body>
</html>