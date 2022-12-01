let l_window_width = $(window).width();

$(window).resize(() => {
	l_window_width = $(window).width();

	if (l_window_width < 1300) {
		$('aside').addClass('hidden');
	} else {
		$('aside').removeClass('hidden');
	}
}); // window resize event

/* 초기 한번 확인 */
$(function() {
	l_window_width = $(window).width();
	if (l_window_width < 1300) {
		$('aside').addClass('hidden');
	} else {
		$('aside').removeClass('hidden');
	}
}); // ready

// SearchType 이 '전체' 면 keyword 클리어
$('#searchType').change(function() {
	if ($(this).val() == 'total') $('#keyword').val('');
}); // change

$('#rowsCount').change(function() {
	self.location = "musicCri"
		+ "?rowsPerPage="
		+ $('#rowsCount').val()
		+ "&searchType="
		+ $('#searchType').val()
		+ "&keyword="
		+ $('#keyword').val()
}); // change

$('.category-bar').click(function() {
	self.location = "musicCri"
		+ "?rowsPerPage="
		+ $('#rowsCount').val()
		+ "&searchType="
		+ $('#searchType').val()
		+ "&keyword="
		+ $('#keyword').val()
		+ "&category="
		+ $(this).attr("title");
		console.log($(this).attr("title"));
}); // click

// 검색 후 요청 
$('#searchBtn').click(function() {
	self.location = "searchMusic"
		+ "?rowsPerPage="
		+ $('#rowsCount').val()
		+ "&searchType="
		+ $('#searchType').val()
		+ "&keyword="
		+ $('#keyword').val();
}); //click

window.onload = function() {
    let a = document.getElementsByClassName("aaa");
    let b = document.getElementsByClassName("bbb");
    
    let i;
	for(let i =0; i < a.length; i++){
    	b[i].addEventListener("click", function(){
    		let cur = a[i];
    		a[i].classList.remove('hidden');
    		
    		setTimeout(() => {
    			cur.classList.add("hidden");
    			
			}, 2000);
    		
    		});//click
    	} // for
} // onload

// function =======================================================
function setIndex(no) {
	musicIndex = no - 1;
	curAudio.src = STR1 + playListInput[musicIndex].value + STR3;
	curAudio.play();
} // musicIndex
