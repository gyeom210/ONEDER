<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>main</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport"  content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link href="<%=request.getContextPath()%>/resources/css/main_default.css" rel="stylesheet" type="text/css" />
<script src="https://kit.fontawesome.com/fa509a9993.js" crossorigin="anonymous"></script> <!--icon--> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.css"> <!--wow-->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/wow.js"></script><script> new WOW().init(); </script> <!--wow-->

</head>
<body>

<div id="chat">
	<img src="${pageContext.request.contextPath}/resources/img/chat.png"/>
</div>

<!-- <div id="logo">
	<a href="#"><i class="fas fa-bars fa-2x"></i></a>
	<h1><a href="#">로고</a></h1>
</div>
 -->
<div class="video-container">
	<button type="button" name="join_btn" class="join_btn banner_btn1" onclick="location.href='#'">회원가입</button>
	<button type="button" name="sub_btn" class="sub_btn banner_btn2" onclick="location.href='#'">구  독</button>
	<div class="video-main">
		<video id="myVideo" autoplay loop muted >
			<source src="${pageContext.request.contextPath}/resources/video/Musicbox.mp4" type="video/mp4">
		</video>
		<img src="${pageContext.request.contextPath}/resources/img/1.jpg"/> <!-- 모바일일때  -->
	</div>
	<div class='icon-scroll'></div>
</div>

<div id="wrapper1">
<div class="wrapper1_1">
	<h1>오늘부터 시작하세요</h1><br><br>
	<div class="wrapper1_module">
		<div>
			<i class="fas fa-chess-rook fa-3x"></i>
			<p><h3>새제품처럼</h3><br><span>모든 장난감 새로 산것처럼<br>전문가의 꼼꼼한 소독처리</span>
		</div>
		<div>
			<i class="fas fa-gift fa-3x"></i>
			<p><h3>기념일에도</h3><br><span>아이들의 생일에도<br>깜짝 이벤트에도</span>
		</div>
		<div>
			<i class="fas fa-box fa-3x"></i>
			<p><h3>안전 배송</h3><br><span>꼼꼼하고 재활용이 가능한<br>튼튼한 박스로 쓰윽 배송</span>
		</div>
	</div>
</div>
<div class="wrapper1_2">
	<h1>아이에게 맞는 서비스를 선택하세요</h1><br><br>
	<div class="wrapper1_module">
		<div ><i class="fas fa-baby fa-3x"></i></div>
		<div ><i class="fab fa-youtube fa-3x"></i></div>
	</div>
	<br><br>
	<div class="wrapper1_module">
		<div ><i class="fas fa-angle-double-down fa-3x"></i></div>
	</div>
	<div class="wrapper1_module">
		<button type="button" name="about_btn" class="about_btn" onclick="location.href='about.me'">자세히 보기</button>
	</div>
	<hr>
	</div>
</div>

<div id="wrapper2">
	<div class="wrapper2_module">
		<div class="wrapper2_sub">
			<h1>정기구독</h1>
			<div class="wrapper2_sub_module">
				<div class="wow fadeInUp">
					<h2>실버</h2><br>
					<h3 style="color: red">39,000원</h3><br>
					<p>무료배송<br>월 1회 교환<br>이벤트 참여<br>실버 상품</p>
				</div>
				<div class="wow fadeInUp">
					<h2>골드</h2><br>
					<h3 style="color: red">59,000원</h3><br>
					<p>무료배송<br>월 2회 교환<br>이벤트 참여<br>골드 상품</p>
				</div>
				<div class="wow fadeInUp">
					<h2>플래티넘</h2><br>
					<h3 style="color: red">79,000원</h3><br>
					<p>무료배송<br>월 2회 교환<br>이벤트 참여<br>모든 상품</p>
				</div>
			</div>
		</div>
		<div class="wrapper2_nsub">
			<h1>비정기구독</h1><br><br>
			<div class="wrapper2_sub_module">
				<div class="wow fadeInUp">
					<h2>체험</h2><br>
					<h3 style="color: red">29,000원</h3><br>
					<p>무료배송<br>1 ~ 2개월<br>정기 구독<br>전환 가능</p>
				</div>
			</div>
		</div>
	</div>
	<br><br>
	<hr>
	<br><br>
</div>

<div id="wrapper3">
	<div class="wrapper3_module">
		<div class="wrapper3_1">
			<span><h2>우리 아이를 위한<br><br>새로운 선물<br><br>지금 바로<br><br>시작하세요</h2><br><br></span>
			<div class="wrapper3_btn1">
				<button type="button" name="join_btn" class="join_btn1" onclick="location.href='#'">회원가입</button>
				<br>
				<button type="button" name="sub_btn" class="sub_btn1" onclick="location.href='#'">구독신청</button>
			</div>
		</div>
		<div class="wrapper3_2">
			<div class="wrapper3_module1">
				<div class="wrapper3_step1 wow fadeInDown" data-wow-delay= "0.001s">
					<span><h3>STEP. 1</h3><br>회원가입</span>
				</div>
				<div class="wrapper3_step2 wow fadeInDown" data-wow-delay= "0.05s">
					<span><h3>STEP. 2</h3><br>구독 신청 후<br>요금제 선택</span>
				</div>
				<div class="wrapper3_step3 wow fadeInDown" data-wow-delay= "0.1s">
					<span><h3>STEP. 3</h3><br>위시리스트 작성<br>배송 대기</span>
				</div>
			</div>
		</div>
		<br>
		<div class="wrapper3_btn2">
			<button type="button" name="join_btn" class="join_btn1" onclick="location.href='#'">회원가입</button>  
			<button type="button" name="sub_btn" class="sub_btn1" onclick="location.href='#'">구독신청</button>
		</div>
		<br>
	</div>
</div>

<div id="wrapper4">
	<div class="wrapper4_module">
		<div class="wrapper4_1">
			<div>
				<span><h2>매월 넷째주 금요일 배송</h2><br>이 달의 장난감을 받고 싶다면<br>결제일전까지 구독해주세요!</span>
			</div>
		</div>
		<div class="wrapper4_2">
			<img src="${pageContext.request.contextPath}/resources/img/calendar.png"/>
		</div>
	</div>
</div>

		<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>