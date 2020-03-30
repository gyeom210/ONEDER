
	function normal_to_bad(param_email) {
		var input = confirm("수정하시겠습니까?");
		alert(input);
		alert(param_email);
		$.ajax({

			url : '/bit_project/normal_to_bad.tz',
			type : "post",
			dataType : "json",
			data : {
				usergroup : normal,
				email : param_email
			},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(retVal){
				if (retVal.res == "OK") {
					alert("usergroup 수정 완료.");
					member_group();
				} else { // 실패했다면
					alert("usergroup 수정 실패.");
				}
			},
			error : function(){
				alert("ajax통신 실패 !!!");
			}

		});
		location.href="member_group.se";
	}
	
	function bad_to_normal(param_email) {
		var input = confirm("수정하시겠습니까?");
		alert(input);
		alert(param_email);
		$.ajax({

			url : '/bit_project/bad_to_normal.tz',
			type : "post",
			dataType : "json",
			data : {
				usergroup : bad,
				email : param_email
			},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(retVal){
				if (retVal.res == "OK") {
					alert("usergroup 수정 완료.");
					member_group();
				} else { // 실패했다면
					alert("usergroup 수정 실패.");
				}
			},
			error : function(){
				alert("ajax통신 실패 !!!");
			}
		});
		location.href="member_group.se";
	}
	

