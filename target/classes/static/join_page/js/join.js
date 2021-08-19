$(function() {
	var isCertification = false;
	var key = "";
	$("#sendMail").click(function () {// 메일 입력 유효성 검사
		var email = $("#email").val(); // 사용자의 이메일 입력값.

		if (email == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		} else {
			// email = email + "@" + $(".domain").val(); // 셀렉트 박스에 @뒤 값들을 더함.
			$.ajax({
				type: 'post',
				url: '/CheckMail',
				dataType: 'json',
				async: "false",
				data: {
					email: email
				},
				success: function (data) {
					console.log(data.key);
					key = data;
				}
			});
			alert("이메일을 확인하시기 바랍니다.");
			$(".compare").css("display", "block");
			$(".compare-text").css("display", "block");
		}
	});



	$(".compare").on("propertychange change keyup paste input", function() {
		if ($(".compare").val() == key) {
			$(".compare-text").text("인증 성공!").css("color", "black");
			isCertification = true;
		} else {
			$(".compare-text").text("불일치!").css("color", "red");
			isCertification = false;
		}
	});


	$("#submit-btn").click(function(){
		if(isCertification==false){ //인증이 완료되지 않았다면
			alert("메일 인증이 완료되지 않았습니다.");
		}
	});


});


//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 이름 정규식
	var nicknameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var telJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
// 이름에 특수문자 들어가지 않도록 설정
	$("#nickname").blur(function() {
		if (nameJ.test($(this).val())) {
				console.log(nicknameJ.test($(this).val()));
				$("#nickname_check").text('');
		} else {
			$('#nickname_check').text('이름을 확인해주세요');
			$('#nickname_check').css('color', 'red');
		}
	});
	
	
	// 휴대전화
	$('#tel').blur(function(){
		if(telJ.test($(this).val())){
			console.log(nicknameJ.test($(this).val()));
			$("#tel_check").text('');
		} else {
			$('#tel_check').text('휴대폰번호를 확인해주세요 :)');
			$('#tel_check').css('color', 'red');
		}
	});
// 가입하기 실행 버튼 유효성 검사!
	var inval_Arr = new Array(5).fill(false);
	$('#submit-update').click(function(){
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#pw').val() == ($('#pw2').val()))
				&& pwJ.test($('#pw').val())) {
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
		}
		
		// 이름 정규식
		if (nicknameJ.test($('#nickname').val())) {
			inval_Arr[1] = true;	
		} else {
			inval_Arr[1] = false;
		}
		
		// 휴대폰번호 정규식
		if (telJ.test($('#tel').val())) {
			console.log(telJ.test($('#tel').val()));
			inval_Arr[3] = true;
		} else {
			inval_Arr[3] = false;
		}
	});
//	$("#submit-delete").click(function(){
//		if(isCertification==false){ //인증이 완료되지 않았다면
//			alert("메일 인증이 완료되지 않았습니다.");
//		}
//	});
	
	$("#submit-delete").click(function(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }else{
            	alert("탈퇴가 완료되었습니다");
            	}
        });


	
