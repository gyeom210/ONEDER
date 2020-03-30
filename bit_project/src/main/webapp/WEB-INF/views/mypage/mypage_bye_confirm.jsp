<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="${pageContext.request.contextPath}/resources/css/mypage/confirm.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- 폰트어썸 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
</head>
<body>
    <header>
<div id="wrap">
        <div id="intro_bg">
            <div class="header">
                <div class="main">
                    <li><img src="${pageContext.request.contextPath}/resources/img/rumi.jpg"></li>
                </div>
                <ul class="nav">

                    <div class="login_text"><a href="#">로그인</a></div>

                    <li><input type="checkbox" id="menuicon">
                        <label for="menuicon">
                            <span></span>
                            <span></span>
                            <span></span>
                        </label>

                        <div class="sidebar">
                            <div id="sidemenu">
                                <table class="menu_w">
                                    <tbody>
                                        <tr>  
                                            <td><button name="button" class="subscribe-btn" onclick="location.href='//'"
                                                    type="button">구독하기</button></td>
                                            <td ><a href="#a">커뮤니티</a></td>
                                            <td><a href="#a">상품보기</a></td>
                                            <td><a href="#a">QnA</a></td>
                                        </tr>
                                        <tr>
                                            <td><button name="button" class="subscribe-btn" onclick="location.href='//'"
                                                    type="button">회원가입</button></td>
                                            <td><a href="#a">이용방법</a></td>
                                            <td><a href="#a">어린이집</a></td>
                                            <td><a href="#a">파트너</a></td> 
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="menu_m" >   
                                    <tbody>       
                                                               
                                     <tr><td><button name="button1" class="subscribe-btn" onclick="location.href='//'"
                                                    type="button" >구독하기</button></td></tr>
                                        <tr><td><button name="button1" class="subscribe-btn" onclick="location.href='//'"
                                                    type="button">회원가입</button></td></tr>
                                        <tr><td><a href="#a">이용방법</a></td></tr>
                                        <tr><td><a href="#a">어린이집</a></td></tr>
                                        <tr><td><a href="#a">파트너</a></td></tr> 
                                        <tr><td><a href="#a">커뮤니티</a></td></tr>
                                        <tr><td><a href="#a">상품보기</a></td></tr>
                                        <tr><td><a href="#a">QnA</a></td></tr>
                                   
                                    </tbody>
                                </table>                       
                            </div>
                        </div>
                        
                    </li>

                </ul>
            </div>
        </div>
    </div>
</header>
    <div id="article_wrap">
        <article class="main_article">
            <div class="main_top">
                <h1>회원 탈퇴가 완료되었습니다.</h1>
            </div>
            <div class="main_center">
                <h3>그동안 진근이네를 이용해 주셔서 감사합니다.</h3>
                <p>보다 더 나은 서비스로 다시 찾아뵙겠습니다.</p>
            </div>
            <div class="main_bottom">
                <input type="button" value="메인으로">
            </div>
        </article>
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