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
<title>music list</title>
<link rel="stylesheet" href="resources/myLib/main.css?after">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script defer src="resources/myLib/listform.js"></script>
<script type="text/javascript">
    
</script>
</head>

<body style="background-image: url('resources/music_image/concert.jpg'); background-size: cover;">
	<!-- header =============================================== -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header =============================================== -->

	<!-- nav =============================================== -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />	
	<!-- nav =============================================== -->

	<!-- main =============================================== -->
	<main class="main">
		<aside class="hidden">
			<div class="aside-container left">
				<div class="aside-image">
					<img class="width-100 " src="resources/icons/cd.png" alt="">
				</div>
				<hr>
				<div class="aside-title">제목 ${mname}</div>
				<hr>
				<div class="aside-artist">가수 ${aname}</div>
				<hr>
				<div class="aside-lyrics">
					<div>가사</div>
					<div>
						<pre id="aside-lyrics">
							${lyrics}
						</pre>
					</div>
				</div>
			</div>
		</aside>
		
		<%-- <c:if test="${not empty loginID }">
		<aside class="hidden">
			<div class="aside-container right">
					<h4>My List</h4>
					<hr>
					<table>
						<tr>
							<th>번호</th>
							<th>타이틀</th>
							<th>삭제</th>
						</tr>
						<c:forEach items="${myList}" var="myMusic" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${myMusic.mname}</td>
							<td><a href="myListDelete?no=${myMusic.no}">삭제</a></td>
						</tr>
						</c:forEach>
					</table>
			</div>
		</aside>
		</c:if> --%>

		<section class="category-container">
			<div class="category-bar bold" title="종합">종합</div>
			<div class="category-bar" title="발라드">발라드</div>
			<div class="category-bar" title="힙합">힙합</div>
			<div class="category-bar" title="재즈">재즈</div>
			<div class="category-bar" title="R/B">R&B</div>
			<div class="category-bar" title="디스코">디스코</div>
			<div class="category-bar" title="락">락</div>
			<div class="category-bar" title="트로트">트로트</div>
			<div class="category-bar" title="일렉">일렉</div>
			<div class="category-bar" title="댄스">댄스</div>
		</section>

		<section class="search-container">
			<select name="rowsCount" id="rowsCount" style="width: 150px">
				<option value="10"
					${pageMaker.cri.rowsPerPage=='10' ? 'selected' : ''}>10개씩
					보기</option>
				<option value="50"
					${pageMaker.cri.rowsPerPage=='50' ? 'selected' : ''}>50개씩
					보기</option>
				<option value="100"
					${pageMaker.cri.rowsPerPage=='100' ? 'selected' : ''}>100개씩
					보기</option>
			</select>
			<!-- ===== SEARCH START ===== -->
			<!-- <form id="searchForm" action="searchMusic"> -->
			<select name="searchType" id="searchType">
				<option value="total"
					${pageMaker.cri.searchType=='total' ? 'selected' : ''}>전체</option>
				<option value="title"
					${pageMaker.cri.searchType=='title' ? 'selected' : ''}>제목</option>
				<option value="artist"
					${pageMaker.cri.searchType=='artist' ? 'selected' : ''}>가수</option>
				<option value="lyrics"
					${pageMaker.cri.searchType=='lyrics' ? 'selected' : ''}>가사</option>
			</select> <input type="text" name="keyword" id="keyword"> <input
				type="button" class="btn border" id="searchBtn" value="검색">
			<!-- </form> -->
		</section>
		<!-- ===== SEARCH END ===== -->

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
							<c:if test="${pageMaker.cri.rowsPerPage == 10 }">
								<td>${vs.count + pageMaker.cri.currPage * 10 - 10}</td>
							</c:if>
							<c:if test="${pageMaker.cri.rowsPerPage == 50 }">
								<td>${vs.count + pageMaker.cri.currPage * 50 - 50}</td>
							</c:if>
							<c:if test="${pageMaker.cri.rowsPerPage == 100 }">
								<td>${vs.count + pageMaker.cri.currPage * 100 - 100}</td>
							</c:if>
							
							<td><img class="hidden" alt="#" src="${music.imagefile}"><span class="mm">${music.mname}</span></td>
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
			
			<c:if test="${empty hidden}">
				<!-- Cri_Page -->
				<div class="paging-container">
					<!-- First, prev -->
					<c:choose>
						<c:when test="${pageMaker.prev && pageMaker.spageNo > 1}">
							<a href="musicCri${pageMaker.searchQuery(1)}"><img src="resources/icons/LeftArrow.jpg"></a>&nbsp; 
							<a href="musicCri${pageMaker.searchQuery(pageMaker.spageNo-1)}">&lt;</a>&nbsp;&nbsp;
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
							<a href="musicCri${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
						</c:if>
					</c:forEach>

					<!-- Next, Last -->
					<c:choose>
						<c:when test="${pageMaker.next && pageMaker.epageNo > 0}">
							<a href="musicCri${pageMaker.searchQuery(pageMaker.epageNo+1)}">&nbsp;&nbsp;&gt;</a>
							<a href="musicCri${pageMaker.searchQuery(pageMaker.lastPageNo)}">&nbsp;<img src="resources/icons/RightArrow.jpg"></a>
						</c:when>
						<c:otherwise>
							<font color="Gray">&nbsp;&nbsp;&gt;&nbsp;<img src="resources/icons/RightArrow.jpg"></font>
						</c:otherwise>
					</c:choose>
				</div>
			</c:if>

		</div>
	</main>
	<!-- main =============================================== -->

	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>