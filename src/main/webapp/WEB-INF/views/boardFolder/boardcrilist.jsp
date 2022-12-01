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
<script defer src="resources/myLib/board.js"></script>
<script>

	$(function() {
		$('#searchType').change(function() {
			if($(this).val() == 'n')
			   $('#keyword').val('');
		})
		$('#searchBtn').click(function() {
			self.location = "bcrilist" 
				+ "${pageMaker.makeQuery(1,10)}"
				+ "&searchType=" 
				+ $('#searchType').val()
				+ "&keyword=" 
				+ $('#keyword').val()
		});

	});
</script>
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
		<h2>일반 게시판</h2>
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
			</select> <input type="text" class="crisearch" name="keyword" id="keyword"
				value="">
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
										<a href="boardDetail?seq=${board.seq}">${board.title}</a>
									</c:if> <c:if test="${empty loginID}">
			                    		${board.title}
			                    	</c:if></td>
								<td>
									<c:if test="${loginID == 'admin' || loginID == board.id}">
										<a href="userDetail?id=${board.id}">${board.id}</a>
									</c:if> 
									<c:if test="${loginID != 'admin' && loginID != board.id}">
										${board.id}
									</c:if>
								</td>
								<td>${board.regdate}</td>
								<td>${board.cnt}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
		<!-- Cri_Page -->
		<div align="center">
			<!-- First, prev -->
			<c:choose>
				<c:when test="${pageMaker.prev && pageMaker.spageNo > 1}">
					<a href="bcrilist${pageMaker.searchQuery(1)}"><img src="resources/icons/LeftArrow.jpg"></a>&nbsp; 
					<a href="bcrilist${pageMaker.searchQuery(pageMaker.spageNo-1)}">&lt;</a>&nbsp;&nbsp;
								
				</c:when>
				<c:otherwise>
					<font color="Gray"><img src="resources/icons/LeftArrow.jpg">&nbsp;&lt;&nbsp;&nbsp;</font>
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
					<a href="bcrilist${pageMaker.searchQuery(pageMaker.lastPageNo)}">&nbsp;<img src="resources/icons/RightArrow.jpg"></a>
				</c:when>
				<c:otherwise>
					<font color="Gray">&nbsp;&nbsp;&gt;&nbsp;<img src="resources/icons/RightArrow.jpg"></font>
				</c:otherwise>
			</c:choose>

		</div>
		<div class="board-footmenu">
			<div class="right">
				<c:if test="${not empty loginID}">
				&nbsp;&nbsp;<a href="boardinsertform">글쓰기</a>
				</c:if>
				<c:if test="${empty loginID}">
				&nbsp;&nbsp;<span>글쓰기</span>
				</c:if>
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