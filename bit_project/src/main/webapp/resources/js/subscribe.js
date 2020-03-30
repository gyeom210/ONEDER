	$(document).ready(function() {
		$("input[name='si_gift']").attr("disabled", true); //si_gift radio버튼 비활성화.

		// 라디오버튼 클릭시 이벤트 발생
		$("input:radio[type=radio]").click(function() {

			if ($("input[name=group1]:checked").val() == "1month") {
				$('input:radio[name="si_gift"]').removeAttr('checked'); //초기화 
				$("input:radio[id=choice02]").attr("checked", true);

			} else if ($("input[name=group1]:checked").val() == "2month") {
				$('input:radio[name="si_gift"]').removeAttr('checked'); //초기화
				$("input:radio[id=choice02]").attr("checked", true);
			} else if ($("input[name=group1]:checked").val() == "silver") {
				$('input:radio[name="si_gift"]').removeAttr('checked'); //초기화
				$("input:radio[id=choice01]").attr("checked", true);
			} else if ($("input[name=group1]:checked").val() == "gold") {
				$('input:radio[name="si_gift"]').removeAttr('checked'); //초기화
				$("input:radio[id=choice01]").attr("checked", true);
			} else if ($("input[name=group1]:checked").val() == "platinum") {
				$('input:radio[name="si_gift"]').removeAttr('checked'); //초기화
				$("input:radio[id=choice01]").attr("checked", true);
			}
		});

	});