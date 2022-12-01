<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>일반 게시판</title>
<link rel="stylesheet" href="resources/myLib/bootstrap.min.css">
<link rel="stylesheet" href="resources/myLib/main.css">
<link rel="stylesheet" href="resources/myLib/board.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script defer src="resources/myLib/listform.js"></script>
</head>

<body>
	<!-- header =============================================== -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header =============================================== -->

	<!-- nav =============================================== -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />	
	<!-- nav =============================================== -->
	
	<!-- main boardList =============================================== -->
	<hr>
	<main class="main">
		<h2>music</h2>
		<a href="musicCri">music</a>
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
						<tr class="test">
							<td>${vs.count}</td>
							<td><img class="hidden" alt="#" src="${music.imagefile}">${music.mname}</td>
							<td>${music.aname}</td>
							<td>${music.count}</td>
							
							<c:if test="${userGrade=='프리미엄'}">
			                     <td>
			                     <span onclick="playMusic(${music.music_code})" title="${music.mname}">
			                     <img   alt="듣기" src="resources/icons/play-button.png"></span>
			                     </td>
			                </c:if>
			                <c:if test="${userGrade!='프리미엄'}">
			                     <td>
			                     <span title="${music.mname}">
			                     <img   alt="듣기" src="resources/icons/play-button.png"></span>
			                     </td>
		                    </c:if>
							<c:if test="${not empty loginID }">
								<td>
								<a href="#" onclick="playList(${music.music_code})">
								<img	alt="플레이 리스트" src="resources/icons/play-list.png"></a>
								</td>
							</c:if>
							<c:if test="${empty loginID }">
								<td>
								<img	alt="플레이 리스트" src="resources/icons/play-list.png">
								</td>
							</c:if>
							
							<c:if test="${not empty loginID }">
								<td>
								<a onclick="myList(${music.music_code})">
								<img alt="마이 리스트" src="resources/icons/my-list.png"></a>
								<span class="hidden abs">목록 추가</span>
								</td>
							</c:if>
							<c:if test="${empty loginID }">
								<td>
								<img alt="마이 리스트" src="resources/icons/my-list.png">
								</td>
							</c:if>
							
						</tr>
					</c:forEach>
				</table>
			</div>
			<c:if test="${not empty message}">
					${message}<br>
				<hr>
			</c:if>

		</div>


		<h2>일반 게시판</h2>
		<a href="bcrilist">게시판 으로..</a>
		<div class="board_maincontainer">
			<div class="board_table">
				<table width="100%">
					<tr height="30">
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
					<c:if test="${not empty board}">
						<c:forEach var="board" items="${board}">
							<tr class="bordlist_main" height="40">
								<td>${board.seq}</td>
								<td id="none"><c:if test="${not empty loginID}">
										<a href="boardDetail?seq=${board.seq}">${board.title}</a>
									</c:if> <c:if test="${empty loginID}">
			                    		${board.title}
			                    	</c:if></td>
								<td><c:if test="${loginID == 'admin'}">
										<a href="userdetail?id=${board.id}">${board.id}</a>
									</c:if> <c:if test="${loginID != 'admin'}">
										${board.id}
									</c:if></td>
								<td>${board.regdate}</td>
								<td>${board.cnt}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
		<!-- main boardList =============================================== -->
		<!-- main pdboardList =============================================== -->

		<h2>작곡 게시판</h2>
		<a href="pdbcrilist">작곡 게시판 으로..</a>
		<div class="board_maincontainer">
			<div class="board_table">
				<table width="100%">
					<tr height="30">
						<th>번호</th>
						<th>곡명</th>
						<th>작곡자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
					<c:if test="${not empty pdboard}">
						<c:forEach var="pdboard" items="${pdboard}">
							<tr class="bordlist_main" height="40">
								<td>${pdboard.seq}</td>
								<td id="none"><c:if test="${not empty loginID}">
										<a href="pdboardDetail?seq=${pdboard.seq}">${pdboard.songname}</a>
									</c:if> <c:if test="${empty loginID}">
				            	${pdboard.songname}
				            </c:if></td>
								<td><c:if test="${loginID == 'admin'}">
										<a href="userdetail?id=${pdboard.id}">${pdboard.id}</a>
									</c:if> <c:if test="${loginID != 'admin'}">
							${pdboard.id}
						</c:if></td>
								<td>${pdboard.regdate}</td>
								<td>${pdboard.cnt}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
		<!-- main pdboardList =============================================== -->
	</main>

	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>