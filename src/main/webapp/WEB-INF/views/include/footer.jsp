<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script defer src="resources/myLib/footer.js"></script>
</head>
	<!-- footer =============================================== -->
	<footer class="fixed">
		<div id="footer-img">
			<img src="resources/icons/cd.png">
		</div>

		<div id="footer-title">title 제목</div>

		<div id="footer-audio">
			<audio  id="current-audio" controls>
			</audio>
			
			<c:if test="${not empty loginID }">
				<div id="footer-icon" class="">
					<img class="width-100" src="resources/icons/menu.png">
				</div>
				
				<div id="footer-up" class="hidden abs">
					<ul>
						<li><strong>Play List</strong></li>
						<li><hr></li>
					</ul>
					<ul id="playList-ul">
						<c:forEach var="playlist" items="${splayList}" varStatus="vs">
							<li onclick="setIndex(${vs.count})">
								<input type="text" value="${playlist.mname}" readonly>
								<a href="playListDelete?no=${playlist.no}">X</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			
			<c:if test="${empty loginID }">
				<div id="footer-up" class="hidden abs">
					<ul>
						<li><strong>Play List</strong></li>
						<li><hr></li>
					</ul>
					<ul id="playList-ul">
						<c:forEach var="playlist" items="${playList}" varStatus="vs">
							<li onclick="setIndex(${vs.count})">
								<input type="text" value="${playlist.mname}" readonly>
								<a href="playListDelete?no=${playlist.no}">X</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
		</div>
	</footer>
	<!-- footer =============================================== -->
</html>
