// ===== NAV 숨기기 =====
$(window).resize(() => {
let n_window_width = $(window).width();
    if (n_window_width < 810) {
        $('nav').addClass('hidden');
		$('#menu-icon2 img').removeClass('hidden');
    } else {
        $('nav').removeClass('hidden');
		$('#menu-icon2 img').addClass('hidden');
    }
});

$(function() {
let n_window_width = $(window).width();
    if (n_window_width < 810) {
        $('nav').addClass('hidden');
		$('#menu-icon2 img').removeClass('hidden');
    } else {
        $('nav').removeClass('hidden');
		$('#menu-icon2 img').addClass('hidden');
    }
});

// ===== NAV 숨기기 =====

$(function() {
	$('main').click(function() {
		$('#myDropdown').addClass('hidden');
	}); // click
	
	$('header').click(function() {
		$('#myDropdown').addClass('hidden');
	}); // click

	$('#dropbutton').click(function() {
		$('#myDropdown').toggleClass('hidden');
	}); // click
	
	$('#menu-icon2').click(function() {
		$('#menu-icon2-drop').toggleClass('hidden');
	}); // click
}); // ready


