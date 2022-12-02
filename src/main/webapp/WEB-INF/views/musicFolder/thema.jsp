<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="#">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main page</title>
<link rel="stylesheet" href="resources/myLib/main.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script defer src="resources/myLib/listform.js"></script>
<style type="text/css">

</style>
</head>
<script type="text/javascript">

</script>

<body style="background-image: url('resources/music_image/pexels-keith-wako-89909.jpg'); background-size: cover;">
	<!-- header =============================================== -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header =============================================== -->

	<!-- nav =============================================== -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />	
	<!-- nav =============================================== -->

	<!-- main =============================================== -->
	<main class="main">
		<!-- main =============================================== -->
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

		<div class="main-container">
			<div class="thema-container">
				<table class="listform-table">
					<tr>
						<th>순위</th>
						<th>타이틀</th>
						<th>가수</th>
						<th>조회수</th>
						<th>듣기</th>
						<th>Play<br>List
						</th>
						<th>My<br>List
						</th>
					</tr>
					<c:forEach var="music" items="${music}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${music.mname}</td>
							<td>${music.aname}</td>
							<td>${music.count}</td>
							
														<c:if test="${userGrade=='프리미엄' || loginID == 'admin'}">
								<td>
									<span onclick="playMusic(${music.music_code})" title="${music.mname}"> 
										<img class="bbb" alt="듣기" src="resources/icons/play-button.png">
									</span>
								</td>
							</c:if>
							<c:if test="${userGrade!='프리미엄'}">
								<td>
									<span title="${music.mname}"> 
										<img class="bbb" alt="듣기" src="resources/icons/play-button.png"> 
										<span class="hidden aaa abs">프리미엄 결제 후 이용바랍니다.</span>
									</span>
								</td>

							</c:if>
							<c:if test="${not empty loginID && userGrade=='프리미엄'}">
								<td>
									<a href="#" onclick="playList(${music.music_code})">
										<img alt="플레이 리스트" src="resources/icons/play-list.png">
									</a>
								</td>
							</c:if>
							<c:if test="${empty loginID || userGrade=='일반'}">
								<td>
									<img class="bbb" alt="플레이 리스트" src="resources/icons/play-list.png">
									<span class="hidden aaa abs">프리미엄 결제 후 이용바랍니다.</span>
								</td>
							</c:if>

							<c:if test="${not empty loginID && userGrade=='프리미엄'}">
								<td><a onclick="myList(${music.music_code})"> 
									<img alt="마이 리스트" src="resources/icons/my-list.png"></a> 
									<span class="hidden abs">목록 추가</span>
								</td>
							</c:if>
							<c:if test="${empty loginID || userGrade=='일반'}">
								<td>
									<img class="bbb" alt="마이 리스트" src="resources/icons/my-list.png">
									<span class="hidden aaa abs">프리미엄 결제 후 이용바랍니다.</span>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</main>
	
	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>