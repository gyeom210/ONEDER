<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.login.LoginVO" %>
<%@ page import="java.util.*, com.spring.payment.*" %>
<%
	LoginVO userDetail_subs = (LoginVO)session.getAttribute("userDetail");
	String email_subs = (String)session.getAttribute("email");
	
	SubscriptionVO sub_subs = new SubscriptionVO();
	if(request.getAttribute("subvo") != null) {
		sub_subs = (SubscriptionVO)request.getAttribute("subvo");
	}
	
	String state_subs = null;
	if(userDetail_subs.getSubscribe().equals("Y")) {
		state_subs = sub_subs.getState();
	}
	
	String regrade = "";
	if(request.getAttribute("regrade") != null) {
		regrade = (String)request.getAttribute("regrade");
	}
%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 폰트어썸 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/mypage/subscribe.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="subscribe_wrap">
                <h2>구독</h2>
                <div class="subscribe_block" style="margin-bottom:20px;">
                  <% if(userDetail_subs.getSubscribe().equals("N")) { %>
                    <div class="subscribe_content_1">
                        <b>미구독</b><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정기구독을 이용해보세요</p>
                    </div>
                    <div class="subscribe_content_2">
                        <a href="subscribestep1.me"><b>구독하기 ></b></a>
                    </div>
                  <% } else { %>
                  <% if(state_subs.equals("구독취소")) { %>
                   <div class="subscribe_content_1">
                        <b>취소신청</b><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다음결제일까지 이용가능합니다</p>
                    </div>
                    <div class="subscribe_content_2">
                        <a href="#" onclick="subCancel2('<%=email_subs%>');" ><b>취소 ></b></a>
                    </div>
                    <% } else if(!regrade.equals("")) { %>               
                    <div class="subscribe_content_1">
                        <b>변경신청</b><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다음결제부터 <b style="color:#ea7475;"><%=regrade %></b>등급으로 변경됩니다.</p>
                    </div>
                    <div class="subscribe_content_2">
                        <a href="#" onclick="regradeCancel('<%=email_subs%>');" ><b>변경취소 ></b></a>
                    </div>                
                  <% 
                  	   } else {             
                   %>
                   		<div class="subscribe_content_1">
                        <b>구독중</b><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서비스를 이용중입니다</p>
                    </div>
                    <div class="subscribe_content_2">
                        <a href="#" onclick="subCancel('<%=email_subs%>');" ><b>구독취소 ></b></a>
                    </div>   
                   <%
                  	   }
                  	}
                   %>
                </div>
                <%   
                	if(!userDetail_subs.getSubscribe().equals("N") && regrade.equals("") && !state_subs.equals("구독취소")) {
                %>
                	 <div class="subscribe_block" style="margin-top: 20px; margin-bottom: 10px;">
                	 	<div class="subscribe_content_1">
                        <b style="border:none; font-size:14px;">등급선택</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="cgrade" value="실버">실버&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="cgrade" value="골드">골드&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="cgrade" value="플래티넘">플래티넘
                    </div>
                    <div class="subscribe_content_2">
                        <a href="#" onclick="changeGrade('<%=email_subs%>');" ><b>등급변경 ></b></a>
                    </div>   
                	 </div>
                	 <div style="margin-bottom:40px;">
                	 	<p style="font-size:13px;">&nbsp;ㆍ등급변경은 결제일 일주일전까지 가능합니다.&nbsp;&nbsp;&nbsp;(결제예약전)</p>
                	</div> 
                <%
                	}
                %>
                
                <div class="pay_block">
                    <h3>자동 결제 정보</h3>
                    <table>
                        <tr class="line">
                            <th>결제일</th>
                            <th>등급</th>
                         	<th>포인트차감</th>
                            <th>결제금액</th>
                            <th>상태</th>
                        </tr>                   
                    </table>
                     <div class="paginate1" style="text-align:center; margin-top: 10px;"></div>
                </div>
                <div class="product_history">
                    <h3>히스토리</h3>
                    <table>
                        <tr class="line">
                            <th colspan="1">기간</th>
                            <th colspan="2">상품명</th>
                            <th colspan="2">상태</th>
                        </tr>
                    </table>
                    <div class="paginate2" style="text-align:center; margin-top: 10px;"></div>
                </div>
           
            </div>
            

<script type="text/javascript">
function subCancel(email) {
       if (confirm("구독 취소 신청을 하시겠습니까?")) { //Y
       	$.ajax({
				url:'/bit_project/mypage_subscribe_cancel.my',
				type: 'POST',
				data:{'email' : email},
				dataType: "json",
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(retVal) {
					if (retVal.res == "OK") {
						alert("구독취소 신청이 완료되었습니다.");
					}
					else {
						alert("구독취소 신청 실패");
					}
				},
				error:function(request,status,error){
			    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
       	}); //ajax
       } else { //N
       		alert("구독취소 신청을 취소하였습니다.");
       		return false;
		}
   	location.href="mypage_main.my";
 }

function subCancel2(email) {
    if (confirm("취소 하시겠습니까?")) { //Y
    	$.ajax({
				url:'/bit_project/mypage_subscribe_cancel2.my',
				type: 'POST',
				data:{'email' : email},
				dataType: "json",
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(retVal) {
					if (retVal.res == "OK") {
						alert("취소 신청이 완료되었습니다.");
					}
					else {
						alert("취소 신청 실패");
					}
				},
				error:function(request,status,error){
			    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
    	}); //ajax
    } else { //N
    		return false;
		}
	location.href="mypage_main.my";
}

function changeGrade(email) {
	 
     if (confirm("등급을 변경 하시겠습니까? 비정기로 변경은 불가능합니다.")) { //Y
        var cgrade = document.getElementsByName('cgrade');
        var grade;
        for(var i = 0; i < cgrade.length; i++) {
			if(cgrade[i].checked) {
				grade = cgrade[i].value;
			}
        }       
		
        if(grade != '<%=sub_subs.getGrade()%>') {
    	$.ajax({
				url:'/bit_project/mypage_subscribe_change.my',
				type: 'POST',
				data:{
					  'email' : email,
					  'subscribe_num' : '<%=sub_subs.getSubscribe_num()%>',
					  'grade' : grade
					},
				dataType: "json",
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(retVal) {
					if (retVal.res == "OK") {
						alert("변경신청이 완료되었습니다.");
					}
					else {
						alert("변경신청 실패");
					}
				},
				error:function(request,status,error){
			    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
    	}); // ajax
        } else{
            alert("현재 등급과 동일합니다.");
            location.href="mypage_main.my";
        }
    } else { // N
    	return false;
	}
 	location.href="mypage_main.my";
}

function regradeCancel(email) {
	if (confirm("구독등급 변경을 취소하시겠습니까?")) { //Y
		$.ajax({
			url:'/bit_project/mypage_subscribe_changecancel.my',
			type: 'POST',
			data:{
				  'email' : email,
				},
			dataType: "json",
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(retVal) {
				if (retVal.res == "OK") {
					alert("변경취소했습니다.");
				}
				else {
					alert("변경취소 실패");
				}
			},
			error:function(request,status,error){
		    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
	} else {
		return false;
	}
	location.href="mypage_main.my";
}
 
 
</script>
</body>
</html>