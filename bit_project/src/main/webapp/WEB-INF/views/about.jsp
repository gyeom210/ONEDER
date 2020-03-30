<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.spring.login.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/about.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/aos.css">
	<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<title>about</title>

</head>

<script>
$(document).ready(function() {
	$('#oneder').click(function() {
		
		location.href="main.ma";
	}); 
});
</script>

<body>
	<%@ include file="/WEB-INF/views/chatframe.jsp" %>
	<div style="height: 60px;">
		<header>
			<%@ include file="/WEB-INF/views/header1.jsp"%>
		</header>
	</div>

	<div class="subcontainer">
		<div style="overflow: hidden;">
			<img
				class="img_desktop" src="${pageContext.request.contextPath}/resources/img/main_test5.PNG"
				style="height: 100%; width: 100%;">
			<img
				class="img_mobile" src="${pageContext.request.contextPath}/resources/img/main_test6.png"
				style="height: 100%; width: 100%;">
		</div>
		<h2 class="h2_style" id="h2_style_1"
			>아동 장난감 렌탈의 모든
			것,</h2>
		<h2 class="h2_style" id="h2_style_2"
			><b style="color:#ea7475; font-size:60px;">ONEDER</b> 에서 간편하게</h2>
	</div>
	<div class="intro-section">

		<div class="intro_first">

			<h1 class="h1_style" data-aos="fade-up" data-aos-duration="1000">ONEDER</h1>
			<span class="mt_1 span_style" data-aos="fade-up"
				data-aos-duration="1000"> ONEDER는 1세부터 7세의 아이들을 대상으로
				매달 새로운 장난감을 받아볼 수 있는 맞춤형 구독 서비스입니다. 구독 신청 후, 배송된 장난감을 아이들이 재밌게 가지고 논
				후에는 선택하신 위시리스트의 다른 장난감으로 랜덤배송 됩니다. 더는 선반 위에서 먼지만 쌓이는 장난감을 사는 데 돈을
				낭비하지 않으셔도 됩니다. </span>
			<h1 class="h1_style" data-aos="fade-up" data-aos-duration="1000">장난감
				대여가 왜 합리적 경제 생활인가요?</h1>
			<span class="mt_1 span_style" data-aos="fade-up"
				data-aos-duration="1000"> 우리 아이의 취향에 맞게 다양한 종류의 장난감을 대여해주는
				ONEDER를 이용함으로써, 한 장난감에 금방 실증을 느끼는 아이들에게 매월 새로운 장난감을 선물해 줄 수 잇습니다.
				또한 가지고 놀지 않는 장난감을 개인쉐어를 맡김으로써 부모님의 부담을 덜며 사회적 나눔을 실천할 수 있습니다. <br><br> ONEDER는 공유 경제의 개념을
				도입하여 자원의 낭비를 막으며, 친환경에 이바지합니다.
			</span>

		</div>

		<div class="intro_second">
			<h3 class="h1_style" data-aos="fade-up" data-aos-duration="1000">ONEDER 이용방법</h3>
			<div class="mt_box">
				<div class="mt_box_module">
					<div class="box_step1" data-aos="fade-up" data-aos-duration="1000"
						data-aos-delay="200">
						<h4>STEP. 1</h4>
						회원가입
					</div>
					<div class="box_step2" data-aos="fade-up" data-aos-duration="1000"
						data-aos-delay="300">
						<h4>STEP. 2</h4>
						구독 신청
					</div>
					<div class="box_step3" data-aos="fade-up" data-aos-duration="1000"
						data-aos-delay="400">
						<h4>STEP. 3</h4>
						위시리스트
					</div>
					<div class="box_step4" data-aos="fade-up" data-aos-duration="1000"
						data-aos-delay="500">
						<h4>STEP. 4</h4>
						배송 및 이용
					</div>
				</div>
			</div>
			<span class="span_style" data-aos="fade-up" data-aos-duration="1000">1단계 - 간단한 회원 가입<br>
				2단계 - 원하시는 구독 종류를 선택<br> 3단계 - 원하는 장난감을 위시리스트에 추가
				<br> 4단계 - 장난감이 배송되기를 기다립니다.
			</span><br> <span class="span_style" data-aos="fade-up" data-aos-duration="1000">반납 일자가 다가오면 사전에
				알려드리며, 택배기사님이 직접 방문합니다.<br> 반납 후에는 다음 장난감이 오기를 기다리면 됩니다.<br>
				(위시리스트의 상품이 3개 이하가 되면 배송이 중지될 수 있습니다.)
				<br>
			</span>
		</div>
		
	</div>
	<div class="intro-section1">

		<div class="mt_2 img2 span_style" data-aos="fade-up" data-aos-duration="1000">
			<span><i class="fas fa-dice-one fa-3x"></i></span> <span style="font-size:20px;">2회 이상
				파손 및 분실 시 서비스 이용이 제한될 수 있습니다.</span>
		</div>
		<br> <br> <br>
		<div class="mt_3 img2 span_style" data-aos="fade-up" data-aos-duration="1000">
			<span><i class="fas fa-dice-two fa-3x"></i></span> <span style="font-size:20px;">구독이
				처음이신 분들을 위해 비정기 체험 서비스를 추천해 드립니다.</span>
		</div>
		<br> <br> <br>
		<div class="mt_4 img2 span_style" data-aos="fade-up" data-aos-duration="1000">
			<span><i class="fas fa-dice-three fa-3x"></i></span> <span style="font-size:20px;">아동
				친화적인 살균 소독제를 이용하여 바이러스(Inf, HSV), 세균 등 99.9% 살균하고 있습니다.</span>
		</div>
		<br> <br> <br>
		<div class="mt_5 img2 span_style" data-aos="fade-up" data-aos-duration="1000">
			<span><i class="fas fa-dice-four fa-3x"></i></span> <span style="font-size:20px;">개인
				SNS(인스타그램)에 리뷰를 작성해주시면 500point 지급.<br> 포인트는 구독료 차감 또는 포장 서비스에 사용 가능합니다.
			</span>
		</div>
	</div>

	<div class="mt_6">
		<div class="mt_6_1">
			<h3 class="span_style">
				장난감 정기구독서비스로<br> 설레임과 기쁨이 있는 시간을 가져보세요<br> <br>
			</h3>
			<input type="button" value="구독하기" name="sub_btn" class="sub_btn"
				onclick="location.href='subscribestep1.me'">
		</div>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>
 
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
	<script>
AOS.init();
</script>
	<script>
	function loginChk(){
		var email_a = '<%=(String)session.getAttribute("email")%>';
			if (email_a != 'null') {
				alert("로그아웃 후 이용해주세요");
				return false;
			} else {
				window.location.href = "signup.me";
			}
		}
	</script>
	
</body>
<style>
#footer{margin-top: 0;}
</style>
</html>