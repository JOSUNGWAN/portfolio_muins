<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>bordList</title>
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
			</select> <input type="text" name="keyword" id="keyword" value="">
			<button id="searchBtn">Search</button>
		</div>
		<hr>
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

					<tr class="bordlist_main" height="40">
						<td>2</td>
						<td id="none">Love Me</td>
						<td>bomb</td>
						<td>2022.10.30</td>
						<td>10</td>
					</tr>

					<tr class="bordlist_main" height="40">
						<td>1</td>
						<td id="none"><a href="pdboardDetail">편지</a></td>
						<td>rich</td>
						<td>2022.10.29</td>
						<td>20</td>
					</tr>
				</table>
			</div>
		</div>
		<hr>
		<div class="board-footmenu">
			<a href="pdbinsertf">글쓰기</a>
		</div>

		<!-- Cri_Page -->
		<div align="center">
			<!-- First, prev -->
			<c:choose>
				<c:when test="${pageMaker.prev && pageMaker.spageNo > 1}">

					<a href="bcrilist${pageMaker.searchQuery(1)}">FP</a>&nbsp;
                <a
						href="bcrilist${pageMaker.searchQuery(pageMaker.spageNo-1)}">&lt;</a>&nbsp;&nbsp;

            </c:when>
				<c:otherwise>
					<font color="Gray">FF&nbsp;&lt;&nbsp;&nbsp;</font>
				</c:otherwise>
			</c:choose>

			<!-- Displag PageNo -->
			<c:forEach var="i" begin="${pageMaker.spageNo}"
				end="${pageMaker.epageNo}">
				<c:if test="${i == pageMaker.cri.currPage}">
					<font size="5" color="Orange">${i}</font>&nbsp;
            </c:if>
				<c:if test="${i != pageMaker.cri.currPage}">
					<a href="bcrilist${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
            </c:if>

			</c:forEach>

			<!-- Next, Last -->
			<c:choose>
				<c:when test="${pageMaker.next && pageMaker.epageNo > 0}">
					<a href="bcrilist${pageMaker.searchQuery(pageMaker.epageNo+1)}">&nbsp;&nbsp;&gt;</a>
					<a href="bcrilist${pageMaker.searchQuery(pageMaker.lastPageNo)}">&nbsp;LP</a>
				</c:when>
				<c:otherwise>
					<font color="Gray">&nbsp;&nbsp;&gt;&nbsp;LP</font>
				</c:otherwise>
			</c:choose>
		</div>
	</main>
	<!-- main boardList =============================================== -->

	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>