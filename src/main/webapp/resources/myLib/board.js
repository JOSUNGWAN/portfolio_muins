
// 일반 게시판 삭제 경고 ----------------------------------------------------

function bdeletealert(seq, root) {
	if (confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'Get',
			url: 'bdelete?'+'seq'+ '='+ seq +'&'+'root'+'='+root,
			success: function(resultData) {
					console.log("삭제 성공");
					location.href='bcrilist';
				}, error: function() {
					console.log("삭제 실패");
				}
		});
	}
}
function pdbdeletealert(seq, root) {
	if (confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'Get',
			url: 'pdbdelete?'+'seq'+ '='+ seq +'&'+'root'+'='+root,
			success: function(resultData) {
					console.log("삭제 성공");
					location.href='pdbcrilist';
				}, error: function() {
					console.log("삭제 실패");
				}
		});
	}
}



// 추천수 증가 ----------------------------------------------------

function bvoteUp(no,id) {
	$.ajax({
		type: 'Get',
		url: 'bvoteUp',
		data: {
			seq: no,
			id: id
		},
		success: function(resultData) {
				console.log("추천 성공");
			}, error: function() {
				console.log("추천 실패");
			}
	}); // ajax
		
// -- 추천테이블 증가 --	
	$.ajax({
		type: 'Get',
		url: 'bvoteTableUp',
		data: {
			boardseq: no,
		},
		success: function(resultData) {
				console.log("추천저장 성공");
			}, error: function() {
				console.log("추천저장 실패");
			}
	}); // ajax
// -- 추천테이블 증가 --
}

function pdbvoteUp(no,id) {
	$.ajax({
		type: 'Get',
		url: 'pdbvoteUp',
		data: {
			seq: no,
			id: id
		},
		success: function(resultData) {
				console.log("추천 성공");
			}, error: function() {
				console.log("추천 실패");
			}
	}); // ajax
		
// -- 추천테이블 증가 --	
	$.ajax({
		type: 'Get',
		url: 'pdbvoteTableUp',
		data: {
			boardseq: no,
		},
		success: function(resultData) {
				console.log("추천저장 성공");
			}, error: function() {
				console.log("추천저장 실패");
			}
	}); // ajax
// -- 추천테이블 증가 --			
		
}
		
// 추천수 증가 ----------------------------------------------------

// 추천수 감소 ----------------------------------------------------

function bvoteDown(no,id) {
	$.ajax({
		type: 'Get',
		url: 'bvoteDown',
		data: {
			seq: no,
			id: id
		},
		success: function(resultData) {
				console.log("추천취소 성공");
			}, error: function() {
				console.log("추천 실패");
			}
	}); // ajax
		
// -- 추천테이블 감소 --		
	$.ajax({
		type: 'Get',
		url: 'bvoteTableDown',
		data: {
			boardseq: no,
		},
		success: function(resultData) {
				console.log("추천저장 성공");
			}, error: function() {
				console.log("추천저장 실패");
			}
	}); // ajax
// -- 추천테이블 감소 --	
}

function pdbvoteDown(no,id) {
	$.ajax({
		type: 'Get',
		url: 'pdbvoteDown',
		data: {
			seq: no,
			id: id
		},
		success: function(resultData) {
				console.log("추천취소 성공");
			}, error: function() {
				console.log("추천 실패");
			}
	}); // ajax

// -- 추천테이블 감소 --		
	$.ajax({
		type: 'Get',
		url: 'pdbvoteTableDown',
		data: {
			boardseq: no,
		},
		success: function(resultData) {
				console.log("추천저장 성공");
			}, error: function() {
				console.log("추천저장 실패");
			}
	}); // ajax
// -- 추천테이블 감소 --			
		
}

// 추천수 감소 ----------------------------------------------------

// 일반게시판 댓글 목록 ----------------------------------------------

function getReplyF() {
	let seq = $('#seqid').val();
	$.ajax({
		type: 'post',
		url: 'breplyf',
		data:{
			seq:seq
		},
		success:function(resultpage){
			$('#replyf').html(resultpage);
		}, error:function(resultpage){
			$('#replyf').html('서버오류');
		}
	});
}
// 일반게시판 댓글 목록 ----------------------------------------------

// 일반 게시판 댓글 입력 ---------------------------------------------

function insertReply(seq,id) {
	let content = $('#comment').val();
	
	if(content.length >200) {
		alert('200자 이하로 작성해주세요~');
		
	} else {
		$.ajax({
			type: 'post',
			url: 'brinsert',
			data:{
				seq:seq,
				id:id,
				content
			},
			success:function(resultpage){
				getReplyF(seq);
				$('#comment').val('');
				console.log('입력성공');	
			}, error:function(resultpage){
				console.log('실패');	
			}
		});
	}
}

// 일반 게시판 댓글 입력 ---------------------------------------------

// 일반 게시판 댓글 수정 ---------------------------------------------

function replyupdate(rno) {
	let seq = $('#sequpdate').val();
	let content = $('#replyupdate').val();
	$.ajax({
		type: 'post',
		url: 'brupdate',
		data:{
			seq:seq,
			rno:rno,
			content:content
		},
		success:function(resultpage){
			getReplyF(seq)
			console.log('수정성공');	
		}, error:function(resultpage){
			console.log('수정실패');	
		}
	});
}
function replyupdatec(seq,rno,rnonext,content) {
	$.ajax({
		type: 'post',
		data:{
			seq:seq
		},
		success:function(resultpage){
		$('#'+rno).html(
		'<a onclick="replyupdate('+ rno +')" id="modifyBtn" class="btnf btn-modify">'
		+'<span class="fa fa-edit"></span>확인</a>'
		+'<a onclick="getReplyF()" id="modifyBtn" class="btnf btn-modify">'
		+'<span class="fa fa-edit"></span>취소</a>'
		+'<textarea style="height: 40px; width: 760px" id="replyupdate">'+content+'</textarea>'
		);
		$('#'+rnonext).html('');
		}, error:function(resultpage){
			console.log('취소실패');	
		}
	});
}

// 일반 게시판 댓글 수정 ---------------------------------------------

// 일반 게시판 댓글 삭제 ---------------------------------------------

function deleteReply(seq,rno) {
	if (confirm("정말 삭제하시겠습니까?")){	 
		$.ajax({
			type: 'post',
			url: 'brdelete',
			data:{
				seq:seq,
				rno:rno
			},
			success:function(resultpage){
				getReplyF(seq)
				console.log('삭제성공');	
			}, error:function(resultpage){
				console.log('삭제실패');	
			}
		});
	}
}

// 일반 게시판 댓글 삭제 ---------------------------------------------

// 작곡게시판 댓글 목록 ----------------------------------------------

function getpdReplyF() {
let seq = $('#pseqid').val();
	$.ajax({
		type: 'post',
		url: 'pdbreplyf',
		data:{
			seq:seq
		},
		success:function(resultpage){
			$('#pdreplyf').html(resultpage);
		}, error:function(resultpage){
			$('#pdreplyf').html('서버오류');
		}
	});
}

// 작곡게시판 댓글 목록 ----------------------------------------------

// 작곡 게시판 댓글 입력 ---------------------------------------------

function pdinsertReply(seq,id) {

	let content = $('#comment').val();
		
	if(content.length >200) {
		alert('200자 이하로 작성해주세요~');			
	} else {
		$.ajax({
			type: 'post',
			url: 'pdbrinsert',
			data:{
				seq:seq,
				id:id,
				content
			},
			success:function(resultpage){
				getpdReplyF(seq)
				$('#comment').val('');
				console.log('입력성공');	
			}, error:function(resultpage){
				console.log('실패');	
			}
		});
	}
}

// 작곡 게시판 댓글 입력 ---------------------------------------------

// 작곡 게시판 댓글 수정 ---------------------------------------------

function pdreplyupdate(rno) {
	let seq = $('#pdsequpdate').val();
	let content = $('#pdreplyupdate').val();
	$.ajax({
		type: 'post',
		url: 'pdbrupdate',
		data:{
			seq:seq,
			rno:rno,
			content:content
		},
		success:function(resultpage){
			getpdReplyF(seq)
			console.log('수정성공');	
		}, error:function(resultpage){
			console.log('수정실패');	
		}
	});
}

function pdreplyupdatec(seq,rno,rnonext,content) {
	$.ajax({
		type: 'post',
		data:{
			seq:seq
		},
		success:function(resultpage){
		
		$('#'+rno).html(
		'<a onclick="pdreplyupdate('+ rno +')" id="modifyBtn" class="btnf btn-modify">'
		+'<span class="fa fa-edit"></span>확인</a>'
		+'<a onclick="getpdReplyF()" id="modifyBtn" class="btnf btn-modify">'
		+'<span class="fa fa-edit"></span>취소</a>'
		+'<textarea style="height: 40px; width: 760px" id="pdreplyupdate">'+content+'</textarea>'
		);
		$('#'+rnonext).html('');
		}, error:function(resultpage){
			console.log('취소실패');	
		}
	});
}

// 작곡 게시판 댓글 수정 ---------------------------------------------

// 작곡 게시판 댓글 삭제 ---------------------------------------------

function deletepdReply(seq,rno) {
	if (confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'post',
			url: 'pdbrdelete',
			data:{
				seq:seq,
				rno:rno,
			},
			success:function(resultpage){
				getpdReplyF(seq)
				console.log('삭제성공');	
			}, error:function(resultpage){
				console.log('삭제실패');	
			}
		});
	}
}

// 작곡 게시판 댓글 삭제 ---------------------------------------------


// 일반 게시판 대댓글 입력 ---------------------------------------------

function rereplyinsert(rno_next,step,indent,root,id) {
	let seq = $('#sequpdate').val();
	let content = $('.'+rno_next).val();
	$.ajax({
		type: 'post',
		url: 'brreinsert',
		data:{
			seq:seq,
			root:root,
			step:step,
			indent:indent,
			id:id,
			content:content
		},
		success:function(resultpage){
			getReplyF(seq)
			console.log('대댓글 입력성공');	
		}, error:function(resultpage){
			console.log('대댓글 입력성공');	
		}
	});
}

// 일반 게시판 대댓글 입력 ---------------------------------------------

// 작곡 게시판 대댓글 입력 ---------------------------------------------

function pdrereplyinsert(rno_next,step,indent,root,id) {
	let seq = $('#pdsequpdate').val();
	let content = $('.'+rno_next).val();
	$.ajax({
		type: 'post',
		url: 'pdbrreinsert',
		data:{
			seq:seq,
			root:root,
			step:step,
			indent:indent,
			id:id,
			content:content
		},
		success:function(resultpage){
			getpdReplyF(seq)
			console.log('대댓글 입력성공');	
		}, error:function(resultpage){
			console.log('대댓글 입력성공');	
		}
	});
}

// 작곡 게시판 대댓글 입력 ---------------------------------------------

// 관리자 삭제 -----------------------------------------------------

function adminbdelet(seq, root) {
	if (confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'Get',
			url: 'adminBdelete?'+'seq'+ '='+ seq +'&'+'root'+'='+root,
			success: function(resultData) {
					console.log("삭제 성공");
					location.href='adminBcrilist';
				}, error: function() {
					console.log("삭제 실패");
				}
		});
	}
}

function adminpdbdelet(seq, root) {
	if (confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'Get',
			url: 'adminpdBdelete?'+'seq'+ '='+ seq +'&'+'root'+'='+root,
			success: function(resultData) {
					console.log("삭제 성공");
					location.href='adminpdBcrilist';
				}, error: function() {
					console.log("삭제 실패");
				}
		});
	}
}
// 관리자 삭제 -----------------------------------------------------


// -- 버튼 뒤로가기 --
function goBack() {
    window.history.back();
}


$(function(){
	$('.aaa').click(function(){
		$(this).parents('.bbb').children('.ccc').toggleClass('hidden');
	});	
});

	
