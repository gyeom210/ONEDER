<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<script src="${pageContext.request.contextPath}/resources/js/forgotIdPw.js"></script>
<title>Insert title here</title>

</head>
<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
	<div style="height: 50px;">
	<header >
	 	<%@ include file="/WEB-INF/views/header2.jsp" %> 
	</header>
	</div>
	<div id="content">
		<h1>ONEDER 이메일/비밀번호 찾기</h1>
		<div class="content-box">

			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">이메일 찾기</li>
				<li class="tab-link" data-tab="tab-2">비밀번호 찾기</li>
			</ul>
			<!-- 이메일 찾기 tab -->
			<form action="findemail.me">
				<div id="tab-1" class="tab-content current">
					<div class="ipt">
						<input type="text" name="name" class="checkfield" placeholder="이름">
					</div>
					<div class="ipt">
						<input type="text" name="phone" placeholder="핸드폰번호">
					</div>
					<button type="submit" class="find-btn">이메일 찾기</button>
				</div>
			</form>
			<!-- 비밀번호 찾기 tab -->
			<form action="findpassword.me">
				<div id="tab-2" class="tab-content">
					<div class="ipt">
						<input type="email" id="findId" name="email"
							placeholder="아이디 (E-MAIL)" />
					</div>
					<div class="ipt">
						<input type="text" name="name" class="checkfield" placeholder="이름">
					</div>
					<div class="ipt">
						<input type="text" name="phone" placeholder="핸드폰번호">
					</div>
					<button type="submit" class="find-btn">비밀번호 찾기</button>
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