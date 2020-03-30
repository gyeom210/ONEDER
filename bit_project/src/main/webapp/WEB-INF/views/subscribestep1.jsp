<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" dir="ltr">

<head>
<meta http-equiv="Pragma" content="no-cache">
<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html" charset="utf-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link
	href="${pageContext.request.contextPath}/resources/css/common1.css"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/subscribe.js"></script>
<script>
$(document).ready(function(){
	$('#termSelect').click(function() {
		var check = $('input:radio[name="group1"]').is(':checked');
		if(check == false) {
			alert('서비스를 선택해주세요.');
			
		} else {
			$('form[name="selectSubscription"]').submit();
		}
	});
});
	
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
	<div class="subContainer" style= "min-height:850px; ">
		<div class="subscribeHeader">
			<ul>
				<li class="on" style="cursor: pointer;" onclick="location.href='#'">
					<h1>1</h1> <span>구독선택</span>
				</li>
				<li>
					<h1>2</h1> <span>결제내역</span>
				</li>
				<li>
					<h1>3</h1> <span>결제완료</span>
				</li>
			</ul>
		</div>

		<h1 class="text-field">구독 정보를 확인해주세요.</h1>
		<form name="selectSubscription"  method="POST" action="selectSubscription.su">
		<div class="choiceBox">
			<div class="">
	
				<input type="radio" id="choice01" name="si_gift" value="0">
				<label for="choice01">
					<div class="">
						<span class="title">정기결제</span> <span class="txt"> <br />
						<br /> <label><input TYPE="radio" name='group1'
								value='silver' /><em class="level">실버</em><em class="monthly">매달</em>
								29,000원</label><br /> <label><input TYPE="radio" name='group1'
								value='gold' /><em class="level">골드</em><em class="monthly">매달</em>
								59,000원</label><br /> <label><input TYPE="radio" name='group1'
								value='platinum' /><em class="level">플래티넘</em><em
								class="monthly">매달</em> 79,000원</label></span>
					</div>

				</label>
			</div>

			<div class="">
				<input type="radio" id="choice02" name="si_gift" value="1">
				<label for="choice02" class="choiceBox-2">
					<div class="">
						<span class="title">체험판</span> <br />
						<br /> <span class="txt"> <label>
						<label id="choice02"><input TYPE='radio' name='group1' value='1month' /> 34,000원 / 1개월</label></label><br /> <label>
						<input TYPE="radio" name='group1' value='2month' /> 68,000원 / 2개월</label><br />
						</span>
					</div> <!--지우기-->
		
				</label>
			</div>
		</div>
		<div class="subscribeNext">
			<input type="button" id="termSelect" value="다음단계로">
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




</body>


</html>