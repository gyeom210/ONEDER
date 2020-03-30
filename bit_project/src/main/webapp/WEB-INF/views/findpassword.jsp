
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="${pageContext.request.contextPath}/resources/css/member.css"
	rel="stylesheet">
<title>Document</title>
</head>
<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
	<div style="height: 50px;">
	<header >
	 	<%@ include file="/WEB-INF/views/header2.jsp" %> 
	</header>
	</div>
	<div id="fe-content">
		<div id="find-content">
			<h1>비밀번호 찾기</h1>
			<div style="height: 80px"></div>
			<h4>새로운 비밀번호를 이메일로 발송했습니다.</h4>
			<div style="height: 40px"></div>
			<div class="btnfield">
				<span>
					<button class="login-btn" onclick="location.href='login.me'">
						로그인하러 가기</button>
				</span> <span>
					<button class="home-btn" onclick="location.href='main.ma'">홈으로
						가기</button>
				</span>
			</div>
		</div>
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
						<li class="icon s4"><a href="#"><span class="ir_pm">구글
									플레이</span></a></li>
						<li class="icon s5"><a href="#"><span class="ir_pm">아이폰
									앱스토어</span></a></li>
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
						<h2>로고1</h2>
						<ul>
							<li><a href="#">회사소개</a></li>
							<li><a href="#">채용정보</a></li>
							<li><a href="#">제휴/광고/부대사업 문의</a></li>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">개인정보처리방침</a></li>
							<li><a href="#">고객센터</a></li>
							<li><a href="#">윤리경영</a></li>
						</ul>
						<address>
							<p>
								서울특별시 서초구 강남대로 459 <br>
								<span class="bar2">대표자명 김진근</span> <br>
								<span class="bar2">사업자등록번호 111-11-1111</span> 통신판매업신고번호 제 111호
							</p>
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