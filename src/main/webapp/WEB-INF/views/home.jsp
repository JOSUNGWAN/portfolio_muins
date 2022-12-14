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

<body class="home_body_gradiant" style="background-image: url('resources/music_image/pexels-wendy-wei-1190297.jpg');">
	<!-- header =============================================== -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header =============================================== -->

	<!-- nav =============================================== -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />	
	<!-- nav =============================================== -->

	<!-- main =============================================== -->
	<main class="main">
			<!-- === SLIDE START === -->
			<div class="slideshow-container">
				<div class="mySlides">
					<img src="resources/images/slideimg1.png" style="width: 100%">
				</div>
	
				<div class="mySlides">
					<img src="resources/images/slideimg2.png" style="width: 100%">
				</div>
	
				<div class="mySlides">
					<img src="resources/images/slideimg3.png" style="width: 100%">
				</div>
	
				<!-- Next and previous buttons -->
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				<a class="next"	onclick="plusSlides(1)">&#10095;</a>
				
				dots/circles
				<div class="slideshow-dot" style="text-align: center">
					<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
						onclick="currentSlide(2)"></span> <span class="dot"
						onclick="currentSlide(3)"></span>
				</div>
			</div>

		<!-- === SLIDE END === -->
		<hr>
		

		<div class="main-container-h">
			<div class="container-box">
				<h4>????????? List</h4>
				<a href="musicCri" class="float-right font-small">??? ??????</a>
				<table class="main-table">
					<tr class="table-border-th">
						<th>??????</th>
						<th>?????????</th>
						<th>??????</th>
					</tr>
					<c:forEach var="music" items="${music}" begin="0" end="9" step="1" varStatus="vs">
						<tr class="hover-td">
							<td>${vs.count }</td>
							<td>${music.mname}</td>
							<td>${music.aname}</td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div class="container-box">
				<h4>?????? List</h4>
				<a href="musicCri" class="float-right font-small">??? ??????</a>
				<table class="main-table">
					<tr class="table-border-th">
						<th>??????</th>
						<th>?????????</th>
						<th>??????</th>
					</tr>
					<tr>
						<c:forEach var="pmusic" items="${pmusic}" begin="0" end="9" step="1" varStatus="vs">
							<tr class="hover-td">
								<td>${vs.count}</td>
								<td>${pmusic.mname}</td>
								<td>${pmusic.aname}</td>
							</tr>
						</c:forEach>
					</tr>
				</table>
			</div>
			<hr>

			<h4>Thema</h4>
			<hr>
			<div class="main-container-h">
				<ul>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/?????????.jpg'),no-repeat,center;">
					<a href="musicthema?thema=??????">??????</a>
					</li>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/??????.jpg'),no-repeat,center;">
					<a href="musicthema?thema=??????">??????</a>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/????????????.jpg'),no-repeat,center;">
					<a href="musicthema?thema=????????????">????????????</a>
					</li>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/?????????.jpg'),no-repeat,center;">
					<a href="musicthema?thema=?????????">?????????</a>
					</li>
				</ul>
				<ul>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/?????????.jpg'),no-repeat,center;">
					<a href="musicthema?thema=??????">??????</a>
					</li>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/??????.jpg'),no-repeat,center;">
					<a href="musicthema?thema=??????">??????</a>
					</li>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/?????????.jpg'),no-repeat,center;">
					<a href="musicthema?thema=?????????">?????????</a>
					</li>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/?????????.jpg'),no-repeat,center;">
					<a href="musicthema?thema=?????????">?????????</a>
					</li>
				</ul>
			</div>
		<hr>
		<h4>?????? ?????? ?????????</h4>
		<hr>
				<div class="container-box">
				<h4>?????? ?????????</h4>
				<a href="bcrilist" class="float-right font-small">??? ??????</a>
				<table class="main-table">
					<tr class="table-border-th">
						<th>?????????</th>
						<th>?????????</th>
						<th>?????????</th>
						<th>?????????</th>
					</tr>
					<c:forEach var="blist" items="${blist}" begin="0" end="9" step="1">
						<tr class="hover-td">
							<td>${blist.seq}</td>
							<c:if test="${not empty loginID}">
								<td><a href="boardDetail?seq=${blist.seq}">${blist.title}</a></td>
							</c:if>
							<c:if test="${empty loginID}">
								<td>${blist.title}</td>
							</c:if>
							<td>${blist.id}</td>
							<td>${blist.vote}</td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div class="container-box">
				<h4>?????? ?????????</h4>
				<a href="pdbcrilist" class="float-right font-small">??? ??????</a>
				<table class="main-table">
					<tr class="table-border-th">
						<th>?????????</th>
						<th>?????????</th>
						<th>?????????</th>
						<th>?????????</th>
					</tr>
					<tr>
						<c:forEach var="pdblist" items="${pdblist}" begin="0" end="9" step="1">
							<tr class="hover-td">
								<td>${pdblist.seq}</td>
								<c:if test="${not empty loginID}">
									<td><a href="pdboardDetail?seq=${pdblist.seq}">${pdblist.songname}</a></td>
								</c:if>
								<c:if test="${empty loginID}">
									<td>${pdblist.songname}</td>
								</c:if>
								<td>${pdblist.id}</td>
								<td>${pdblist.vote}</td>
							</tr>
						</c:forEach>
					</tr>
				</table>
			</div>

			<!-- Next and previous buttons -->
			<a class="prev" onclick="movePrev(1)">&#10094;</a>
			<a class="next" onclick="moveNext(1)">&#10095;</a>
		</div>

		<hr>
	</main>
	<!-- main =============================================== -->
	
	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>
