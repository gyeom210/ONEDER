	var filter = "win16|win32|win64|mac|macintel";
	var deviceChk = 0;
	if ( navigator.platform ) {
		if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
			deviceChk=2;
		}
		else { 
			deviceChk=1;
		}
	}
		var revcount = 0;
        var scrollHeight = 0;
        var qnacheck = 0;
        var revcheck = 0; 
        function qna_write() {
            if (sessionChk == "" || sessionChk == null) {
                location.href = "login.me";
            } else {
                $('body').css("background", "grey");
                $(".qnaForm").show();
                scrollHeight = $("body").scrollTop(); 
                $("body").addClass('not_scroll'); 
                $('.qnaForm').css('position', 'fixed'); 
                if(deviceChk==2){
                	$('.qnaForm').css('top', '50px');
                    $('.qnaForm').css('left', 0);
                }else {
                	$('.qnaForm').css('top', - scrollHeight + 100);
                    $('.qnaForm').css('left', 400);
                }
                
                // 등록
                if ($('#QnaForm textarea').val().length == 0) {
                    qnacheck = 1;
                }
            }

        };
        $('.qna_writebtn a').first().click(function () {
        	if($("#QnaForm input:text[name=question_title]").val().length<10){
        		alert('제목은 최소 10 자 이상 작성해주세요.');
        		return false;
        	}
        	
        	if($("#QnaForm textarea[name=content]").val().length<10){
        		alert('문의내용은 최소 10자 이상 작성해주세요.');
        		return false;
        	}
        	
         	
        	
            $("body").removeClass('not_scroll');
            $('.qnaForm').css('position', 'relative');// top값 해제
            $('.qnaForm').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값
											// 추가
            $('.qnaForm').css('top', 0);// 최상위 div 고정해제
            $(".qnaForm").hide();
            $('body').css("background", "none");
            $('body').scrollTop(scrollHeight);
            // 등록
            if (qnacheck == 1) {
                var frm = document.getElementById("QnaForm");
                frm.action = "qnaWrite.pr";
                frm.submit();
                var ta = $("#QnaForm textarea[name=content]").html("");
                frm.reset();
            } else {
                var frm = document.getElementById("QnaForm");
                frm.action = "qnaModify.pr";
                frm.submit();
                frm.reset();
            }
            var scrollTop = $(window).scrollTop();
            var captionTop = $('.reviewcssf').offset().top;
            $('html, body').animate({ scrollTop: captionTop }, 0);

        });
        $('.qna_writebtn a').last().click(function () {
            $("body").removeClass('not_scroll');
            $('.qnaForm').css('position', 'relative');// top값 해제
            $('.qnaForm').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값
											// 추가
            $('.qnaForm').css('top', 0);// 최상위 div 고정해제
            $(".qnaForm").hide();
            $('body').css("background", "none");
            $('body').scrollTop(scrollHeight);
            var frm = document.getElementById("QnaForm");
            var ta = $("#QnaForm textarea[name=content]").html("");
            frm.reset();
        });

        function review_write(rcnt) {
            if (sessionChk == "" || sessionChk == null) {
                location.href = "login.me";
            } else {
                // 이메일과 pnum 넘겨서 이새끼 리뷰 쓴게 있나 확인. 쓴게 있으면 리뷰는 1개만 가능하다 안내.
                $.ajax({
                    url: '/bit_project/reviewoverflow.pr',
                    type: 'POST',
                    dataType: 'json',
                    data: { "email": sessionChk, "product_num": p },
                    async: false,
                    success: function (data) {
                        revcount = data;
                    },
                    error: function () {
                    }
                });
                if (revcount == 0) {
                    $('body').css("background", "grey");
                    $(".reviewForm").show();
                    scrollHeight = $("body").scrollTop();
                    $("body").addClass('not_scroll');
                    $('.reviewForm').css('position', 'fixed'); 
                    if(deviceChk==2){
                    	 $('.reviewForm').css('top', '50px');
                         $('.reviewForm').css('left', 0);
                    }else {
                    	 $('.reviewForm').css('top', - scrollHeight + 100);
                         $('.reviewForm').css('left', 400);
                    }
                    if ($('#ReviewForm textarea').val().length == 0) {
                        revcheck = 1;
                    }
                } else {
                    if (rcnt == 1) {
                        $('body').css("background", "grey");
                        $(".reviewForm").show();
                        scrollHeight = $("body").scrollTop(); 
                        $("body").addClass('not_scroll');
															
                        $('.reviewForm').css('position', 'fixed'); 

                        if(deviceChk==2){
                       	 $('.reviewForm').css('top', '50px');
                            $('.reviewForm').css('left', 0);
                       }else {
                       	 $('.reviewForm').css('top', - scrollHeight + 100);
                            $('.reviewForm').css('left', 400);
                       }
															
                        // 텍스트에어리어가 빈값이다 -> 리뷰등록
                        if ($('#ReviewForm textarea').val().length == 0) {
                            revcheck = 1;
                        }
                    } else {
                        alert('리뷰는 하나만 작성가능합니다.')
                    }

                }

            }

        };
        $('.review_writebtn a').first().click(function () {
        	var tf = false;
        	tf = $('input:radio[name=reviewcheck]').is(':checked');
        	if(tf==false){
        		alert('평점을 선택해주세요.');
        		return false;
        	}
        	if($("#ReviewForm textarea[name=content]").val().length<20){
        		alert('리뷰내용은 최소 20자 이상 작성해주세요.');
        		return false;
        	}
        	
        	
            $("body").removeClass('not_scroll');
            $('.reviewForm').css('position', 'relative');// top값 해제
            $('.reviewForm').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값
											// 추가
            $('.reviewForm').css('top', 0);// 최상위 div 고정해제
            $(".reviewForm").hide();
            $('body').css("background", "none");
            $('body').scrollTop(scrollHeight);
            if (revcheck == 1) {
                var frm = document.getElementById("ReviewForm");
                frm.action = "reviewWrite.pr";
                frm.submit();
                var ta = $("#ReviewForm textarea[name=content]").html("");
                frm.reset();
            } else {
                var frm = document.getElementById("ReviewForm");
                frm.action = "reviewModify.pr";
                frm.submit();
                frm.reset();
            }
            var scrollTop = $(window).scrollTop();
            var captionTop = $('.reviewcssf').offset().top;
            $('html, body').animate({ scrollTop: captionTop }, 0);
        });
        $('.review_writebtn a').last().click(function () {
            $("body").removeClass('not_scroll');
            $('.reviewForm').css('position', 'relative');// top값 해제
            $('.reviewForm').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값
											// 추가
            $('.reviewForm').css('top', 0);// 최상위 div 고정해제
            $(".reviewForm").hide();
            $('body').css("background", "none");
            $('body').scrollTop(scrollHeight);
            var frm = document.getElementById("ReviewForm");
            frm.reset();
        });
