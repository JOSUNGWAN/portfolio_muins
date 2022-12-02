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
						<c:forEach items="${replyListF}" var="replyListF">
							<input id="sequpdate" name="seq" value="${replyListF.seq}" hidden>
							<input id="rnoupdate" name="rno" value="${replyListF.rno}" hidden>
							<li class="bbb" id="replyfont">
								<span>${replyListF.id}</span>
								<div class="replydate">
									<span>${replyListF.regdate}</span>
									<div id="${replyListF.rno_next}" class="replybtnbox">
										<c:if test="${loginID == replyListF.id || loginID == 'admin'}">
											<a onclick="replyupdatec(${replyListF.seq},${replyListF.rno},${replyListF.rno_next},'${replyListF.content}')" id="modifyBtn"
													class="btnf btn-modify">
												<span class="fa fa-edit"></span>수정
											</a>
											<a onclick="deleteReply(${replyListF.seq},${replyListF.rno})" id="modifyBtn" class="btnf btn-modify">
												<span class="fa fa-edit"></span>삭제
											</a>
										</c:if>
										<c:if test="${loginID != replyListF.id}">
											<a id="modifyBtnr" class="btnf btn-modify aaa">
												<span class="fa fa-edit">댓글</span>
											</a><br>
										</c:if>
									</div>
								</div>
								<c:if test="${replyListF.indent > 0}">
									<c:forEach begin="1" end="${replyListF.indent}">
										<span>&nbsp;&nbsp;&nbsp;</span>
									</c:forEach>
									<img src="resources/icons/replyimge.jpg">
								</c:if>
								<span id="${replyListF.rno}" class="replycontent">${replyListF.content}</span>
								<div id="rereply" class="ccc hidden">
									<a onclick="rereplyinsert(${replyListF.rno_next},${replyListF.step},${replyListF.indent},${replyListF.root},'${loginID}')" id="remodifyBtn" class="btnf btn-modify">
									<span class="fa fa-edit"></span>확인</a>
									<a onclick="getReplyF()" id="modifyBtn" class="btnf btn-modify">
									<span class="fa fa-edit"></span>취소</a>
									<textarea style="height: 40px" class="${replyListF.rno_next}"></textarea>
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