<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link rel="stylesheet"
	href="<c:url value="/resources/css/contactus.css" />">

<!-- 페이스북 메타 태그 -->
<meta property="og:title" content="" />
<meta property="og:url" content="https://" />
<meta property="og:image" content="https://.jpg" />
<meta property="og:description" content="" />

<!-- 트위터 메타 태그 -->
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="">
<meta name="twitter:url" content="https:///">
<meta name="twitter:image" content="https://.jpg">
<meta name="twitter:description" content="">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/footer.css"
	rel="stylesheet" type="text/css" />
</head>

<body>

<%@ include file="/WEB-INF/views/chatframe.jsp" %>
	<div style="height: 60px;">
		<header>
			<%@ include file="/WEB-INF/views/header3.jsp"%>
		</header>
	</div>
	<div id="contact-us-wrapper">
		<div id="logo">
			<h1>Contact Us</h1>
		</div>
		<br> <br>
		<div id="contact-us-form">
			<form action="contactus_mailsend.ms" method="POST">
				<table>
					<tr>
						<td class="field-text2">이름</td>
					</tr>
					<tr>
						<td><input class="field-text" type="text" name="name"
							placeholder="내용을 입력해주세요."></td>
					</tr>
					<tr>
						<td class="field-text2">연락처</td>
					</tr>
					<tr>
						<td><input class="field-text" type="text" name="phone"
							placeholder="내용을 입력해주세요."></td>
					</tr>
					<tr>
						<td class="field-text2">이메일</td>
					</tr>
					<tr>
						<td><input class="field-text" type="text" name="email"
							placeholder="내용을 입력해주세요."></td>
					</tr>
					<tr>
						<td class="field-text2">문의사항</td>
					</tr>
					<tr>
						<td><textarea name="content" class="text-area" rows="5"
								cols="20"></textarea></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><div class="span">
								<button class="btn">제출</button>
							</div></td>
					</tr>

				</table>
				<input type="hidden" name="to" value="tazo0519@naver.com">
				<!-- 여기에 자신의 이메일 계정 -->
				<input type="hidden" name="from" value="tazo0519@naver.com">
				<!-- 여기에 자신의 이메일 계정 -->
			</form>
		</div>

		<hr>
		<div id="map-wrapper"style="width: 1280px; margin: 0 auto;">
			<div id="map"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbb3254cd74d562e441c933eb6805411"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center : new kakao.maps.LatLng(37.502987, 127.024200),
					level : 3
				};

				var map = new kakao.maps.Map(container, options);
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(37.502987, 127.024200); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				var iwContent = '<div style="padding:5px">비트캠프 <br><a href="https://map.kakao.com/link/map/비트캠프 ,37.502987, 127.024200" style="color:#ffb0b1" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/비트캠프,37.502987, 127.024200" style="color:#ffb0b1" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(37.502987, 127.024200); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				    
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker);
				
				
				function setCenter(lat, lng) {
					map.setCenter(new kakao.maps.LatLng(lat, lng));
				}
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			</script>
			<div id="information">
				<table>
					<tr>
						<td><img src="./resources/img/icon1.PNG"></td>
						<td><b>주소</b></td>
						<td>서울시 강남구 도산대로 89길 49</td>
					</tr>
					<tr>
						<td><img
							src="<%=request.getContextPath()%>/resources/img/icon2.PNG"></td>
						<td><b>TEL</b></td>
						<td>010-3565-5410</td>
					</tr>
					<tr>
						<td><img
							src="<%=request.getContextPath()%>/resources/img/icon3.PNG"></td>
						<td><b>FAX</b></td>
						<td>010-3565-5410</td>
					</tr>
					<tr>
						<td><img
							src="<%=request.getContextPath()%>/resources/img/icon4.PNG"></td>
						<td><b>E.mail</b></td>
						<td>tazo0519@naver.com</td>
					</tr>
				</table>
			</div>
		</div>
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
								<li><a href="kindergarten.ms">어린이집</a></li>
								<li><a href="partner.ms">파트너</a></li>
								<li><a href="contactus.ms">고객센터</a></li>
								<li><a href="share.ms">개인 쉐어</a></li>
								<li><a href="#">어린이집 쉐어</a></li>
							
					</ul>
					<address>
						<p>
							서울특별시 서초구 강남대로 459 <br> <span class="bar2">대표자명 김진근</span> <br>
							<span class="bar2">사업자등록번호 111-11-1111</span> 통신판매업신고번호 제 111호
						</p>
						<p>Copyright 2020 by Bit Inc. All right reserved</p>
					</address>
				</div>
			</div>
		</div>
	</div>
</footer>
	</div>
	
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {
	$('#oneder').click(function() {
		
		location.href="main.ma";
	}); 
});
</script>

</html>