   $("#nickname-alert-true").hide();
   $("#nickname-alert-false").hide();   
   $("#email-alert-true").hide();
   $("#email-alert-false").hide();   
      
   /*닉네임 중복 체크*/
   function nnChk() {
      if($.trim($("#nickname").val()) == '') {
    	  alert("닉네임을 입력해주세요");
    	  $("#nickname").focus();
    	  return false;
      } 
      
      $.ajax({
         url : '/bit_project/nicknameCheck.do',
         type : "post",
         dataType : "json",
         data : {
            nickname : $("#nickname").val()
         },
         contentType : 'application/x-www-form-urlencoded; charset=utf-8',

         success : function(retVal) {
            if (retVal.res == "OK") {
               $(".nicknamecheck-btn").attr("value", "Y");
               $("#nickname-alert-true").show();
               $("#nickname-alert-false").hide();
            } else { // 실패했다면
               $("#nickname-alert-true").hide();
               $("#nickname-alert-false").show();
            }
         },
         error : function() {
            alert("ajax통신 실패!!!");
         }

      });
   }
   
   /*이메일 중복 체크*/
   function emChk() {
     var email = $("#email").val();
     var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

     if(!exptext.test(email)){ //이메일 형식이 올바르지않을때
    	 alert("이메일 형식이 올바르지 않습니다");
    	 $("#email").focus();
    	 return false;
     }else { //이메일 형식이 올바르면 중복 체크

      var _str1 = $("#email").val();
      $.ajax({
         url : '/bit_project/emailCheck.do',
         type : "post",
         dataType : "json",
         data : {
            email : $("#email").val()
         },
         contentType : 'application/x-www-form-urlencoded; charset=utf-8',

         success : function(retVal) {
            if (retVal.res == "OK") {
               $(".emailcheck-btn").attr("value", "Y");
               $("#email-alert-true").show();
               $("#email-alert-false").hide();
            } else { // 실패했다면
               $("#email-alert-true").hide();
               $("#email-alert-false").show();
            }
         },
         error : function() {
            alert("ajax통신 실패!!!");
         }
      }); //ajax
     } //else
   }
   
   /*비밀번호  체크 */
   $(function() {
      $("#pw-alert-true").hide();
      $("#pw-alert-false").hide();
      $("#pw-alert-check").hide();
      /* 8자리 여부 */
      $("#password").keyup(function() {
         var pwd1 = $("#password").val();
         
         if (pwd1.length < 8) { 
            $("#pw-alert-check").show();
            $("#submit").attr("disabled", "disabled");
         } else {
            $("#pw-alert-check").hide();
            $("#submit").removeAttr("disabled");
         }
      });
      /* 비밀번호 일치 여부 */
      $(".pw").keyup(function() {
            var pwd1 = $("#password").val();
            var pwd2 = $("#pwcheck").val();
         if(pwd1 =="" || pwd2 =="") {
            return false;   
         } else if (pwd1 != "" && pwd2 != "") {
            if (pwd1 == pwd2) {
               $("#pw-alert-true").show();
               $("#pw-alert-false").hide();
               $("#submit").removeAttr("disabled");
            } else if(pwd1 != pwd2 ){
               $("#pw-alert-true").hide();
               $("#pw-alert-false").show();
               $("#submit").attr("disabled", "disabled");
            }
         }
      });
   
    
   });
   
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
   
   /*빈칸체크*/
   function inputChk(){
	  	var signupForm = document.signupForm;
	  	
	  	var nickname = signupForm.nickname.value;
	  	var nicknamecheckBtn = $(".nicknamecheck-btn").val();
	  	var email = signupForm.email.value;
	  	var emailcheckBtn = $(".emailcheck-btn").val();
		var name = signupForm.name.value;
		var password = signupForm.password.value;
		var pwcheck = signupForm.pwcheck.value;
		var phone = signupForm.phone.value;
		var postal_num = signupForm.postal_num.value;
		var address = signupForm.address.value;
		var address_detail = signupForm.address_detail.value;
		var birth = signupForm.birth.value;
		
		
		if(!nickname) {
	    	  alert("닉네임을 입력해주세요");
	    	  $("#nickname").focus();
	    	  return false;		
 		}else if(nicknamecheckBtn == "N") {
 		     alert("닉네임 중복확인 버튼을 눌러주세요");
 		     $("#nickname").focus();
	    	  return false;		
 		}else if(!email) {
			 alert("이메일을 입력해주세요");
			 $("#email").focus();
			 return false;
		}else if(emailcheckBtn == "N"){
	        alert("이메일 중복확인 버튼을 눌러주세요.");
	        $("#email").focus();
			return false;
	    }else if(!name) {
			 alert("이름을 입력해주세요");
			 $("#name").focus();
			 return false;
		}else if(!password || !pwcheck){
			alert("비밀번호를 입력해주세요");
			$("#password").focus();
			return false;
		}else if(password.length < 8 || pwcheck.length < 8){
			alert("비밀번호를 8자리 이상 입력해주세요");
			$("#password").focus();
			return false;
		}else if(password != pwcheck){
			alert("비밀번호가 일치하지 않습니다");
			$("#password").focus();
			return false;
		}else if(!phone) {
			alert("핸드폰번호를 입력해주세요");
			$("#phone").focus();
			return false;
		 }else if(!postal_num) {
			 alert("우편번호를 입력해주세요");
	    	  $("#postal_num").focus();
	    	  return false;
		 }else if(!address) {
			 alert("주소를 입력해주세요");
	    	  $("#address").focus();
	    	  return false;
	    }else if(!address_detail) {
			 alert("상세주소를 입력해주세요");
	    	  $("#address_detail").focus();
	    	  return false;
	    }else if(!birth) {
			 alert("생년월일을 입력해주세요");
	    	  $("#birth").focus();
	    	  return false;
	    }else if($('#signup-agree').prop("checked")== false)  {
	         alert('약관에 동의해주세요.');
	         return false;
   		}else {
			 signupForm.submit();
		 }
   	}

