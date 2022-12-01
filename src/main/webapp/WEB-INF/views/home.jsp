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
<link rel="stylesheet" href="resources/myLib/bootstrap.min.css">
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
		

		<div class="main-container">
			<div class="container-box">
				<h4>최신곡 List</h4>
				<a href="musicCri" class="float-right font-small">더 보기</a>
				<table class="main-table">
					<tr class="table-border-th">
						<th>순위</th>
						<th>타이틀</th>
						<th>가수</th>
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
				<h4>인기 List</h4>
				<a href="musicCri" class="float-right font-small">더 보기</a>
				<table class="main-table">
					<tr class="table-border-th">
						<th>순위</th>
						<th>타이틀</th>
						<th>가수</th>
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
			<div class="main-container">
				<ul>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/격렬한.jpg'),no-repeat,center;">
					<a href="musicthema?thema=격렬">격렬</a>
					</li>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/긴장.jpg'),no-repeat,center;">
					<a href="musicthema?thema=긴장">긴장</a>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/몽환적인.jpg'),no-repeat,center;">
					<a href="musicthema?thema=몽환적인">몽환적인</a>
					</li>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/신나는.jpg'),no-repeat,center;">
					<a href="musicthema?thema=신나는">신나는</a>
					</li>
				</ul>
				<ul>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/행복한.jpg'),no-repeat,center;">
					<a href="musicthema?thema=행복">행복</a>
					</li>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/섹시.jpg'),no-repeat,center;">
					<a href="musicthema?thema=섹시">섹시</a>
					</li>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/우울한.jpg'),no-repeat,center;">
					<a href="musicthema?thema=우울한">우울한</a>
					</li>
					<li class="btn thema-box" style="background: url('resources/images/themaImages/불안한.jpg'),no-repeat,center;">
					<a href="musicthema?thema=불안한">불안한</a>
					</li>
				</ul>
			</div>
		</div>

		<hr>

		<h4>추천 순위 게시판</h4>
		<hr>
		<div class="main-container">
				<div class="container-box">
				<h4>일반 게시판</h4>
				<a href="bcrilist" class="float-right font-small">더 보기</a>
				<table class="main-table">
					<tr class="table-border-th">
						<th>글번호</th>
						<th>타이틀</th>
						<th>글쓴이</th>
						<th>추천수</th>
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
				<h4>작곡 게시판</h4>
				<a href="pdbcrilist" class="float-right font-small">더 보기</a>
				<table class="main-table">
					<tr class="table-border-th">
						<th>글번호</th>
						<th>타이틀</th>
						<th>글쓴이</th>
						<th>추천수</th>
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
