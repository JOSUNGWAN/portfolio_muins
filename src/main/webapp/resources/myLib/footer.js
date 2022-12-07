// play Music 
const STR1 = "resources/music/";
let STR2;
const STR3 = ".mp3"
let curTimer;

let playListUl = document.getElementById('playList-ul');
let playListInput = playListUl.getElementsByTagName('input');

let musicIndex = 0;
const curAudio = document.querySelector('audio');

function playMusic(no) {
	$.ajax({
		type: 'Get',
		url: 'selectMusic',
		data: {
			music_code: no
		},
		success: function(resultData) {
			// aside
			$('.aside-title').html(resultData.vo.mname);
			$('.aside-artist').html(resultData.vo.aname);
			$('#aside-lyrics').html(resultData.vo.lyrics);
			$('.aside-image img').attr("src", resultData.vo.imagefile);
			// footer	
			$('#footer-img>img').attr("src", resultData.vo.imagefile);
			$('#footer-title').html(resultData.vo.mname);
			$('#current-audio').attr("src", STR1 + resultData.vo.mname + STR3);
			curAudio.currentTime = 0;
			curAudio.play();
		}, error: function() {
			console.log("실패");
		}
	}); // ajax_playMusic
	
			$.ajax({
			type: 'get',
			url: 'musicCountUp',
			data: {
				music_code: no
			}
		}); // ajax_musicCountUp
} // playMusic

const STR5 = "resources/userMusicFile/";
const STR6 = "/";

function playMusic2(no) {
	console.log(no);
	$.ajax({
		type: 'Get',
		url: 'pdselectMusic',
		data: {
			seq: no
		},
		success: function(resultData) {
			$('#footer-title').html(resultData.vo.uploadfile);
			$('#footer-audio audio').attr("src",STR5 + resultData.vo.id + STR6 + resultData.vo.uploadfile);
			curAudio.currentTime = 0;
			curAudio.play();
		}, error: function() {
			console.log("실패");
		}
	});
}

function myList(no) {
	$.ajax({
		type: 'get',
		url: 'myList',
		data: {
			music_code: no
		}
	}); // ajax
} // myList

function playList(no) {
	$.ajax({
		type: 'get',
		url: 'playList',
		data: {
			music_code: no
		}, success: function() {
			$('#footer-up').removeClass('hidden');
		}
	}); // ajax
} // myList

function setIndex(no) {
	musicIndex = no - 1;
	curAudio.src = STR1 + playListInput[musicIndex].value + STR3;
	curAudio.play();
} // musicIndex


$(function() {
	$('#footer-icon').click(function() {
		$('#footer-up').toggleClass('hidden')
	}); // click

	$('main').click(function() {
		$('#footer-up').addClass('hidden')
	}); // click


	curAudio.addEventListener("ended", function() {
		musicIndex += 1;
		if (musicIndex > playListInput.length - 1) musicIndex = 0;
		curAudio.src = STR1 + playListInput[musicIndex].value + STR3;
		curAudio.play();
	}); // ended

	curAudio.addEventListener("timeupdate", function() {
		curTimer = curAudio.currentTime;
	}); // ended
	
}); // ready