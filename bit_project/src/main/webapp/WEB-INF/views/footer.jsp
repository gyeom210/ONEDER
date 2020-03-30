<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!-- 폰트어썸 아이콘 -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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

 <!-- 웹 폰트 -->
 <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>	
$(document).ready(function() {
	$('#oneder').click(function() {
		 
		location.href="main.ma";
	});
});
</script>

<body>
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
                        <ul style="margin-bottom: 0px;">  
                           		<li><a href="kindergarten.ms">어린이집</a></li>
								<li><a href="partner.ms">파트너</a></li>
								<li><a href="contactus.ms">고객센터</a></li>
								<li><a href="share.ms">개인 쉐어</a></li>
								<li><a href="#">어린이집 쉐어</a></li>
							
                        </ul>
                        <address>
                            <p style="margin-bottom: 0px;">서울특별시 서초구 강남대로 459 <br><span class="bar2" style="color: #8f8f8f;">대표자명 김진근</span>
                                <br><span class="bar2" style="color: #8f8f8f;">사업자등록번호
                                    111-11-1111</span> 통신판매업신고번호 제 111호</p>
                            <p>Copyright 2020 by Bit Inc. All right reserved</p>
                        </address>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    </body>
    
