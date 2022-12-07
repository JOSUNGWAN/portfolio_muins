<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>pdbordDetail</title>
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
			<h2 class="writing-header">작곡 게시판</h2>
			<c:if test="${not empty pdbselectone}">
				<div class="date">
					<span>${pdbselectone.regdate}</span>
				</div>
				<div class="board clear ">
					<div class="side">
						<a href="">${pdbselectone.id}</a>
						<div class="side fr">
							<span hidden><b>${pdbselectone.seq}</b></span> 
							<span>조회수 <b>${pdbselectone.cnt}</b></span>
							<span>추천수 <b>${pdbselectone.vote}</b></span> 
							<span>댓글 <b>${rcount}</b></span>
						</div>
					</div>
				</div>
				<div class="pdlisten">
					<c:if test="${not empty pdbselectone.uploadfile}">
						<table class="pdmusic-table">
							<tr>
								<th>곡번호</th>
								<th>곡명</th>
								<th>작곡가</th>
								<th>듣기</th>
							</tr>
							<tr>
								<td class="listentitleColor">${pdbselectone.seq}</td>
								<td><span class="listentitle">${pdbselectone.uploadfile}</span></td>
								<td class="listentitleColor">${pdbselectone.id}</td>
							<c:if test="${userGrade=='프리미엄'}">
			                     <td>
			                     <span onclick="playMusic2(${pdbselectone.seq})" title="${pdbselectone.uploadfile}">
			                     <img   alt="듣기" src="resources/icons/play-button2.png"></span>
			                     </td>
			                </c:if>
			                <c:if test="${userGrade!='프리미엄'}">
			                     <td>
			                     <span title="${pdbselectone.uploadfile}">
			                     <img   alt="듣기" src="resources/icons/play-button2.png"></span>
			                     </td>
		                    </c:if>
							</tr>
						</table>
					</c:if>
				</div>
				<textarea name="content" rows="20" readonly="readonly">${pdbselectone.content}</textarea>
				<br>
				<a href="pdbcrilist" id="listBtn" class="btnf btn-list"><i
					class="fa fa-bars"></i> 목록</a>
				<c:if test="${loginID == pdbselectone.id || loginID == 'admin'}">
					<a href="pdboardDetail?jCode=U&seq=${pdbselectone.seq}"
						id="modifyBtn" class="btnf btn-modify"><i class="fa fa-edit"></i>
						수정</a>
					<a onclick="pdbdeletealert(${pdbselectone.seq},${pdbselectone.root})"
						id="removeBtn" class="btnf btn-remove"><i class="fa fa-trash"></i>
						삭제</a>
				</c:if>
			</c:if>
			<c:if test="${loginID != pdbselectone.id}">
				<div class="vote">
					<c:if test="${vote == 'F'}">
						<img id="votebefore" src="resources/images/vote/votebefore.png"
											 alt="#" onclick="pdbvoteUp(${pdbselectone.seq},'${pdbselectone.id}')">
					</c:if>	
					<c:if test="${vote == 'T'}">					
						<img id="voteafter" src="resources/images/vote/voteafter.png" 
											alt="#" onclick="pdbvoteDown(${pdbselectone.seq},'${pdbselectone.id}')">
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
				<form id="commentForm" name="commentForm" action="pdbrinsert"
					method="post">
					<br> <br>
					<div>
						<span><strong>Comments</strong></span> <span id="cCnt"></span>
					</div>
					<input name="id" value="${loginID}" hidden> 
					<input id="pseqid" name="seq" value="${pdbselectone.seq}" hidden>
					<input id="prnoid" name="rno" value="${pdreplyListF.rno}" hidden>
					<textarea style="" "3" cols="30" id="comment" name="content"
						placeholder="댓글을 입력하세요(200자 이하)"></textarea>
					<br>
					<div class="reply-btn">
						<button type="button" class="btn pull-right btn-view" onclick="getpdReplyF(${pdbselectone.seq})"
							id="replyRegist">댓글보기</button>
						<button type="button" class="btn pull-right btn-success" onclick="pdinsertReply(${pdbselectone.seq},'${loginID}')"
							id="replyRegist">등록</button>
					</div>
				</form>
			</div>
			<div id="pdreplyf"></div>
		</div>
	</main>
</body>
<!-- main boardList =============================================== -->

	<!-- footer =============================================== -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />	
	<!-- footer =============================================== -->

</body>
</html>