$(function(){
    $("#wish_button").click(function(){
    	if(sessionChk==""){
    	    location.href = 'login.me';
    	}else {
    		if(mgrade==0){
    			 if(wcheck==0){
    	            	//팝업창 띄우고 확인 누르면 db삽입
    	                $('body').css("background", "grey");
    	                $(".wishlistForm_true").show();
    	                scrollHeight = $("body").scrollTop(); // [var사용하지 않았으므로 전역스코프로 정의됨]열렸을떄 scrollTop 체크
    	                $("body").addClass('not_scroll'); //overflow:hidden 추가
    	                $('.wishlistForm_true').css('position', 'fixed'); //최상위 div 고정
    	                	if(deviceChk==1){
    	                		$('.wishlistForm_true').css('top', - scrollHeight + 100);
        	                    $('.wishlistForm_true').css('left', 700);	
    	                	} else {
    	                		 $('.wishlistForm_true').css('top', '70px');
    	    	                 $('.wishlistForm_true').css('left', 0);
    	                	}
    	                
    	                $.ajax({
    	            		url: '/bit_project/addwishlist.pr',
    	            		type: 'post',
    	            		data:{"product_num" : p, "email" : sessionChk}, 
    	            		dataType: "json",
    	            		async:false,
    	            		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
    	            		success: function (data) {
    	           			},
    	            		error: function () {
    	            		}
    	            		
    	            	});
    	                wcheck = 1;
    	                $('#wish_button').css("background","black");
    	            }else if(wcheck==1 || wcheck==11){
    	            	$('body').css("background", "grey");
    	                $(".wishlistForm_false").show();
    	                scrollHeight = $("body").scrollTop(); // [var사용하지 않았으므로 전역스코프로 정의됨]열렸을떄 scrollTop 체크
    	                $("body").addClass('not_scroll'); //overflow:hidden 추가
    	                $('.wishlistForm_false').css('position', 'fixed'); //최상위 div 고정
    	                if(deviceChk==1){
    	                	$('.wishlistForm_false').css('top', - scrollHeight + 100);
    	                    $('.wishlistForm_false').css('left', 700);
    	                }else {
    	                	 $('.wishlistForm_false').css('top', '70px');
     	                    $('.wishlistForm_false').css('left', 0);
    	                }
    	                	
    	            	//팝업창 띄우고 확인 누르면 db삭제
    	                $.ajax({
    	            		url: '/bit_project/deletewishlist.pr',
    	            		type: 'post',
    	            		data:{"product_num" : p, "email" : sessionChk}, 
    	            		dataType: "json",
    	            		async:false,
    	            		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
    	            		success: function (data) {
    	           			},
    	            		error: function () {
    	            		}
    	            		
    	            	});
    	                wcheck = 0;
    	                $('#wish_button').css("background","#EA7475");
    	            } else {
    	            	alert('위시리스트는 최소 5개 최대 10개까지 등록 가능합니다.');
    	            }
    		}
    		else {
    			alert('구독 등급에 맞는 상품만 등록할 수 있습니다.');
    		}
    	}

    });
});

//위시리스트 등록 후 확인 누르면 마이페이지로 가서 위시리스트 목록 확인
$('.wishlist_true_btn a').first().click(function () {
    $("body").removeClass('not_scroll');
    $('.wishlistForm_true').css('position', 'relative');//top값 해제
    $('.wishlistForm_true').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
    $('.wishlistForm_true').css('top', 0);//최상위 div 고정해제
    $(".wishlistForm_true").hide();
    $('body').css("background", "none");
    $('body').scrollTop(scrollHeight);
        location.href = 'mypage_main.my';
});
//위시리스트 등록 후 취소 누르면 현재 페이지 머무름
$('.wishlist_true_btn a').last().click(function () {
    $("body").removeClass('not_scroll');
    $('.wishlistForm_true').css('position', 'relative');//top값 해제
    $('.wishlistForm_true').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
    $('.wishlistForm_true').css('top', 0);//최상위 div 고정해제
    $(".wishlistForm_true").hide();
    $('body').css("background", "none");
    $('body').scrollTop(scrollHeight);
});

//위시리스트 취소 시
$('.wishlist_false_btn a').click(function () {
    $("body").removeClass('not_scroll');
    $('.wishlistForm_false').css('position', 'relative');//top값 해제
    $('.wishlistForm_false').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
    $('.wishlistForm_false').css('top', 0);//최상위 div 고정해제
    $(".wishlistForm_false").hide();
    $('body').css("background", "none");
    $('body').scrollTop(scrollHeight);
});