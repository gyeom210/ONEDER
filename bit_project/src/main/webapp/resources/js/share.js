$(document).ready(function() {
	$("#nextstep").click(function() {
		var bank1 = "은행";
		if ($("#chk_info").is(":checked") == false) {
			alert('필수 약관에 동의 하셔야 합니다.');
			return false;
		} else {
			if($("#select").val() == bank1){
				alert('은행을 선택하세요.');
				return false;
			} else{
				alert('else');
				var frm = document.getElementById("form_share");
				frm.action = "share_App.ms";
				frm.submit();
			}
			
		}
	});
});