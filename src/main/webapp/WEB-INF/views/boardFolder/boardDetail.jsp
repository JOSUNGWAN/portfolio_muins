<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bordDetail</title>
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
	<br>
	<main class="main">
		<hr>
		<div class="container">
			<h2 class="writing-header">일반 게시판</h2>
			<c:if test="${not empty bselectone}">
				<div class="date">
					<span>${bselectone.regdate}</span>
				</div>
				<div class="board clear ">
					<div class="side">
						<span>${bselectone.id}</span>
						<div class="side fr">
							<span id="seq" hidden><b>${bselectone.seq}</b></span> 
							<span>조회수 <b>${bselectone.cnt}</b></span>
							<span>추천수 <b>${bselectone.vote}</b></span> 
							<span>댓글 <b>${rcount}</b></span>
						</div>
					</div>
				</div>

				<input class="title" name="title" type="text" value="${bselectone.title}"
					readonly="readonly">
				<br>
				<textarea name="content" rows="20" readonly="readonly">${bselectone.content}</textarea>
				<br>
				<a href="bcrilist" id="listBtn" class="btnf btn-list"><i class="fa fa-bars"></i> 목록</a>
				<c:if test="${loginID == bselectone.id || loginID == 'admin'}">
					<a href="boardDetail?jCode=U&seq=${bselectone.seq}" id="modifyBtn"
						class="btnf btn-modify"><i class="fa fa-edit"></i> 수정</a>
					<a onclick="bdeletealert(${bselectone.seq}, ${bselectone.root})"
						id="removeBtn" class="btnf btn-remove"><i class="fa fa-trash"></i>
						삭제</a>
				</c:if>
			</c:if>
			<c:if test="${loginID != bselectone.id}">
				<div class="vote">
					<c:if test="${vote == 'F'}">
						<img id="votebefore" src="resources/images/vote/votebefore.png"  
											 alt="#" onclick="bvoteUp(${bselectone.seq},'${bselectone.id}')">
					</c:if>
					<c:if test="${vote == 'T'}">
						<img id="voteafter" src="resources/images/vote/voteafter.png"  
											alt="#" onclick="bvoteDown(${bselectone.seq},'${bselectone.id}')">				
					</c:if>						
										
				</div>					
			</c:if>			
<script>
    $(document).ready(function(){
    	
        $("#votebefore").click(function(){
        	$("#votebefore").attr("src", "resources/images/vote/voteafter.png");
        });
        $("#voteafter").click(function(){
        	$("#voteafter").attr("src", "resources/images/vote/votebefore.png" );
        });
        
	});
</script>		
			<!-- ----댓글-------------------------------------------------- -->
			<div class="container_comment">
				<form id="commentForm" name="commentForm" action="brinsert"
					method="post">
					<br> <br>
					<div>
						<span><strong>Comments</strong></span> <span id="cCnt"></span>
					</div>
					<input name="id" value="${loginID}" hidden>
					<input id="seqid" name="seq" value="${bselectone.seq}" hidden>
					<input id="rnoid" name="rno" value="${replyListF.rno}" hidden>
					<textarea style="" "3" cols="30" id="comment" name="content"
						placeholder="댓글을 입력하세요(200자 이하)"></textarea>
					<br>
					<div class="reply-btn">
						<button type="button" class="btn pull-right btn-view" onclick="getReplyF(${bselectone.seq})"
							id="replyRegist">댓글보기</button>
						<button type="button" class="btn pull-right btn-success" onclick="insertReply(${bselectone.seq},'${loginID}')"
							id="replyRegist">등록</button>
					</div>
				</form>
			</div>
			<div id="replyf"></div>
		</div>
	</main>
</body>
<!-- main boardList =============================================== -->

	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>