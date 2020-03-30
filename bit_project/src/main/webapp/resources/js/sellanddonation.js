if ($("#chk_info2").is(":checked")) {
	$("#chk_info2").val("기부");
} else {
	$("#chk_info2").val("판매");
}

$(document).ready(function() {
	$("#nextstep").click(function() {
		
		if ($("#chk_info1").is(":checked") == false) {
			alert('필수 약관에 동의 하셔야 합니다.');
			return false;
		} else {
			var frm = document.getElementById("form_sellanddonation");
			frm.action = "sellanddonation_mailsend.ms";
			frm.submit();
		}
	});
});