$(function(){
    $("#wishlist-pid-0001").click(function(){
    	if(sessionChk==""){
    	    location.href = 'login.me';
    	}else {
    		  var book = $(this).is(":checked");
    	        if(book==true){
    	        	//팝업창 띄우고 확인 누르면 db삽입
    	            $('body').css("background", "grey");
    	            $(".bookmarkForm_true").show();
    	            scrollHeight = $("body").scrollTop(); // [var사용하지 않았으므로 전역스코프로 정의됨]열렸을떄 scrollTop 체크
    	            $("body").addClass('not_scroll'); //overflow:hidden 추가
    	            $('.bookmarkForm_true').css('position', 'fixed'); //최상위 div 고정
    	            if(deviceChk==1){
    	            	$('.bookmarkForm_true').css('top', - scrollHeight + 100);
        	            $('.bookmarkForm_true').css('left', 700);
    	            }else {
    	            	$('.bookmarkForm_true').css('top', '70px');
        	            $('.bookmarkForm_true').css('left', 0);	
    	            }
    	            
    	            //$('.bookmarkForm_true').css('top', - scrollHeight + 100);
    	            //$('.bookmarkForm_true').css('left', 700);
    	            $.ajax({
    	        		url: '/bit_project/addbookmark.pr',
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
    	        }else {
    	        	$('body').css("background", "grey");
    	            $(".bookmarkForm_false").show();
    	            scrollHeight = $("body").scrollTop(); // [var사용하지 않았으므로 전역스코프로 정의됨]열렸을떄 scrollTop 체크
    	            $("body").addClass('not_scroll'); //overflow:hidden 추가
    	            $('.bookmarkForm_false').css('position', 'fixed'); //최상위 div 고정
    	            if(deviceChk==1){
    	            	$('.bookmarkForm_false').css('top', - scrollHeight + 100);
        	            $('.bookmarkForm_false').css('left', 700);
    	            }else {
    	            	$('.bookmarkForm_false').css('top', '70px');
        	            $('.bookmarkForm_false').css('left', 0);	
    	            }
    	            
    	        	//팝업창 띄우고 확인 누르면 db삭제
    	            $.ajax({
    	        		url: '/bit_project/deletebookmark.pr',
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
    	        }
    	}
      
    });
});

//찜 등록 후 확인 누르면 마이페이지로 가서 찜목록 확인
$('.bookmark_true_btn a').first().click(function () {
    $("body").removeClass('not_scroll');
    $('.bookmarkForm_true').css('position', 'relative');//top값 해제
    $('.bookmarkForm_true').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
    $('.bookmarkForm_true').css('top', 0);//최상위 div 고정해제
    $(".bookmarkForm_true").hide();
    $('body').css("background", "none");
    $('body').scrollTop(scrollHeight);
        location.href = 'mypage_main.my';
});
//찜 등록 후 취소 누르면 현재 페이지 머무름
$('.bookmark_true_btn a').last().click(function () {
    $("body").removeClass('not_scroll');
    $('.bookmarkForm_true').css('position', 'relative');//top값 해제
    $('.bookmarkForm_true').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
    $('.bookmarkForm_true').css('top', 0);//최상위 div 고정해제
    $(".bookmarkForm_true").hide();
    $('body').css("background", "none");
    $('body').scrollTop(scrollHeight);
});

//찜 취소 시
$('.bookmark_false_btn a').click(function () {
    $("body").removeClass('not_scroll');
    $('.bookmarkForm_false').css('position', 'relative');//top값 해제
    $('.bookmarkForm_false').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
    $('.bookmarkForm_false').css('top', 0);//최상위 div 고정해제
    $(".bookmarkForm_false").hide();
    $('body').css("background", "none");
    $('body').scrollTop(scrollHeight);
});