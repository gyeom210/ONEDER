<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	// 이전페이지 정보
	String pre_url = null;
	if(request.getParameter("pre_url") == null) {
		pre_url = request.getHeader("Referer");
	} else {
		pre_url = request.getParameter("pre_url");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>로그인</title>
<script>
	function login() {
		var email = $('#loginId').val();
		var password = $('#loginPw').val();
		if(email == "") {
			alert("아이디(E-MAIL)을 입력해주세요.");
			$('#loginId').focus();
			return false;
		} 
		if(password == "") {
			alert("비밀번호를 입력해주세요.");
			$('#loginPw').focus();
			return false;
		}
		$('#loginForm').submit();
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
 
             // 엔터키가 눌렸을 때 실행할 내용
             login();
        }
	}

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
<!-- <img src="${image.filepath }"/>  로그인시 프로필이미지 불러오기 // 로그인성공시 정보 session에 저장하는걸로 수정해야함--> 
	<div style="height: 50px;">
	<%@ include file="/WEB-INF/views/chatframe.jsp" %>
	<header >
	 	<%@ include file="/WEB-INF/views/header1.jsp" %> 
	</header>
	</div>
	<div id="content">
		<div id="login-content">
			<p id="pc-text" style="text-align: center;">
				아직 <b style="color:#ea7475; font-size:20px;">ONEDER</b> 회원이 아니신가요?<br /> 지금 바로 가입하시고 다양한 혜택을 누리세요!
			</p>

			<h1>로그인</h1>

			<form method="POST" id="loginForm" name="loginForm" action="nomal_login.me">
				<div class="input-block">
					<div class="ipt-email">
						<input type="email" id="loginId" name="email"
							placeholder="아이디 (E-MAIL)" />
					</div>
					<div class="ipt-pwd">
						<input type="password" id="loginPw" name="password"
							placeholder="비밀번호" onkeyup="enterkey();" />
					</div>
				</div>
				<div class="login-append">
					<div class="txt-signup">
						<label for="signup" class="link-signup"> <a href="signup.me"
							class="link-find">회원가입</a>
						</label>
					</div>
					<span class="txt-find">
						<a href="forgotIdPw.me" class="link-find">이메일 / 비밀번호 찾기</a>
					</span>
				</div>
				<input type="hidden" name="pre_url" value="<%=pre_url %>">
				<input type="button" class="btn-login" value="로그인" onclick="login();">

				<div>
					<span>
						<button type="button" onclick="location.href='${naver_Url}'" id="btn-left">
							<img
								src="${pageContext.request.contextPath}/resources/img/naverLogin.png"
								style="width: 167px; height: 36px; border-radius:5px;" />	
						</button>					
					</span> <span>
						<button type="button" onclick="location.href='${kakao_Url}'" id="btn-right">
							<img
								src="${pageContext.request.contextPath}/resources/img/kakaoLogin.png"
								style="width: 167px; height: 36px; border-radius:5px;" />
						</button> <br />
					<br />
					</span>
				</div>
			</form>
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
              <h2 id="oneder" style="color: #8f8f8f; font-size: 30px; margin: 0 10px; cursor:pointer; font-weight: normal; font-family: 'S-CoreDream-4Regular';">ONEDER</h2>  
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
