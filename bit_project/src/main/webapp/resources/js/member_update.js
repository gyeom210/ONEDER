
/* 마이페이지 닉네임 중복 체크 */
function nnChk_mypage() {

	if($("#nickname").val() == ""){
		alert("닉네임을 입력해주세요.");
		return false;
	} 

	
	var _str = $("#nickname").val();

	$.ajax({

		url : '/bit_project/nnupdateCheck.do',
		type : "post",
		dataType : "json",
		data : {
			nickname : $("#nickname").val()
		},
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',

		success : function(retVal) {
			if (retVal.res == "OK") {
				$(".button1").attr("value", "Y");
				alert("사용가능한 닉네임입니다.");
			} else { // 실패했다면
				alert("중복된 닉네임입니다.");
			}
		},
		error : function() {
			alert("ajax통신 실패!!!");
		}

	});
}

/* 마이페이지 닉네임 업데이트 중복 체크 */
$(".button3").click(function(event) {
	event.preventDefault();
	
	/* text 실제 입력 값 */
	nick_check = document.update_form.nickname.value;
	
	if(nick_check == nick_session){
		$("#button1").attr("value", "Y");
	} else if($("#button1").val() == "Y"){
		
	} else{
		alert("중복확인을 눌러주세요.");
		return false;
	}
	
	if($("#password").val() == ""){
		var _str = $("#password").val();
		alert("비밀번호를 입력해주세요.");
		
		return false;
		
	} else if($("#button1").val() == "N" && $("#nickname").val() != ""){
		var _str = $("#nickname").val();
		alert("중복확인을 눌러주세요.");
		
		return false;
	}
	
	var formData = new FormData($('#update_form')[0]);


	$.ajax({

		url : '/bit_project/nicknameupdateCheck.pr',
		//enctype: 'multipart/form-data',
		type : "post",
		dataType : "json",
		data : formData,
		/*contentType : 'application/x-www-form-urlencoded; charset=utf-8',*/
		contentType : false,
		processData : false,
		success : function(retVal) {
			if (retVal.res == "OK") {
				$(".button3").attr("value", "Y");
				alert("수정이 완료되었습니다.");
				/*location.href='mypage_main.my'*/
				var frm = document.getElementById("update_form");
				frm.reset();
				history.go(0);
			} else { // 실패했다면
				alert("수정을 실패했습니다.");
			}
		},
		error : function() {
			alert("ajax통신 실패!!!");
		}

	});
	 //event.preventDefault();
});

/* 마이페이지 기존 비밀번호 체크 */
function pwChk_mypage() {
	var _str = $("#password").val();
	var _str_email = $("#email").val();

	$.ajax({

		url : '/bit_project/passwordCheck.do',
		type : "post",
		dataType : "json",
		data : {
			password : $("#password").val(),
			email : $("#email").val()
		},
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',

		success : function(retVal) {
			if (retVal.res == "OK") {
				$(".button2").attr("value", "Y");
				// 페이지 document 로딩 완료 후 스크립트 실행 
					
						status = $(".tr_password").css("display"); 
						if (status == "none") { 
							$(".tr_password").css("display", ""); 
						} else { 
							$(".tr_password").css("display", "none"); 
						} 
					
			
				alert("새로운 비밀번호를 입력해주세요.");
			} else { // 실패했다면
				alert("입력한 비밀번호가 틀렸습니다.");
			}
		},
		error : function() {
			alert("ajax통신 실패!!!");
		}

	});
}

/* mypage 비밀번호 일치 체크 */
$(function() {
	$("#alert-true").hide();
	$("#alert-false").hide();
	$("#alert-check").hide();
	$("#new_password").keyup(function() {
		var pwd1 = $("#new_password").val();
		var pwd2 = $("#new_password_confirm").val();

		if (pwd1.length < 8) {
			$("#alert-check").show();
			$("#submit").attr("disabled", "disabled");
		} else {
			$("#alert-check").hide();
			$("#submit").removeAttr("disabled");
		}

		if (pwd1 == "" || pwd2 == "") {
			return false;
		} else if (pwd1 != "" && pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-true").show();
				$("#alert-false").hide();
				$("#submit").removeAttr("disabled");
			} else if (pwd1 != pwd2) {
				$("#alert-true").hide();
				$("#alert-false").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});

	/* 비밀번호 확인 */
	$("#new_password_confirm").keyup(function() {
		var pwd1 = $("#new_password").val();
		var pwd2 = $("#new_password_confirm").val();

		if (pwd1 == "" || pwd2 == "") {
			return false;
		} else if (pwd1 != "" && pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-true").show();
				$("#alert-false").hide();
				$("#submit").removeAttr("disabled");
			} else if (pwd1 != pwd2) {
				$("#alert-true").hide();
				$("#alert-false").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});
	
});

/* 비밀번호 변경 */
function password_change() {
	pwd1 = document.update_form.new_password.value;
	pwd2 = document.update_form.new_password_confirm.value;

	var _str1 = $("#email").val();

	if (pwd1.length < 8) {
		document.update_form.new_password.focus();
		return false;
	} else if (pwd1 != pwd2) {
		document.signupForm.new_password_confirm.focus();
		return false;
	}
	
	if(pwd1.length > 7 && pwd1 == pwd2){
		$.ajax({

			url : '/bit_project/passwordUpdate.do',
			type : "post",
			dataType : "json",
			data : {
				email : $("#email").val(),
				password : $("#new_password_confirm").val()
			},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',

			success : function(retVal) {
				if (retVal.res == "OK") {
					$(".button5").attr("value", "Y");
					alert("비밀번호 변경 완료.");
				} else { // 실패했다면
					alert("비밀번호 변경 실패.");
				}
			},
			error : function() {
				alert("ajax통신 실패!!!");
			}

		});
	}
	
	location.replace("mypage_main.my")
};


/* 프로필  */
$(function () {

     $('.zz')
     .on("dragover", dragOver)
     .on("dragleave", dragOver)
     .on("drop", uploadFiles);
     
     $('.browser').hide()
     $('.preview').children().show()

     function isDataURL(s) {
         return !!s.match(isDataURL.regex);
     }
     isDataURL.regex = /^\s*data:([a-z]+\/[a-z]+(;[a-z\-]+\=[a-z\-]+)?)?(;base64)?,[a-z0-9\!\$\&\'\,\(\)\*\+\,\;\=\-\.\_\~\:\@\/\?\%\s]*\s*$/i;
     
     function dragOver(e) {
         e.stopPropagation();
         e.preventDefault();
     }
     
     //file 업로드
     function readURL(input) {
         if (input.files && input.files[0]) {
             var reader = new FileReader();
             var preview = $(input).data('preview');
             var _invalid = $(input).parent().parent().find('.invalid-file')

             reader.onload = function(e) {
                 if( isDataURL(e.target.result) )    {
                     _invalid.hide()
                     $('#' + preview).css('background-image', 'url('+e.target.result +')');
                     $('#' + preview).hide();
                     $('#' + preview).fadeIn(650);
                 } else {
                     $('#' + preview).hide()
                     _invalid.html('<div class="alert alert-false"><strong>Error!</strong> Invalid image file.</div>')
                     _invalid.show()
                 }
             } //reader.onload
             reader.readAsDataURL(input.files[0]);
             
         } //if
     } //function readURL

     //드래그 업로드
     function uploadFiles(e) {
         e.stopPropagation();
         e.preventDefault()
         dragOver(e); //1
      
        e.dataTransfer = e.originalEvent.dataTransfer; //2 
         
       var files = e.target.files || e.dataTransfer.files;
       if (files.length > 1) {
           alert('이미지는 한개만 가능합니다');
           return;
       }

         var reader = new FileReader();
         var preview = $(this).data('preview');
         var _invalid = $(this).parent().parent().find('.invalid-file')

         reader.onload = function(e) {
             if( isDataURL(e.target.result) )    {
                 _invalid.hide()
                 $('#' + preview).css('background-image', 'url('+e.target.result +')');
                 $('#' + preview).hide();
                 $('#' + preview).fadeIn(650);
             } else {
                 $('#' + preview).hide()
                 _invalid.html('<div class="alert alert-false"><strong>Error!</strong> Invalid image file.</div>')
                 _invalid.show()
             }
         } //reader.onload
         reader.readAsDataURL(files[0]);
         $("input[type='file']")
         .prop("files", e.originalEvent.dataTransfer.files); //드래그드롭으로 올리는 이미지 input에 넣기
     } //function uploadFiles
     
     //파일 올리기로 올렸을때
     $('.imageUpload').bind('change', function(e) {
         e.preventDefault()
         readURL(this)
     });

     
 }); //function



/*
$(function() {
    $("#imageUpload").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function (e) {
    	alert(e.target.result);
            $('#blah').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}
*/