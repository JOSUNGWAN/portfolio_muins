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
<script>

	$(function() { 
		$('#searchType').change(function() {
			if($(this).val() == 'n') 
			   $('#keyword').val('');
		})
		$('#searchBtn').click(function() { 
			self.location = "pdbcrilist"
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
		<h2>작곡 게시판</h2>
		<div class="searchBar" id="searchBar">
			<select name="searchType" id="searchType">
				<option value="n"
					${pageMaker.cri.searchType==null ? 'selected' : '' }>전체</option>
				<option value="s"
					${pageMaker.cri.searchType=='s' ? 'selected' : '' }>곡명</option>
				<option value="c"
					${pageMaker.cri.searchType=='c' ? 'selected' : '' }>내용</option>
				<option value="i"
					${pageMaker.cri.searchType=='i' ? 'selected' : '' }>글쓴이</option>
				<option value="r"
					${pageMaker.cri.searchType=='r' ? 'selected' : '' }>날짜</option>
				<option value="sc"
					${pageMaker.cri.searchType=='sc' ? 'selected' : '' }>곡명/내용</option>
			</select> <input type="text" class="crisearch" name="keyword" id="keyword"
				value="">
			<button id="searchBtn">Search</button>
		</div>
		<div class="board_maincontainer">
			<div class="board_table">
				<table width="100%">
					<tr height="30">
						<th>번호</th>
						<th>곡명</th>
						<th>작곡자</th>
						<th>날짜</th>
						<th>조회수</th>
						<th>삭제</th>
					</tr>
					<c:if test="${not empty pdboardlist}">
						<c:forEach var="pdboard" items="${pdboardlist}">
							<tr class="bordlist_main" height="40">
								<td>${pdboard.seq}</td>
								<td id="none">
									<c:if test="${not empty loginID && userGrade == '프리미엄'}">
										<a href="pdboardDetail?seq=${pdboard.seq}">${pdboard.songname}</a>
									</c:if> 
									<c:if test="${empty loginID || userGrade != '프리미엄'}">
				            			${pdboard.songname}
				            		</c:if>
				            	</td>
								<td>
									<c:if test="${loginID == 'admin' || loginID == pdboard.id}">
										<a href="userDetail?id=${pdboard.id}">${pdboard.id}</a>
									</c:if> 
									<c:if test="${loginID != 'admin' && loginID != pdboard.id}">
										${pdboard.id}
									</c:if>
								</td>
								<td>${pdboard.regdate}</td>
								<td>${pdboard.cnt}</td>
								<td><a onclick="adminpdbdelet(${pdboard.seq}, ${pdboard.root})">delete</a></td>
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
					<a href="pdbcrilist${pageMaker.searchQuery(1)}"><img src="resources/icons/LeftArrow.jpg"></a>&nbsp; 
					<a href="pdbcrilist${pageMaker.searchQuery(pageMaker.spageNo-1)}">&lt;</a>&nbsp;&nbsp;
								
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
					<a href="pdbcrilist${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
				</c:if>

			</c:forEach>

			<!-- Next, Last -->
			<c:choose>
				<c:when test="${pageMaker.next && pageMaker.epageNo > 0}">

					<a href="pdbcrilist${pageMaker.searchQuery(pageMaker.epageNo+1)}">&nbsp;&nbsp;&gt;</a>
					<a href="pdbcrilist${pageMaker.searchQuery(pageMaker.lastPageNo)}">&nbsp;<img src="resources/icons/RightArrow.jpg"></a>
				</c:when>
				<c:otherwise>
					<font color="Gray">&nbsp;&nbsp;&gt;&nbsp;<img src="resources/icons/RightArrow.jpg"></font>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="board-footmenu">
			<div class="right">
				<c:if test="${not empty loginID}">
				&nbsp;&nbsp;<a href="pdboardinsertform">글쓰기</a>
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