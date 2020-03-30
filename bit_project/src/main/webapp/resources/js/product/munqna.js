    $("document").ready(function () {
    	var searchemail = "";
        var totalData = 0;	// 총 데이터 수
        var dataPerPage = 10;
        var pageCount = 5;
        var currentPage = 1;
        //var currentPage = ${param.page};	
        $.ajax({
        	url: '/bit_project/qnacount.pr',
            type: 'POST',
            dataType: 'json',
            data:{"product_num" : p},
            async:false,
            success: function (data) {             
                totalData = data;
                $('.qnacssf').html("("+totalData+")");
            
            },
	        error: function () {
				alert("totaldata 획득 실패");
			}
        });
        
        snsData(totalData, dataPerPage, pageCount, currentPage);
        
        $('.accordion ul li').click(function () {
        	if($(this).text()=="등록된 상품문의가 없습니다."){
        		
        	} else {
        		  $.ajax({
  		        	url: '/bit_project/qnaemailchk.pr',
  		            type: 'POST',
  		            dataType: 'json',
  		            data:{"email" : $(this).children().first().children().last().children(":eq(1)").val()},
  		            async : false,
  		            success: function (data) {             
  		            	searchemail=data;
  		            	console.log(searchemail);
  		            },
  			        error: function () {
  					}
  		        });
          	//alert($(this).children().first().children().last().children().first().text());
          	if($(this).children().first().children(":eq(2)").val()=="공개"){
          		if ($(this).children().last().css("display") == 'none') {
                  		$(this).children().last().show();
                  } else {
                      $(this).children().last().hide();
                  }
          	}else {
          		if ($(this).children().last().css("display") == 'none') {
          			//nick으로 email 조회해서 email=sessionChk이면
                  	//공개면 상관없고 공개가 아닐 때 0204 추후 수정
          			
                  	/*if(nick==$(this).children().first().children().last().children().first().text()){
                  		$(this).children().last().show();
                  	}else {
                  		alert('해당 글은 비공개 글로 작성자와 관리자만 확인할 수 있습니다.');
                  	}*/
          			if((sessionChk!="" && sessionChk==searchemail) || usergroup=='admin'){
                    		$(this).children().last().show();
                    	}else {
                    		alert('해당 글은 비공개 글로 작성자와 관리자만 확인할 수 있습니다.');
                    	}
                      
                  } else {
                      $(this).children().last().hide();
                  }
          		
          	}
          	
          	//console.log($(this).children().first().children(":eq(2)").val());
        	}

        });
    });

    function snsData(totalData, dataPerPage, pageCount, currentPage) {
        var allData = { "page": currentPage, "product_num" : p};
        
        $.ajax({
        	url: '/bit_project/qna.pr',
            type: 'POST',
            dataType: 'json',
            async:false,
            data: allData,
            success: function (data) {
                $(".accordion ul").empty();
                //totalData = data.length;               
                if(data.length!=0){
                $.each(data, function (index, item) {
                	var sib1 = "'"+item.question_title+"'";
                  	 var sib2 = "'"+item.content+"'";
                  	 var sib3 = "'"+item.nickname+"'";
                  	 var sib4 = "'"+item.secret+"'";
                  	 var sib5 = "'"+item.email+"'";
                    var exText = "";
                    exText += "<li>";
                    exText += "<div class='title'>";
                    exText += "<span>" +item.answer+ "</span>";    
                    if(item.secret=="공개"){
                        	exText += "<em class='mqt'>" + item.question_title + "</em>";                    		

                    	
                    	exText += '<input type="hidden" value="'+item.secret+'">';		
                    }else {
                        	exText += "<em class='mqt'>" + item.question_title + "</em>";                    		
                    	//exText += "<em class='mqt'>" + item.question_title + "&nbsp;&nbsp;<i class='fas fa-key'></i>"+ "</em>";
                    	//exText += "<span class='mqt'>" + item.question_title + "&nbsp;&nbsp;<i class='fas fa-key'></i>"+ "</span>";
                    	exText += '<input type="hidden" value="'+item.secret+'">';
                    }
                    
                    exText += "<div class='date'>";
                    exText += "<em>" + item.nickname + "</em>";
                    exText += '<input type="hidden" value="'+item.email+'">';
                    var date = new Date(item.regist);
                    date = date_to_str(date);
                    exText += "<em>" + date + "</em>";
                    exText += "</div></div>"; //title
                    exText += "<div class='content' style='display:none;'>";
                    exText += item.content;
                    exText += "<p class='txt-right'>";
                    if((sessionChk==item.email && sessionChk!=null) || usergroup=='admin'){
                    	if(item.answer=="답변대기"){
                       	 
                       	 if(usergroup=='admin'){
                       		exText += '<a href="javascript:void(0)"'+' onclick="ansModal('+item.question_num+','+sib1+','+sib2+','+sib3+','+sib4+','+sib5+');">답변</a>';	 
                       	 }
                       	 exText += '<a href="javascript:void(0)"'+' onclick="qnamodify('+item.question_num+','+sib1+','+sib2+','+sib3+','+sib4+','+sib5+');">수정</a>';
                         exText += "<a href='javascript:void(0)'"+" onclick='qnadelete("+item.question_num+");'>삭제</a>";
                         exText += "</p>";
                       }else{
                    	   exText += '<a href="javascript:void(0)"'+' onclick="qnamodify('+item.question_num+','+sib1+','+sib2+','+sib3+','+sib4+','+sib5+');">수정</a>';
                    	   if(usergroup=='admin'){
                    		   exText += "<a href='javascript:void(0)'"+" onclick='qnadelete("+item.question_num+");'>삭제</a>";   
                    	   }
                    	   exText += "</p>";
                    	   //답변완료 시.
                    	   
                    	   $.ajax({
           		        	url: '/bit_project/qna2.pr',
           		            type: 'POST',
           		            dataType: 'json',
           		            data:{"question_num" : item.question_num},
           		            async : false,
           		            success: function (res) {    
           		            $.each(res, function (i, v) {
           		             var date = new Date(v.regist);
           		             date = date_to_str(date);
           		             exText += "<div class='reply'>";
                             exText += "<span class='re'>re.</span>";
                             exText += "<span class='date'>"+date+"</span>";
                             exText += v.content+""+"</div>";
                             console.log(v.answer_num, v.question_num, v.email, v.nickname, v.product_num, v.content);
           		            })
           		            },
           			        error: function () {
           					}
                    	   });
                       }
    
                   	} 
                   
                    exText += "</div></li>";
                    $(".accordion ul").append(exText);
                })//each
                paging(totalData, dataPerPage, pageCount, currentPage);
                
                }//ifsize
                else {
                	 var exTextnull = "<li style='text-align:cetner;'>";
                	 exTextnull += "<div>등록된 상품문의가 없습니다.</div>";
                	 exTextnull += "</li>";
                     $(".accordion ul").append(exTextnull);
                     $('.accordion').css('margin-top', '0px');
                     $('.accordion ul li').css('border-bottom', 'none');
                }
                
            },//suc
	        error: function () {
				alert("ajax오류");
			}
        });
    }

    function date_to_str(format)
    {
        var year = format.getFullYear();
        var month = format.getMonth() + 1;
        if(month<10) month = '0' + month;
        var date = format.getDate();
        if(date<10) date = '0' + date;
        var hour = format.getHours();
        if(hour<10) hour = '0' + hour;
        var min = format.getMinutes();
        if(min<10) min = '0' + min;
        var sec = format.getSeconds();
        if(sec<10) sec = '0' + sec;
        
        return year + "-" + month + "-" + date + " " + hour + ":" + min;
        
    }


    function paging(totalData, dataPerPage, pageCount, currentPage) {
        var totalPageDevide = totalData / dataPerPage;
        var pageGroupDevide = currentPage / pageCount;


        var totalPage = Math.ceil(totalPageDevide);    // 총 페이지 수
        var pageGroup = Math.ceil(pageGroupDevide);    // 페이지 그룹
        
        var last = pageGroup * pageCount;

        if (last > totalPage)
            last = totalPage;
        var first = last - (pageCount - 1);
        if (first <= 0) {
            first = 1;
        }
        var next = last + 1; // 다음
        var prev = first - 1; // 이전
        var one = 1; // 맨 처음 
        var lastNo = totalPage; // 맨 끝

        var html = "";

        if (prev > 0) {
            html += "<a href=# id='one'>&lt;&lt;&nbsp;&nbsp;</a> ";
            html += "<a href=# id='prev'>&lt;&nbsp;&nbsp;</a> ";

        }
        for (var i = first; i <= last; i++) {
            //html += "<a href='#' id=" + i + ">" + i + "</a> ";
            html += "<a href='javascript:snsData(totalData, dataPerPage, pagecount, " + i + ")' id=" + i + ">" + i + "</a> ";
            //html += "<a href='javascript:snsData(0, 6, 10, " + i + ")' id=" + i + ">" + i + "</a> ";
            
            
        }
        /*
        for(var i=first; i <= last; i++){
		html += "<a href='/example.do?page=" + i + "' id=" + i + ">" + i + "</a> ";
	    }
        */
        if(totalPage==0){
        	
        }else {
        	  if (last < totalPage)
        	        html += "<a href=# id='next'>&gt;&nbsp;&nbsp;</a>";
        	        html += "<a href='javascript:void(0);' id='lastNo'>&gt;&gt;&nbsp;&nbsp;</a> ";

        	        $(".qna_paginate").html(html);    // 페이지 목록 생성
        	        $(".qna_paginate a").removeClass("page_on");

        	        $(".qna_paginate a#" + currentPage).addClass("page_on"); // 현재 페이지 표시	
        }
      

        $(".qna_paginate a").click(function () {
            var $item = $(this);
            var $id = $item.attr("id");
            var selectedPage = $item.text(); // 번호 클릭.



            if ($id == "one") selectedPage = one;
            if ($id == "prev") selectedPage = prev;
            if ($id == "next") selectedPage = next;
            if ($id == "lastNo") selectedPage = lastNo;
            snsData(totalData, dataPerPage, pageCount, selectedPage);
            paging(totalData, dataPerPage, pageCount, selectedPage);// 페이징
            $('.accordion ul li').click(function () {
                if ($(this).children().last().css("display") == 'none') {
                    $(this).children().last().show();
                } else {
                    $(this).children().last().hide();
                }

            });
        })
    }
   
function qnamodify(_qnum, _title, _content, _nickname, _secret, _email) {
	 $("#QnaForm textarea[name=content]").html(_content);
	 $("#QnaForm input[name=question_title]").val(_title);
	 //$("#QnaForm input[name=nickname]").val("테스트닉네임");
	 if(_secret=="비공개"){
		 $("#QnaForm input:radio[name='privatecheck']:radio[value='비공개']").prop('checked', true);	 
	 }else {
		 $("#QnaForm input:radio[name='privatecheck']:radio[value='공개']").prop('checked', true);
	 }
	 $("#QnaForm input[name=question_num]").val(_qnum);
	qna_write();
}
function qnadelete(qnum){
	 if (confirm("정말 삭제하시겠습니까??") == true){
		 //ajax로 데이터 삭제
		 $.ajax({
			 url:'/bit_project/qnadelete.pr',
			 type:'POST',
			 data:{"question_num" : qnum, "product_num" : p},
			 dataType:'JSON',
			 success:function (data) {
				 alert('삭제 성공');
				 history.go(0);
				 //document.getElementById('nickname').focus();
			 },
			 error:function() {
				alert('삭제 실패');
			 }
		 });
	 }else{ 
	     return false;
	 }
	
}

$('.admin_writebtn a').first().click(function () {
    $("body").removeClass('not_scroll');
    $('.adminAnsForm').css('position', 'relative');//top값 해제
    $('.adminAnsForm').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
    $('.adminAnsForm').css('top', 0);//최상위 div 고정해제
    $(".adminAnsForm").hide();
    $('body').css("background", "none");
    $('body').scrollTop(scrollHeight);
    //등록
    var frm = document.getElementById("AnsForm");
    var ansparams = $("#AnsForm").serialize();
    $.ajax({
		 url:'/bit_project/ansWrite.pr',
		 type:'POST',
		 data:ansparams,
		 dataType:'JSON',
		 success:function (data) {
			 alert('삽입 성공');
		 },
		 error:function() {
			alert('삽입 실패');
		 }
	 });
    frm.reset();
    history.go(0);
    var scrollTop = $(window).scrollTop();
    var captionTop = $('.qnacssf').offset().top;
    $('html, body').animate({ scrollTop: captionTop }, 0);

});
$('.admin_writebtn a').last().click(function () {
    $("body").removeClass('not_scroll');
    $('.adminAnsForm').css('position', 'relative');//top값 해제
    $('.adminAnsForm').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
    $('.adminAnsForm').css('top', 0);//최상위 div 고정해제
    $(".adminAnsForm").hide();
    $('body').css("background", "none");
    $('body').scrollTop(scrollHeight);
    var frm = document.getElementById("AnsForm");
    frm.reset();
});

function ansModal(_qnum, _title, _content, _nickname, _secret, _email) {
	 $("#AnsForm textarea[name=content]").html("");
	 $("#AnsForm input[name=question_num]").val(_qnum);
	 if (sessionChk == "" || sessionChk == null) {
	        location.href = "login.me";
	 } else {
	        $('body').css("background", "grey");
	        $(".adminAnsForm").show();
	        scrollHeight = $("body").scrollTop(); // [var사용하지 않았으므로 전역스코프로 정의됨]열렸을떄 scrollTop 체크
	        $("body").addClass('not_scroll'); //overflow:hidden 추가
	        $('.adminAnsForm').css('position', 'fixed'); //최상위 div 고정
	        $('.adminAnsForm').css('top', - scrollHeight + 100);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
	        $('.adminAnsForm').css('left', 700);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
	        
	 }
}