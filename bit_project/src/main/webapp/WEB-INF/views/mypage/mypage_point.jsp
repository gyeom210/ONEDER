<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.member.MemberVO" %>
<%
	String user_email = (String)session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 폰트어썸 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/mypage/point.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/mypage/point.js"></script>
<script>
var totalPoints ='';
var totalData = 0; // 총 데이터 수
var currentPage = 1;
var pageCount = 5;// 한 화면에 나타낼 게시물 수
var dataPage = 5; // 한 화면에 나타낼 페이지 수
	/* 날짜 format */
	function date_format(format) {
		var year = format.getFullYear();
		var month = format.getMonth()+1;
		if(month<10) {
			month = '0' + month;
		}
		var date = format.getDate();
		return year + "." + month + "." + date;
	}

	$(document).ready(function() {
		/* 총 데이터 수 */
		function countTotalData() {
			$.ajax({
				url: '/bit_project/countTotalData.pt',
				type: 'POST',
				dataType: 'json',
				data : {
					 email : $("#user_email").val()
				},
				async:false,
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8', 
				  success: function (data) {             
                      totalData = data;
                  },
                 error: function () {
                  alert("totaldata 획득 실패");
               }
			});
			pointData(totalData, dataPage, pageCount, currentPage);
		}

		/* 보유 포인트 */
		function totalPointsData() {
			$('.point-field').empty();
			 $.ajax({
				 url:'/bit_project/getTotalPoints.pt',
				 type:'POST',
				 dataType : "json",
				 data : {
					 email : $("#user_email").val()
				},
				 contentType : 'application/x-www-form-urlencoded; charset=UTF-8', 
				 success : function(data) {
					 $('.point-field').text(data);
					 totalPoints = data;
				 },
					 
				 error:function() {
                     alert("ajax통신 실패3!!!");
                  }
				 
			 });
			
		}
		
		
		
		countTotalData(); // 총 데이터 수
		//pointData(); // 포인트 내역
		totalPointsData(); // 보유 포인트
		
		
		/* 포인트 사용 */
		 $('.point_button').click(function(){ 
			 var pt1 = $('#subscription').val();
			 var pt2 = $('#gift-wrap').val();
 			if((totalPoints < pt1) || (totalPoints < pt2)) {
 				alert("보유포인트가 부족합니다.");
 			} else if ($('input:radio[id=subscription-check]').is(':checked') == true && pt1 != 0 && pt1 != '') { /* 구독료 차감 */
				 window.confirm('포인트를 사용하시겠습니까?'); 
				 var result = totalPoints - pt1;
				 var reason = "subscription";
				 
				 $.ajax({
					 url:'/bit_project/updateTotalPoints.pt',
					 type:'POST',
					 dataType : "json",
					 data:{"result" : result},
					 contentType : 'application/x-www-form-urlencoded; charset=UTF-8', 
					 success : function(data) {
						 $.ajax({
							url:'/bit_project/insertPoint.pt',
							type:'POST',
							dataType : "json",
							data:{"point" : -pt1, "reason": reason },
							contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
							success : function(data) {
								pointData(totalData, dataPage, pageCount, 1); // 포인트 내역
								totalPointsData(); // 보유 포인트
								 $('#subscription').val("");
								 $('#subscription-check').prop('checked', false);
								
							},
							error:function(request,status,error){
					    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
							}
							
						 });
						 
					 },
						 
					error:function(request,status,error){
				    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
					 
				 });
				
				 /* 포장 */	 
			 } else if($('input:radio[id=gift-wrap-check]').is(':checked') == true) {
				 var result = totalPoints - pt2;
				 var reason = "gift-wrap";
				 $.ajax({
					 url:'/bit_project/updateTotalPoints.pt',
					 type:'POST',
					 dataType : "json",
					 data:{"result" : result},
					 contentType : 'application/x-www-form-urlencoded; charset=UTF-8', 
					 success : function(data) {
						 
						 $.ajax({
								url:'/bit_project/insertPoint.pt',
								type:'POST',
								dataType : "json",
								data:{"point" : -pt2, "reason": reason },
								contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
								success : function(data) {
									pointData(totalData, dataPage, pageCount, 1); // 포인트 내역
									totalPointsData(); // 보유 포인트
									 $('#gift-wrap-check').prop('checked', false);
									
								},
								error:function(request,status,error){
						    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
								}
								
							 });
						 
						 
						 
						 
					 },
					error:function(request,status,error){
				    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
					 
				 });
			
			 } else {
				 
			 }
			 
			
		 	});
		 
		
	});
	
	/* 포인트 리스트 */
	function pointData(totalData, dataPage, pageCount, currentPage) {
		$('#pointTable').empty();
		var email = $("#user_email").val();
		 $.ajax({
			 url:'/bit_project/getPointList.pt',
			 type:'POST',
			 dataType : "json",
			 data : {"email" : email, "page": currentPage},
			 contentType : 'application/x-www-form-urlencoded; charset=UTF-8', 
			 success:function(data) { 
				 var pointTable1 = '';
				 pointTable1 += '<tr class="line2">';
				 pointTable1 += '<th>변동일</th>';
				 pointTable1 += '<th>내용</th>';
				 pointTable1 += '<th>포인트</th>';
				 pointTable1 += '</tr>';
				 $('#pointTable').append(pointTable1);
			if(data.length != 0) {
				 $.each(data, function(index, point) {
					 var reg_date = new Date(point.occur_date); 
		             var date = date_format(reg_date);  /* 날짜 format */
					 
					 if(point.state == "적립") {
			             var pointTable2 = '';
						 pointTable2 +='<tr class="line2">';
						 pointTable2 +='<td>' + date +'</td>';
						 pointTable2 +='<td>' + point.reason +'</td>';
					 	 pointTable2 +='<td>+' + point.variation +'&nbsp;Point</td>';
						 pointTable2 +='</tr>';
						 $('#pointTable').append(pointTable2);
					 } else {
			             var pointTable2 = '';
						 pointTable2 +='<tr class="line2">';
						 pointTable2 +='<td>' + date +'</td>';
						 pointTable2 +='<td>' + point.reason +'</td>';
						 pointTable2 +='<td style="color:red">' + point.variation +'&nbsp;Point</td>';
						 pointTable2 +='</tr>';
						 $('#pointTable').append(pointTable2);
					 }
					 
				 });
				 
			} else {
				 var pointTable2 = '';
				 pointTable2 +='<tr class="line2">';
				 pointTable2 +='<td colspan="3" style="text-align: center;">' + '포인트 내역이 없습니다.' +'</td>';
				 pointTable2 +='</tr>';
				 $('#pointTable').append(pointTable2);
				
			}	 
				 paging(totalData, dataPage, pageCount, currentPage);
			 },
			 error:function() {
                 alert("ajax통신 실패2!!!");
              }
			 
		 });
	}
	
	/* 페이징 */
	function paging(totalData, dataPage, pageCount, currentPage) {
        var totalPageDevide = totalData / dataPage;
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
            html += "<a href='javascript:pointData(totalData, dataPage, pagecount, " + i + ")' id=" + i + ">" + i + "</a> ";
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

        	        $(".paginate").html(html);    // 페이지 목록 생성
        	        $(".paginate a").removeClass("page_on");

        	        $(".paginate a#" + currentPage).addClass("page_on"); // 현재 페이지 표시	
        }
      

        $(".paginate a").click(function () {
            var $item = $(this);
            var $id = $item.attr("id");
            var selectedPage = $item.text(); // 번호 클릭.



            if ($id == "one") selectedPage = one;
            if ($id == "prev") selectedPage = prev;
            if ($id == "next") selectedPage = next;
            if ($id == "lastNo") selectedPage = lastNo;
            pointData(totalData, dataPage, pageCount, selectedPage);
            paging(totalData, dataPage, pageCount, selectedPage);// 페이징
       
        })
    }
	
	
	
	
</script>
</head>
<body>
	<div class="point_wrap">
                <h2>포인트</h2>
                <div class="point_block">
                    <div class="point_content_1">
                        <b>보유 포인트</b>
                    </div>
                    <div class="point_content_2">
                        <h3 class="point-field"></h3><p>&nbsp;&nbsp;P</p>
                    </div>
                </div>
                <div class="point_history">
                    <h3>포인트 내역</h3>
                    <table id="pointTable">
                    </table>
                    
                </div>
                <div class="paginate" style="text-align:center;"></div>
                <div class="point_use">
                    <h3>포인트 사용</h3><p>&nbsp;&nbsp;&nbsp;&nbsp;(다음결제 또는 배송시 적용됩니다.)</p>
                    <form id="point_form" name="point_form" method="POST" action="#" style="width:100%;">
                    <input type="hidden" id="user_email" name="email" value="<%=user_email %>">
                    <table>
                        <tr class="use_line">
                            <th><input type="radio" name="state" value="차감" class="point_radio" id="subscription-check"><label for="subscription-check">&nbsp;&nbsp;&nbsp;구독료 차감</label></th>
                            <td><input type="text" dir="rtl" class="point_text" id="subscription"></td>
                        </tr>
                        <tr class="use_line">
                            <th><input type="radio" name="state" value="포장" class="point_radio" id="gift-wrap-check"><label for="gift-wrap-check">&nbsp;&nbsp;&nbsp;포장</label></th>
                            <td><input type="text" class="point_text" id="gift-wrap" placeholder="2000" value="2000" readOnly></td>
                        </tr> 
                        <tr class="use_line">
                            <td colspan="3"><input type="button" value="사용하기" class="point_button"></td>
                        </tr>    
                    </table>
                    </form>
                </div>
            </div>
</body>
</html>