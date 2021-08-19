$(function() {

	var member_id= "";
	$("#sendMail").click(function () {// 메일 입력 유효성 검사
		var email = $("#email").val(); // 사용자의 이메일 입력값.

		if (email == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		} else {
			//email = email + "@" + $(".domain").val(); // 셀렉트 박스에 @뒤 값들을 더함.
			$.ajax({
				type: 'post',
				url: '/FindId',
				dataType: 'json',
				async: "false",
				data: {
					email: email
				},
				success: function (data) {
					console.log(data);
					member_id = data;
				}
			});
			alert("이메일을 확인하시기 바랍니다.");
		}
	});

});
//
// 	$(".compare").on("propertychange change keyup paste input", function () {
// 		if ($(".compare").val() == key) {
// 			$("#compare-text").text("인증에 성공했습니다.")
// 			$("#compare-text").css("color", "#2AC1BC");
// 			isCertification = true; //인증 성공여부 check
// 			mailCertification = true;
// 		} else if ($(".compare").val() == '') {
// 			$('.compare').prop('placeholder', '인증번호를 입력해주세요.');
// 			$("#compare-text").text("")
// 			$("#compare-text").css("color", "red");
// 		} else {
// 			$("#compare-text").text("인증번호가 일치하지 않습니다.")
// 			$("#compare-text").css("color", "red");
// 			isCertification = false; //인증 실패
// 		}
// 	});
// });





