<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %> 
<%@ page import ="java.sql.Timestamp" %>
<%@ page import ="com.spring.login.LoginVO" %>  
<%
	LoginVO userDetail1 = (LoginVO)session.getAttribute("userDetail");
	String nickname1 = (String)userDetail1.getNickname();
%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>

<!-- 폰트어썸 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/mypage/board.css" rel="stylesheet">

<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/> <!-- 테이블 css -->

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
    
        var lang_kor = {
        "decimal" : "",
        "emptyTable" : "데이터가 없습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
        "infoEmpty" : "0개",
        "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_ 개씩 보기",
        "loadingRecords" : "로딩중...",
        "processing" : "처리중...",
        "search" : "검색 : ",
        "zeroRecords" : "검색된 데이터가 없습니다.",
        "paginate" : {
            "first" : "첫 페이지",
            "last" : "마지막 페이지",
            "next" : "다음",
            "previous" : "이전"
        },
        "aria" : {
            "sortAscending" : " :  오름차순 정렬",
            "sortDescending" : " :  내림차순 정렬"
        }
    };
        
    // 날짜 출력 폼
    function date_format(format) {
		var year = format.getFullYear();
	    var month = format.getMonth() + 1;
	    if(month<10) {
	    	month = '0' + month;
	    }
	    var date = format.getDate();
	    if(date<10) {
	    	date = '0' + date;
	    }
	    var hour = format.getHours();
	    if(hour<10) {
	    	hour = '0' + hour;
	    }
	    var min = format.getMinutes();
	    if(min<10) {
	    	min = '0' + min;
	    }

		return year + "-" + month + "-" + date + " " + hour + ":" + min;
	}
    
    $(document).ready( function () {
 
        //활동내역 가져오기
        $('#board_history').click(function() {
        	
        	var nickname = '<%=nickname1 %>';
        	var text = $('.board_history_btn > b').text();
        	var history = $('.history_drop');
        	
        	if(!(history.is(":visible"))) {
        		//$('#history_drop_table').empty();
        		
        		$.ajax({
        			url:'/bit_project/getAcHistory.my',
        			type:'POST',
        			data: {'nickname': nickname},
        			dataType: 'json',
        			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
        			success: function(data) {	
        				
        				var output = '';
        				var fmdate1 = null;
        				var writedate = null;
        				writedate = data.regist;
        				
        				if(writedate == null) {       					
            				writedate = "최신글이 없습니다";
        				} else {
        					fmdate1 = new Date(data.regist);
        					writedate = date_format(fmdate1);
        				}
        				var fmdate2 = new Date(data.last_connection);
        				var connection = date_format(fmdate2);       		
    				
        				output += '<tr>';
        				output += '<td style="text-align:left;"">마지막 접속일 :</td>';
        				output += '<td>' + connection + '</td>';
        				output += '<td>최근 글 등록일</td>';
        				output += '<td>' + writedate + '</td>';
        				output += '</tr>';
        				output += '<tr>';
        				output += '<td style="text-align:left;">게시글 :</td>';
        				output += '<td>' + data.board_count + '</td>';
        				output += '<td>댓글 :</td>';
        				output += '<td>' + data.comment_count + '</td>';
        				output += '</tr>';
        				output += '<tr>';
        				output += '<td style="text-align:left;">후기 :</td>';
        				output += '<td>' + data.review_count + '</td>';
        				output += '<td>스크랩 :</td>';
        				output += '<td>' + data.scrap_count + '</td>';
        				output += '</tr>';
        				console.log("output:" + output);
        				$('#history_drop_table').append(output); 
        				$('.1').remove();
        				$('.2').remove();
        				$('.3').remove();
        				$('#history_drop_table tr:nth-child(1)').addClass('1');
        				$('#history_drop_table tr:nth-child(2)').addClass('2');
        				$('#history_drop_table tr:nth-child(3)').addClass('3');
        				$('.board_history_btn > b').text('-');
        				history.slideDown();
        			},
        			error:function() {
        				alert("ajax통신 실패!!!");
        			}
        		});
        	} else {
        		$('.board_history_btn > b').text('+');
				history.slideUp();
        	}
        	event.preventDefault();
        }); 
    });
    
</script>


<body>
	<div class="board_list_wrap">
		<div id="board_history">
			<div class="board_history_content">
				<b>활동내역</b>
			</div>
			<div class="board_history_btn">
				<b>+</b>
			</div>
		</div>
		<div class="history_drop">
			<table id="history_drop_table">
		
			<tr class="1">
               <td style="text-align:left;"></td>
               <td></td>
               <td>최근 글 등록일 :</td>
               <td></td>
            </tr>
            <tr class="2">
               <td style="text-align:left;">게시글 :</td>
               <td></td>
               <td>댓글 :</td>
               <td></td>
            </tr>
            <tr class="3">
               <td style="text-align:left;">후기 :</td>
               <td></td>
               <td>스크랩 :</td>
               <td></td>
            </tr>

			</table>
		</div>
    	<table id="foo-table" class="foo-ex">
    		<h2 id="myboard-title"></h2>
			<thead id="foo-table-thead">
      
			</thead>
			<tbody id="foo-table-output">
				
			</tbody>
    	</table>
     </div>
     
</body>
</html>