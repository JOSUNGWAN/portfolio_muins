<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/myLib/main.css">
<link rel="stylesheet" href="resources/myLib/board.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script defer src="resources/myLib/board.js"></script>
</head>
<body>
<div class="container_comment">
<br><br>
	<div>
		<span><strong>Comments</strong></span> <span id="cCnt"></span>
	</div>
		<table class="table">
			<tr>
				<td class="replycolor">
					<!-- Comments Form -->
					<div id="reply">
						<c:forEach items="${pdreplyListF}" var="pdreplyListF">
						<input id="pdsequpdate" name="seq" value="${pdreplyListF.seq}" hidden>
						<input id="pdrnoupdate" name="rno" value="${pdreplyListF.rno}" hidden>
							<li class="bbb" id="replyfont">
							<span>${pdreplyListF.id}</span>
								<div class="replydate">
									<span>${pdreplyListF.regdate}</span>
									<div id="${pdreplyListF.rno_next}" class="pdreplybtnbox">
										<c:if test="${loginID == pdreplyListF.id || loginID == 'admin'}">
											<a onclick="pdreplyupdatec(${pdreplyListF.seq},${pdreplyListF.rno},${pdreplyListF.rno_next},'${pdreplyListF.content}')" id="modifyBtn"
													class="btnf btn-modify">
												<span class="fa fa-edit"></span>수정
											</a>
											<a onclick="deletepdReply(${pdreplyListF.seq},${pdreplyListF.rno})" id="modifyBtn" class="btnf btn-modify">
												<span class="fa fa-edit"></span>삭제
											</a>
										</c:if>
										<c:if test="${loginID != pdreplyListF.id}">
											<a id="modifyBtnr" class="btnf btn-modify aaa">
												<span class="fa fa-edit"></span>댓글
											</a><br>
										</c:if>
									</div>
								</div>
								<c:if test="${pdreplyListF.indent > 0}">
									<c:forEach begin="1" end="${pdreplyListF.indent}">
										<span>&nbsp;&nbsp;&nbsp;</span>
									</c:forEach>
									<img src="resources/icons/replyimge.jpg">
								</c:if>
								<span id="${pdreplyListF.rno}" class="replycontent">${pdreplyListF.content}</span>
								<div id="rereply" class="ccc hidden">
									<a onclick="pdrereplyinsert(${pdreplyListF.rno_next},${pdreplyListF.step},${pdreplyListF.indent},${pdreplyListF.root},'${loginID}')" id="remodifyBtn" class="btnf btn-modify">
									<span class="fa fa-edit"></span>확인</a>
									<a onclick="getpdReplyF()" id="modifyBtn" class="btnf btn-modify">
									<span class="fa fa-edit"></span>취소</a>
									<textarea style="height: 40px" class="${pdreplyListF.rno_next}"></textarea>
								</div>
							</li>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>