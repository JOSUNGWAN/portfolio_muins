// slide show start ======
let slideIndex = 0;

let si = setInterval(function () {
	slideIndex += 1;
	showSlides(slideIndex);
}, 2000);

$('.slideshow-container').mouseenter(function () {
	clearInterval(si);
});

$('.slideshow-container').mouseleave(function () {
	si = setInterval(function () {
		slideIndex += 1;
		showSlides(slideIndex);
	}, 2000);
}); // slide
// slide show end ======

function plusSlides(n) {
	showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
	showSlides(slideIndex = n);
}

function showSlides(n) {
	let i;
	let slides = document.getElementsByClassName("mySlides");
	let dots = document.getElementsByClassName("dot");
	if (n > slides.length) { slideIndex = 1 }
	if (n < 1) { slideIndex = slides.length }
	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" active", "");
	}
	slides[slideIndex - 1].style.display = "block";
	dots[slideIndex - 1].className += " active";
}
showSlides(slideIndex);

// === EVENT SLIDE END ===

let themaBox_width = $('.thema-box').css("width").replace("px", "");
let themaBox_count = $('.thema-box');
function movePrev(n) {
	themaSlide(index = n);
}
function movePrev(n) {
	themaSlide(index = n);
}

// thema slide
let themaIndex = 0;

function themaMovePrev() {
	themaIndex -= 1;
	if (themaIndex < 0) themaIndex = themaBox_count.length - 2;
	moveThema(themaIndex);
}
function themaMoveNext() {
	themaIndex += 1;
	if (themaBox_count.length - 1 <= themaIndex) themaIndex = 0;
	moveThema(themaIndex);
}
function moveThema(i) {
	$('.thema2-container').css({ 'right': (themaBox_width * i) + 'px' })

}

// -- 결제시 로그인필요 알림창 --
$(function () {
	$('#pay_check_click').click(function () {
		alert('로그인후 이용하세요~');
		consol.log(1);
	});
});




