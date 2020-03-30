$("document").ready(function () {
    var totalData = 0;	// 총 데이터 수
    var dataPerPage = 5;
    var pageCount = 5;
    var currentPage = 1;
    //var currentPage = ${param.page};	
    $.ajax({
    	url: '/bit_project/reviewcount.pr',
        type: 'POST',
        dataType: 'json',
        data:{"product_num" : p},
        async:false,
        success: function (data) {    
            totalData = data;
            $('.reviewcssf').html("("+totalData+")");
        
        },
        error: function () {
			alert("totaldata 획득 실패");
		}
    });
    
    review_snsData(totalData, dataPerPage, pageCount, currentPage);
    $('.review article ul li').click(function () {
        if ($(this).children().first().css("-webkit-line-clamp") == 2) {
            $(this).children().first().css("-webkit-line-clamp", 6);
            $(this).children().first().css("margin-bottom", 40);
        } else {
            $(this).children().first().css("-webkit-line-clamp", 2);
            $(this).children().first().css("margin-bottom", 80);
        }
    });
});

function review_snsData(totalData, dataPerPage, pageCount, currentPage) {
    var allData = { "page": currentPage, "product_num" : p};
    
    $.ajax({
    	url: '/bit_project/review.pr',
        type: 'POST',
        dataType: 'json',
        async:false,
        data: allData,
        success: function (data) {
            $(".review").empty();
            //totalData = data.length;               
            if(data.length!=0){
            $.each(data, function (index, item) {
                var exText = "";
                var date = new Date(item.regist);
                if(deviceChk==2){
                	date = mdata(date);
                }else {
                	date = date_to_str(date);
                }
                	
                
                exText += "<article>";
                exText += "<ul style='display: flex;'>";
                //exText += "<li style='flex: 8.5;'>";
                exText += "<li>";
                exText += "<div>"+item.content+"</div>";
                //exText += '<div><img src="/bit_project/image/'+item.mimg+'">';
                exText += '<div><img src="'+item.mimg+'">';
                var sib1 = "'"+item.review_num+"'";
				var sib2 = "'"+item.nickname+"'";
				var sib3 = "'"+item.content+"'";
				var sib4 = "'"+item.rimg+"'";
				var sib5 = "'"+item.gpa+"'";
				var sib6 = "'"+item.email+"'";
				if(sessionChk==item.email){
					//exText += '&nbsp;&nbsp;&nbsp;&nbsp;'+item.nickname+'&nbsp;&nbsp;&nbsp;&nbsp;'+date+'</div>';
	                //exText += "<div>";
					exText += '&nbsp;&nbsp;&nbsp;&nbsp;'+item.nickname+'&nbsp;&nbsp;&nbsp;&nbsp;'+date;
					exText += "<button type='button' style='border: 1px solid; margin-left:20px; color: #fff; border-radius: 5px; background-color: #ffb0b1; width: 55px; text-align: end;height: 25px; font-size: 13px;' onclick='reviewmodify("+item.review_num+","+sib2+","+sib3+","+sib4+","+sib5+","+sib6+");'>수정</a>";

					if(item.point_details==1){
						exText += '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)"'+'><i class="fas fa-check-circle" style="color:green"></i></a>';	
					}else {

						exText += "<button type='button' style='border: 1px solid; color: #fff; border-radius: 5px; background-color: #ffb0b1; width: 55px; text-align: end;height: 25px; font-size: 13px;' onclick='reviewdelete("+item.review_num+");'>삭제</a>";
						exText += '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)"'+'><i class="fas fa-check-circle" style="color:white"></i></a>';
					}
					
					exText += '</div>';
				}else if(usergroup=='admin'){
					exText += '&nbsp;&nbsp;&nbsp;&nbsp;'+item.nickname+'&nbsp;&nbsp;&nbsp;&nbsp;'+date;
					exText += "<button type='button' style='border: 1px solid; color: #fff; border-radius: 5px; background-color: #ffb0b1; width: 35px; text-align: center; height: 21px; font-size: 13px;' onclick='reviewmodify("+item.review_num+","+sib2+","+sib3+","+sib4+","+sib5+","+sib6+");'>수정</a>";
					exText += "<button type='button' style='border: 1px solid; color: #fff; border-radius: 5px; background-color: #ffb0b1; width: 35px; text-align: center; height: 21px; font-size: 13px;' onclick='reviewdelete("+item.review_num+");'>삭제</a>";

					if(item.point_details==1){
						exText += '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)"'+'><i class="fas fa-check-circle" style="color:green"></i></a>';	
					}else {
						exText += "<button type='button' style='border: 1px solid;background-color: #30a5ff; border-color: #30a5ff; color: #fff; border-radius: 5px;  width:76px; height:21px; font-size: 13px;' onclick='reviewpoint("+sib6+","+sib2+");'>포인트 적립</a>";
					}	
					exText += '</div>';
				}else {
					exText += '&nbsp;&nbsp;&nbsp;&nbsp;'+item.nickname+'&nbsp;&nbsp;&nbsp;&nbsp;'+date+'</div>';
					exText += '</div>';
				}
                
                //exText += "</div>";
                exText += "</li>";
                
                /*exText += "<li style='flex: 1.5;'>";*/
                exText += "<li>";
                
                //exText += '<img src="/bit_project/image/'+item.mimg+'">';
                exText += '<img src="/bit_project/image/'+item.rimg+'">';
                exText += " </li>";
                exText += "</ul>";
                //exText += "<hr style='border: 1px solid #c5c5c5;'>";
                exText += "</article>";
                $(".review").append(exText);
            })
            review_paging(totalData, dataPerPage, pageCount, currentPage);
            
            }
            
            else {
            	 var exTextnull = "<li style='text-align:cetner;'>";
            	 exTextnull += "<div>등록된 상품리뷰가 없습니다.</div>";
            	 exTextnull += "</li>";
                 $(".review").append(exTextnull);
            }
            
        },
        error: function () {
			alert("ajax오류");
		}
    });
    $('.review article ul li').click(function () {
        if ($(this).children().first().css("-webkit-line-clamp") == 2) {
            $(this).children().first().css("-webkit-line-clamp", "6");
            $(this).children().first().css("margin-bottom", 40);
        } else {
            $(this).children().first().css("-webkit-line-clamp", "2");
            $(this).children().first().css("margin-bottom", 80);
        }
    });
}

function review_paging(totalData, dataPerPage, pageCount, currentPage) {
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
        //html += "<a href='javascript:review_snsData(totalData, dataPerPage, pagecount, " + i + ")' id=" + i + ">" + i + "</a> ";
    	html += "<a href='javascript:review_snsData("+totalData+","+dataPerPage+","+ pageCount+", " + i + ");' id=" + i + ">" + i + "</a> ";
        //html += "<a href='javascript:review_snsData(0, 6, 10, " + i + ")' id=" + i + ">" + i + "</a> ";
        
        
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

    	        $(".review_paginate").html(html);    // 페이지 목록 생성
    	        $(".review_paginate a").removeClass("page_on");

    	        $(".review_paginate a#" + currentPage).addClass("page_on"); // 현재 페이지 표시	
    }
  

    $(".review_paginate a").click(function () {
        var $item = $(this);
        var $id = $item.attr("id");
        var selectedPage = $item.text(); // 번호 클릭.

        if ($id == "one") selectedPage = one;
        if ($id == "prev") selectedPage = prev;
        if ($id == "next") selectedPage = next;
        if ($id == "lastNo") selectedPage = lastNo;
        review_snsData(totalData, dataPerPage, pageCount, selectedPage);
        review_paging(totalData, dataPerPage, pageCount, selectedPage);// 페이징
       
    })
}


function reviewmodify(_rnum, _nickname, _content, _img, _gpa, _email) {
	 $("#ReviewForm textarea").html(_content);
	 //$("#ReviewForm input[name=nickname]").val("테스트닉네임");
	 switch (_gpa) {
		case "5":$("#ReviewForm input:radio[name='reviewcheck']:radio[value='5']").prop('checked', true);
			break;
		case "4":$("#ReviewForm input:radio[name='reviewcheck']:radio[value='4']").prop('checked', true);
			break;
		case "3":$("#ReviewForm input:radio[name='reviewcheck']:radio[value='3']").prop('checked', true);
			break;
		case "2":$("#ReviewForm input:radio[name='reviewcheck']:radio[value='2']").prop('checked', true);
			break;
		case "1":$("#ReviewForm input:radio[name='reviewcheck']:radio[value='1']").prop('checked', true);
			break;
		default:
			break;
	}
	 $("#ReviewForm input[name=review_num]").val(_rnum);
	review_write(1);
}
function reviewdelete(_rnum){
	 if (confirm("정말 삭제하시겠습니까??") == true){
		 //ajax로 데이터 삭제
		 $.ajax({
			 url:'/bit_project/reviewdelete.pr',
			 type:'POST',
			 data:{"review_num" : _rnum, "product_num" : p},
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
function reviewpoint(_email, _nickname) {
	 var point_y = confirm("해당 유저에게 포인트를 지급하시겠습니까?"+"'\n'"+"아이디 : "+_email+"'\n'"+"닉네임 : "+_nickname);
		 if(point_y)
	     {
	            $.ajax({
	            	url: '/bit_project/Addpoint.pr',
	                type: 'GET',
	                dataType: 'json',
	                data : {"email" : _email, "nickname" : _nickname, "product_num" : p},
	                async:false,
	                success: function (data) {
	                	console.log("포인트 지급완료.");
	                	history.go(0);
	                	//document.getElementById('nickname').focus();
	                },
	    	        error: function () {
	    				alert("ajax오류");
	    			}
	            });
	     }
}

function date_to_str(format){
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
function mdata(format){
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
			return year + "-" + month + "-" + date;	
	}