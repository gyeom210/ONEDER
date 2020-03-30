<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.member.MemberVO" %>
<%@ page import="java.util.Calendar"%>
<%
	String user_email = (String)session.getAttribute("email");
	MemberVO membervo = (MemberVO)request.getAttribute("membervo");
	String grade = (String)request.getAttribute("grade");
	int price = (int)request.getAttribute("price");
	
	Calendar cal = Calendar.getInstance();
	int date = cal.get(Calendar.DATE);	//날짜
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);	//요일

	String korDayOfWeek = "";
	switch (dayOfWeek) {
		case 1 :
			korDayOfWeek = "일";
			break;
		case 2 :
			korDayOfWeek = "월";
			break;
		case 3 :
			korDayOfWeek = "화";
			break;
		case 4 :
			korDayOfWeek = "수";
			break;
		case 5 :
			korDayOfWeek = "목";
			break;
		case 6 :
			korDayOfWeek = "금";
			break;
		case 7 :
			korDayOfWeek = "토";
			break;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/common1.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
     <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script>
  

  </script>
<script>
$(document).ready(function() {
	$('#oneder').click(function() {
		
		location.href="main.ma";
	});
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
	<div style="height: 50px;">
	<header >
	 	<%@ include file="/WEB-INF/views/header1.jsp" %> 
	</header>
	</div>
    <div class="subContainer">
        <div class="subscribeHeader">
          <ul>
            <li class="on" style="cursor: pointer;" onclick="location.href='#'">
              <h1>1</h1>
              <span>구독선택</span>
            </li>
            <li class="on" style="cursor: pointer;">
              <h1>2</h1>
              <span>결제내역</span>
            </li>
            <li>
              <h1>3</h1>
              <span>결제완료</span>
            </li>
          </ul>
        </div>
      
          <h1 class="text-field">결제 상세 내역을 확인해주세요.</h1>
          
        </div>
        <form id="subscribe-term" action="confirmSubscription.su" method="post">
        <input type="hidden" id="user_email" name="email" value="<%=user_email %>">
        <div class="choiceTerm">
          <div class="">
            <input type="radio" id="choiceTerm01" name="choiceTerm" value="s1MsalePrice" checked>
            <label for="choiceTerm01">
              <span class="Kinds">
               <% if(grade.equals("1month") || grade.equals("2month")) { %>체험판 <% }else{ %>정기결제<%} %></span>
              <span class="loop">첫배송은 넷째주 목요일입니다.</span>
              <input type="hidden" name="SubPrice" value="<%=price%>">
              <div class="option">
                <span id="pwcomma">39,000원</span>
                <span> <% if(grade.equals("2month")) { %>/2개월 <% }else{ %>/1개월<%} %></span>
                <em>배송비무료</em>
              </div>
            </label>
       
          </div>
          <div class="subscribeNext">
            <button type="button" id="subscribe-btn">카카오페이 결제</button>
          </div>
          </form>
          </div>
          <!-- footer 시작 -->
    <footer id="footer">
        <div id="footer_sns">
            <div class="container">
                <div class="footer_sns">
                    <ul>
                        <li class="icon s1"><a href="#"><span class="ir_pm">트위터</span></a></li>
                        <li class="icon s2"><a href="#"><span class="ir_pm">페이스북</span></a></li>
                        <li class="icon s3"><a href="#"><span class="ir_pm">인스타그램</span></a></li>
                        <li class="icon s4"><a href="#"><span class="ir_pm">구글 플레이</span></a></li>
                        <li class="icon s5"><a href="#"><span class="ir_pm">아이폰 앱스토어</span></a></li>
                    </ul>
                    <div class="tel">
                        <a href="#">ARS <em>1544-5252</em></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer_infor">
            <div class="container">
                <div class="row">
                    <div class="footer_infor">
                        <!-- <h2><img src="assets/img/logo_footer.png" alt="megabox"></h2> -->
              <h2 id="oneder" style="color: #8f8f8f; font-size: 30px; margin: 0 10px; cursor:pointer; font-weight: normal; font-family: 'S-CoreDream-4Regular';">ONEDER</h2>  
                        <ul>
                         	    <li><a href="kindergarten.ms">어린이집</a></li>
								<li><a href="partner.ms">파트너</a></li>
								<li><a href="contactus.ms">고객센터</a></li>
								<li><a href="share.ms">개인 쉐어</a></li>
								<li><a href="#">어린이집 쉐어</a></li>
							
                        </ul>
                        <address>
                            <p>서울특별시 서초구 강남대로 459 <br><span class="bar2">대표자명 김진근</span>
                                <br><span class="bar2">사업자등록번호
                                    111-11-1111</span> 통신판매업신고번호 제 111호</p>
                            <p>Copyright 2020 by Bit Inc. All right reserved</p>
                        </address>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer 끝 -->
    
    <script>
   

	  $(document).ready(function() {
		  	/* 가격 콤마 추가 */
			var price = <%=price %>;
			var addComma = price.toLocaleString();
			$("#pwcomma").html(addComma);
		
	  });

    
	  $("#subscribe-btn").on("click", function(){
		  	/*메일 아이디 추출 */
		  	
		  	var email = '<%=user_email%>';
		  	alert(email);
		  	if(email != null) {
		    var beforeStr = $('#user_email').val();
			var afterStr = beforeStr.split('@');
		    var customer_uid = afterStr[0] + afterStr[1];
		    var merchant_uid = 'merchant_' + new Date().getTime();
			
		  	/* 빌링키 난수
			var num = Math.floor(Math.random() * 10000) + 1;;
			var uid = splitStr+num;
			*/
			
			/* 회원 주소 */
			var address = '<%=membervo.getAddress() %>';
			address += ' <%=membervo.getAddress_detail() %>';

			
	  var msg = ''; // 메시지 내용
	  var price = 0;
	  var token = ''; // 인증토큰
	  var IMP = window.IMP; // 생략 가능
	  IMP.init("imp40405865"); // 가맹점 식별코드

	  IMP.request_pay({
		    pg : 'kakaopay', // 결제 방식
		    pay_method : 'card', //결제 수단
		    merchant_uid : merchant_uid,
		    customer_uid: customer_uid, // 카드와 1:1로 대응하는 값
		    amount: 0,
		    name : '빌링키 발급', //order 테이블에 들어갈 주문명 혹은 주문번호
		    buyer_email : $('#user_email').val(), //구매자 email
		    buyer_name : '<%=membervo.getName() %>', //구매자 이름
		    buyer_tel : '<%=membervo.getPhone() %>', //구매자 전화번호
		    buyer_addr : address, //구매자 주소
		    buyer_postcode : '<%=membervo.getPostal_num() %>' //구매자 우편번호
		  /*   m_redirect_url : '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명 */
		}, function(rsp) { //callback
			if(rsp.success) {
				
				/*
				msg = '결제가 완료되었습니다.';
	            msg += '\n고유ID : ' + rsp.imp_uid;
	            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	            msg += '\n결제 금액 : ' + rsp.paid_amount;
	            msg += '\n카드 승인번호 : ' + rsp.apply_num;
	            price += rsp.paid_amount;
	            */
	            
	            //빌링키 발급 성공
	            var imp_uid = rsp.imp_uid;
	            var check = true;
	           $.ajax({ //빌링키 발급 성공시 DB에 정보 보내준 후 subscribe3으로 이동 (sub3에서 결제내용 확인 및 위시리스트 작성으로 이동)
	            	url: "/bit_project/insertSP.su",
	            	type: "POST",
	            	dataType: "json",
	            	data: {
		            	price: <%=price %>,
		            	imp_uid: imp_uid,
						merchant_uid: merchant_uid,
						email: '<%=user_email%>'
	               	},
	            	async : false,
	            	contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	            	success: function(map) {	
	            		if(map.res == "OK") {
	            			
	            		} else {
		            		alert("결제정보 등록에 실패했습니다.")
	            			location.href='subscribestep1.me';
	            		}
	            	}, 
	            	error:function() {
	    				alert("ajax통신 실패!!!");
	    				check = false;
	    			}
	            }); 
	           if(check == true) {
	        	   location.href='<%=request.getContextPath()%>/subscribestep3.me?price='+ <%=price %>;
	           }
	           
		} else {
			msg = '결제가 실패했습니다.';
			msg += '\n에러내용 : ' + rsp.error_msg;
		} 
		
	     <%-- if ( rsp.success ) { //빌링키 발급 성공
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	            url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    			type: 'POST',
    			dataType: 'json',
    			data: {
	    		imp_uid : rsp.imp_uid
	    		//기타 필요한 데이터가 있으면 추가 전달
    		}
		}).done(function (data) {
			//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			if ( everythings_fine ) {
                var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;
                
                alert(msg);
            } else {
            	alert('제대로 결제가 되지 않았거나 자동취소되었습니다.');
                //[3] 아직 제대로 결제가 되지 않았습니다.
                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
            }
	      });
	    	//성공시 이동할 페이지
            location.href='<%=request.getContextPath()%>/subscribestep3.me?msg='+ msg;
	    } else {
	    	var msg = rsp.error_msg; //에러 메세지
	        alert("에러내용 : " + msg);
	    }   --%>
	  }); 
	  } else {
		  alert("로그인 후 이용해주세요");
		  location.href='login.me';
	  }
	  
});   
  
	  </script>
    
</body>
</html>