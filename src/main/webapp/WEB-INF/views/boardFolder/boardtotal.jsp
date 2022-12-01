<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>bordList</title>
<link rel="stylesheet" href="resources/myLib/bootstrap.min.css">
<link rel="stylesheet" href="resources/myLib/main.css">
<link rel="stylesheet" href="resources/myLib/board.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script defer src="resources/myLib/board.js"></script>
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
		<c:if test="${not empty message}">
			${message}<br>
		</c:if>
		<div class="searchBar" id="searchBar">
			<select name="searchType" id="searchType">
				<option value="n"
					${pageMaker.cri.searchType==null ? 'selected' : '' }>전체</option>
				<option value="t"
					${pageMaker.cri.searchType=='t' ? 'selected' : '' }>제목</option>
				<option value="c"
					${pageMaker.cri.searchType=='c' ? 'selected' : '' }>내용</option>
				<option value="i"
					${pageMaker.cri.searchType=='i' ? 'selected' : '' }>글쓴이</option>
				<option value="r"
					${pageMaker.cri.searchType=='r' ? 'selected' : '' }>날짜</option>
				<option value="tc"
					${pageMaker.cri.searchType=='tc' ? 'selected' : '' }>제목/내용</option>
				<option value="tci"
					${pageMaker.cri.searchType=='tci' ? 'selected' : '' }>제목/내용/글쓴이</option>
			</select> <input type="text" name="keyword" id="keyword"
				value="${pageMaker.cri.keyword}">
			<button id="searchBtn">Search</button>
		</div>
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
					<c:if test="${not empty boardlist}">
						<c:forEach var="board" items="${boardlist}">
							<tr class="bordlist_main" height="40">
								<td>${board.seq}</td>
								<td id="none"><c:if test="${not empty loginID}">
										<a href="boardDetail?seq=${board.seq}&root=${board.root}">${board.title}</a>
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
		<hr>
		<div class="board-footmenu">
			<div class="right">
				<%-- <c:if test="${not empty loginID}"> --%>
				&nbsp;&nbsp;<a href="boardinsertform">글쓰기</a>
				<%-- </c:if> --%>
			</div>
			<div class="left">
				&nbsp;&nbsp;<a href="javascript:history.go(-1)">이전으로</a>
				&nbsp;&nbsp;<a href="home">홈으로</a>
			</div>
		</div>
	</main>
	<!-- main boardList =============================================== -->

	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>