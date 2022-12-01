let idCheck = false;
let passwordCheck = false;
let password2Check = false;
let nameCheck = false;
let emailCheck = false;
let nicknameCheck = false;
let addressCheck = false;
let birthdateCheck = false;
let phoneCheck = false;
let emailAuthCheck = false;
let email_auth_cd = '';

function idDupCheck() {
	// 1) id 무결성 확인
	if (idCheck == false) idCheck = idCheck();
	else {
		// 2) 서버로 확인요청 -> 결과는 새창으로 처리
		let url = 'idDupCheck?id=' + $('#id').val();
		window.open(url, '_blank',
			'width=400,height=300,resizable=yes,scrollbars=yes,toolbar=no,menubar=yes');
	} //else
} //idDupCheck

$(function() {

	// ** id
	$('#id').focus();
	$('#id').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$('#password').focus();
		}
	}).focusout(function() {
		idCheck = idCheckjs();
	}); //id

	// ** password
	$('#password').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$('#password2').focus();
		}
	}).focusout(function() {
		passwordCheck = passwordCheckjs();
	}); // password

	// ** Password2
	$('#password2').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$('#name').focus();
		}
	}).focusout(function() {
		password2Check = password2Checkjs();
	}); //password2

	// ** Name
	$('#name').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$('#email').focus();
		}
	}).focusout(function() {
		nameCheck = nameCheckjs();
	});	//name

	// ** email
	$('#email').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$('#nickname').focus();
		}
	}).focusout(function() {
		emailCheck = emailCheckjs();
	});	//email

	// ** nickname
	$('#nickname').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$('#address').focus();
		}
	}).focusout(function() {
		nicknameCheck = nicknameCheckjs();
	});	// nickname

	// ** address
	$('#address').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$('#birthdate').focus();
		}
	}).focusout(function() {
		addressCheck = addressCheckjs();
	});	// nickname

	// ** birthdate
	$('#birthdate').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$('#phone').focus();
		}
	}).focusout(function() {
		birthdateCheck = birthdateCheckjs();
	});	// birthdate

	// ** Point : 실수
	$('#phone').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$('#submit').focus();
		}
	}).focusout(function() {
		phoneCheck = phoneCheckjs();
	});	//point
	// ** 입력값 무결성 점검 **	
	// 1) 전역변수 선언
	// 3) submit 판단 & 실행 :  JS submit
	
// email 인증 -----------------------------------------------------

	$("#emailCheck").click(function(){	     	 
		var email ='';
    	 if($('#selectemail').val() == 'directinput' ) {
    	 	email = $('#email').val()
    	 } else {
    		 email = $('#email').val() + $('#selectemail').val();
    	 
    	 }
    	 
    	 if(email == ''){
    	 	alert("이메일을 입력해주세요.");
    	 	return false;
    	 }
    	 
    	 $.ajax({
			type : "POST",
			url : "emailAuth",
			data : {email : email},
			success: function(data){
			if($('#email').val() != '') {
				alert("인증번호가 발송되었습니다.");
				email_auth_cd = data.code;
			}else{
				alert("E-mail을 정확히 입력해주세요~.");
			}
			},
			error: function(data){
				alert("메일 발송에 실패했습니다.");
			}
		}); 
	});
	
	$("#email_auth_key").click(function(){
		if($('#checkno').val() != email_auth_cd) {
			alert("인증번호가 일치하지 않습니다.");
		} else if($('#checkno').val() == '' ) {
			alert("인증번호가 일치하지 않습니다.");
		} else {
			alert("인증완료.");
			$(this).attr('disabled',true);
			$(this).css('background-color','gray');
			$('#emailCheck').attr('disabled',true);
			$('#emailCheck').css('background-color','gray');
			emailAuthCheck = true;
			
		}
	});
	
// email 인증 -----------------------------------------------------

}); //ready


function inCheck() {
	if (idCheck == false) { $('#idmessage').html(' id를 확인하세요 !!'); }
	if (passwordCheck == false) { $('#passwordmessage').html(' Password를 확인하세요 !!'); }
	if (password2Check == false) { $('#password2message').html(' Password2를 확인하세요 !!'); }
	if (nameCheck == false) { $('#namemessage').html(' Name을 확인하세요 !!'); }
	if (emailCheck == false) { $('#emailmessage').html(' E-Mail을 확인하세요 !!'); }
	if (nicknameCheck == false) { $('#nicknamemessage').html(' Nick-Name을 확인하세요 !!'); }
	if (birthdateCheck == false) { $('#birthdatemessage').html(' Birth-Day를 확인하세요 !!'); }
	if (phoneCheck == false) { $('#phonemessage').html(' Phone-Number를 확인하세요 !!'); }
	if (emailAuthCheck == false) { $('#emailmessage').html(' E-Mail인증은 필수 입니다 !!'); }
	

	if (idCheck && passwordCheck && password2Check && nameCheck &&
		emailCheck && nicknameCheck && birthdateCheck && phoneCheck && emailAuthCheck) {
		// => submit 확인
		if (confirm("~~ 정말 가입 하십니까 ? (Yes:확인 / No:취소)") == false) {
			alert('~~ 가입이 취소 되었습니다 ~~');
			return false;
		} else return true; // submit 진행  
	} else return false;
} //inCheck

function idCheckjs() {
	let id = $('#id').val();
	if (id.length < 4 || id.length > 10) {
		$('#idmessage').html(' ID 길이는 4 ~ 10 입니다. !! ');
		return false;
	} else if (id.replace(/[a-z.0-9]/gi, '').length > 0) {
		$('#idmessage').html(' ID는 영문자,숫자 로만 입력하세요. !! ');
		return false;
	} else {
		$('#idmessage').html('');
		return true;
	}
} //idCheck

function passwordCheckjs() {
	let password = $('#password').val();
	if (password.length < 8 || password.length > 16) {
		$('#passwordmessage').html(' Password 길이는 8~15자 입니다. !! ');
		return false;
	} else if (password.replace(/[!-*.@]/gi, '').length >= password.length) {
		// 비교 : replace(/[!.@.#.$.%.^.&.*]/gi ,'')
		$('#passwordmessage').html(' Password 에는 특수문자가 반드시 포함 되어야 합니다. !!');
		return false;
	} else if (password.replace(/[a-z.0-9.!-*.@]/gi, '').length > 0) {
		$('#passwordmessage').html(' Password 는 영문자, 숫자, 특수문자 로만 입력하세요. !!');
		return false;
	} else {
		$('#passwordmessage').html('');
		return true;
	}
} //pwCheck

function password2Checkjs() {
	let password = $('#password').val();
	let password2 = $('#password2').val();
	if (password != password2) {
		$('#password2message').html(' Password 가 다릅니다. !!');
		return false;
	} else {
		$('#password2message').html('');
		return true;
	}
} //pw2Check

function nameCheckjs() {
	let name = $('#name').val();
	if (name.length < 2) {
		$('#namemessage').html(' Name 길이는 2 이상 입니다. !! ');
		return false;
	} else if (name.replace(/[a-z.가-힣]/gi, '').length > 0) {
		$('#namemessage').html('  Name은 영문, 한글만 입력 가능 합니다. !!');
		return false;
	} else {
		$('#namemessage').html('');
		return true;
	}
} //nmCheck

function emailCheckjs() {
	let email = $('#email').val();
	if (email.length < 3) {
		$('#emailmessage').html('email을 입력 하세요. !! ');
		return false;
	} else {
		$('#emailMessage').html('');
		return true;
	}
} //info

function nicknameCheckjs() {
	let nickname = $('#nickname').val();
	if (nickname.length < 8 || nickname.length > 15) {
		$('#nicknamemessage').html(' nickname 길이는 8 ~ 15 입니다. !! ');
		return false;
	} else if (nickname.replace(/[a-z.0-9]/gi, '').length > 0) {
		$('#nicknamemessage').html(' Nick-Name은 영문자,숫자 로만 입력하세요. !! ');
		return false;
	} else {
		$('#nicknamemessage').html('');
		return true;
	}
} //bdCheck

function addressCheckjs() {
	let address = $('#address').val();
	if (address.length < 1) {
		$('#addressmessage').html('address를 입력 해 주세요');
		return false;
	} else {
		$('#addressmessage').html('');
		return true;
	}
} //bdCheck

function birthdateCheckjs() {
	let birthdate = $('#birthdate').val();
	if (birthdate.length != 8) {
		$('#birthdatemessage').html(' 생년월일을 정확하게 입력 하세요(yyyymmdd)');
		return false;
	} else {
		$('#birthdatemessage').html('');
		return true;
	}
} //bdCheck

// ** Age : 정수
function phoneCheckjs() {
	let phone = $('#phone').val();
	if ($.isNumeric(phone) == false || phone.replace(/[.]/g, '').length < phone.length) {
		$('#phonemessage').html(' 숫자만 입력해 주세요');
		return false;
	} else {
		$('#phonemessage').html('');
		return true;
	}
} //ptCheck




