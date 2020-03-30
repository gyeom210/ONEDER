<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.product.ProductVO" %>
<%@ page import="com.spring.login.LoginVO" %>

<%
    ProductVO prVO = (ProductVO)request.getAttribute("prVO");
	LoginVO userDetail = (LoginVO)session.getAttribute("userDetail");
	
	String img = (String)session.getAttribute("img");
	String nickname = (String)session.getAttribute("nickname");
	int bookmark = 0, wishlist = 0, reservation = 0, alarm = 0, _grade = 0;
	String email = "", phone="", usergroup="", subs_grade = "";
	
	try {
		if(userDetail.getUsergroup().equals("admin")) {
			usergroup = userDetail.getUsergroup(); //관리자인지 확인
			System.out.println("관리자다");
		} 
		if((String)session.getAttribute("email")!=null){
			email = (String)session.getAttribute("email");
			phone = userDetail.getPhone();
		}
		
		if((int)request.getAttribute("bookmark")!=0){
			bookmark = 1;
		}
		if((int)request.getAttribute("wishlist")!=0){
			wishlist = (int)request.getAttribute("wishlist");
		}
		if((int)request.getAttribute("reservation")!=0){
			reservation = (int)request.getAttribute("reservation");
		}
		if((int)request.getAttribute("alarm")!=0){
			alarm = 1;
		}
		if((String)request.getAttribute("subsGrade")!=null){
			subs_grade = (String)request.getAttribute("subsGrade"); 
			if(subs_grade.equals("실버")){
				if(prVO.getCategory_l().equals("실버") || prVO.getCategory_l().equals("개인쉐어")){
					_grade = 0;
				}else {
					_grade = 1;
					
				}
			}else if(subs_grade.equals("골드")){
				if(prVO.getCategory_l().equals("플레티넘")){
					_grade = 0;
				}else {
					_grade = 1;
				}
			}else{
				_grade = 0;
			}
		}
	}catch (NullPointerException e) {
		e.getMessage();
	}finally {
		/* System.out.println("닉네임 : "+nickname);
		System.out.println("북마크 : "+bookmark);
		System.out.println("위시 : "+wishlist);
		System.out.println("레저 : "+reservation);
		System.out.println("이메일 : "+email);
		System.out.println("폰 : "+phone);
		System.out.println("알람 : "+alarm);
		System.out.println("구독등급 : "+subs_grade);
		System.out.println("상품등급 : "+prVO.getCategory_l());
		System.out.println("구독가능여부 : "+_grade); */
		
	}
	
    %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=no">
    <title>상품리스트</title>
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset20.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style20.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper.css">

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
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
        rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
    <script> 
        var p = <%=prVO.getProduct_num() %>;
        var sessionChk = "<%=email%>";
        var nick = "<%=nickname%>";
        var usergroup ="<%=usergroup%>";
        var mgrade = 0;
        mgrade = <%=_grade%>;
    </script>
</head>

<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
   <header>
<div id="wrap">
        <div id="intro_bg">
            <div class="header">
                <div class="main">
                    <h1 class="" style="font-weight: 900; text-transform: uppercase; margin-top:10px; font-size: 2.5rem; line-height: 1.2;">
						<a href="main.ma" class="" style="color: #ea7475;">Oneder</a>
				   </h1>
                </div>
                <ul class="nav">
					<%
						if(img != null) {
					%>
						<div class="logout_text" style="margin:auto 20px auto 0;" onclick="location.href='logout.me'">
							<p style="cursor:pointer; font-size:16px;">로그아웃</p>
						</div>					
						<div class="header_img" style="margin-top:6.5px; margin-right:5px;">
							<% if(userDetail.getUsergroup().equals("admin")) { %>
							<img src="<%=img %>" id="rumi" onclick="location.href='index.se'" style="box-sizing:border-box; border-radius:50px; width:55px; height:55px; border:2px solid #EA7475; margin:0; cursor:pointer;">
						<% }else { %>
							<img src="<%=img %>" id="rumi" onclick="location.href='mypage_main.my'" style="box-sizing:border-box; border-radius:50px; width:55px; height:55px; border:2px solid #EA7475; margin:0; cursor:pointer;">
						<% } %>
						</div>

					<%
						} else {
					%>
                    <div class="login_text"><a href="login.me">로그인</a></div>
                    <%
						}
                    %>

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
                                            <td><button name="button" class="subscribe-btn" onclick="location.href='subscribestep1.me'"
                                                    type="button">구독하기</button></td>
                                            <td ><a href="community.co">커뮤니티</a></td>
                                            <td><a href="product.pr">상품보기</a></td>
                                            <td><a href="qna.se">QnA</a></td>
                                            <td><a href="contactus.ms">Contact Us</a></td>
                                        </tr>
                                        <tr>
                                            <td><button name="button" class="subscribe-btn" onclick="location.href='signup.me'"
                                                    type="button">회원가입</button></td>
                                            <td></td>       
                                            <td><a href="about.ma">이용방법</a></td>
                                            <td><a href="kindergarten.ms">어린이집</a></td>
                                            <td><a href="partner.ms">파트너</a></td> 
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="menu_m" >   
                                    <tbody>       
                                                               
                                     <tr><td><button name="button1" class="subscribe-btn" onclick="location.href='subscribestep1.me'"
                                                    type="button" >구독하기</button></td></tr>
                                        <tr><td><button name="button1" class="subscribe-btn" onclick="location.href='signup.me'"
                                                    type="button">회원가입</button></td></tr>
                                        <tr><td><a href="about.ma">이용방법</a></td></tr>
                                        <tr><td><a href="kindergarten.ms">어린이집</a></td></tr>
                                        <tr><td><a href="partner.ms">파트너</a></td></tr> 
                                        <tr><td><a href="community.co">커뮤니티</a></td></tr>
                                        <tr><td><a href="product.pr">상품보기</a></td></tr>
                                        <tr><td><a href="qna.se">QnA</a></td></tr>
                                        <tr><td><a href="contactus.ms">Contact Us</a></td></tr>
                                
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

    <div class="bom"></div>
    <!-- 상품상세 content div-->
    <div class="container">
        <div class="wrap_product">
            <!-- -->
            <!-- 상품상세 content 왼쪽 이미지 div -->
            <div class="product_left">
                <div class="slider">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                        <%if(prVO.getImg_sum()!=null){ %>
                            <div class="swiper-slide ss1" style="background: url(/bit_project/image/<%=prVO.getImg_sum() %>) no-repeat center center; background-size: cover;">
                            </div>
                        <%} %>
                        <%if(prVO.getImg_main()!=null){ %>
                            <div class="swiper-slide ss2" style="background: url(/bit_project/image/<%=prVO.getImg_main() %>) no-repeat center center; background-size: cover;">
                            </div>
                        <%} %>
                        <%if(prVO.getImg_detail()!=null){ %>
                            <div class="swiper-slide ss3" style="background: url(/bit_project/image/<%=prVO.getImg_detail() %>) no-repeat center center; background-size: cover;">
                            </div>
                        <%} %>
                        </div>
                        <div class="swiper-pagination"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
            </div>
            <!-- 상품상세 content 왼쪽 이미지 div -->


            <!-- 상품상세 content 오른쪽 상품정보 div -->
                <div class="product_right">
                    <span
                        class="product_cate1"><%=prVO.getCategory_l() %>&nbsp;>&nbsp;<%=prVO.getCategory_m() %>&nbsp;>&nbsp;<%=prVO.getCategory_s() %>
                        <%-- 조회수 : <%=prVO.getReadcount() %> --%></span>
                    <span class="product_cate2">
                        <input type="checkbox" id="wishlist-pid-0001">
                        <label for="wishlist-pid-0001">
                            <i class="far fa-heart fa-2x" aria-hidden="true"></i>
                            <i class="fas fa-heart fa-2x" aria-hidden="true"></i>
                        </label>
                    </span>
                    <hr style="width:100%; border: 1px solid #c6c6c6;">
                    <div class="pvofamily">
                    <div class="pvomanu"><%=prVO.getManufacturer() %></div>
                    <br>
                    <div class="pvopname"><%=prVO.getProduct_name() %></div>
                    <br>
                    <div class="pvopcon"><textarea name="product_content" maxlength="100" rows="12" ><%=prVO.getProduct_content() %></textarea></div>
                    </div>
                    <%-- <hr style="border: 0.5px solid #c5c5c5;">
                    <div>총수량 : <span><%=prVO.getTotal_amount()%></span></div> --%>
                    <div class="pvocur">남은수량 : <span><%=prVO.getCurrent_amount()%>
                            <%if(prVO.getTotal_amount()==0 && email!=null){ %>
                            <a href="javascript:void(0)" onclick="amount_alert();" class="alarm_btn">입고알림</a>
                            <%} %>
                        </span>
                    <% if(usergroup.equals("admin")) { %>
                    <button type="button" class="btn btn-sm jeon2"  style="margin: 3px; float:right; font-size: 14px; width: 75px; height: 33px; border-radius: 5PX;" onclick="prModify();">상품수정</button>
      				<button type="button" class="btn btn-sm jeon3"  style="margin: 3px; float:right; font-size: 14px; width: 75px; height: 33px; border-radius: 5PX;" onclick="prDelete();">상품삭제</button>
             		<%} %>
                    </div>
               <!--      <div>제품특징</div>
                    <div>
                        <span>#펭수&nbsp;&nbsp;</span><span>#펭수&nbsp;&nbsp;</span><span>#펭수&nbsp;&nbsp;</span><span>#펭수&nbsp;&nbsp;</span>
                    </div> -->
                    <hr style="border: 1px solid #c6c6c6;">
                    <div class="filter-search">
                        <div><button id="wish_button">위시리스트</button></div>
                        <div class="wishlistForm_true" style="display:none;">
                            <h2>선택하신 상품을 위시리스트에 등록하였습니다. <br>마이페이지에서 확인하시겠습니까?</h2>
                            <br>
                            <div class="wishlist_true_btn">
                                <a href="javascript:void(0)">예</a>
                                <a href="javascript:void(0)">아니오</a>
                            </div>
                        </div>

                        <div class="wishlistForm_false" style="display:none;">
                            <h2>위시리스트 해제되었습니다.</h2>
                            <br>
                            <div class="wishlist_false_btn">
                                <a href="javascript:void(0)">확인</a>
                            </div>
                        </div>
                        <div><button id="reservation_button">예약</button></div>
                        <div class="reservationForm_true" style="display:none;">
                            <h2>선택하신 상품이 예약되었습니다.<br>마이페이지에서 확인하시겠습니까?</h2>
                            <br>
                            <div class="reservation_true_btn">
                                <a href="javascript:void(0)">예</a>
                                <a href="javascript:void(0)">아니오</a>
                            </div>
                        </div>

                        <div class="reservationForm_false" style="display:none;">
                            <h2>예약 해제되었습니다.</h2>
                            <br>
                            <div class="reservation_false_btn">
                                <a href="javascript:void(0)">확인</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bookmarkForm_true" style="display:none;">
                        <h2>선택하신 상품을 찜하였습니다. <br>마이페이지에서 확인하시겠습니까?</h2>
                        <br>
                        <div class="bookmark_true_btn">
                            <a href="javascript:void(0)">예</a>
                            <a href="javascript:void(0)">아니오</a>
                        </div>
                    </div>

                    <div class="bookmarkForm_false" style="display:none;">
                        <h2>찜 해제되었습니다.</h2>
                        <br>
                        <div class="bookmark_false_btn">
                            <a href="javascript:void(0)">확인</a>
                        </div>
                    </div>
                </div><!-- pright -->
			
            <!-- 상품상세 content 오른쪽 상품정보 div -->
            <form id="amount_alarm" method="GET">
                <input type="hidden" name="alert_email" value="<%=email %>" />
                <input type="hidden" name="alert_pnum" value="<%=prVO.getProduct_num() %>" />
                <input type="hidden" name="alert_phone" value="<%=phone %>" />
            </form>
            <!-- 버튼 -->

        </div>
    </div> <!-- -->
	<br>


    <!-- 상품상세 content div-->

    <!-- 상품정보 네비게이션 바 -->
   <section class="product_nav">
        <div class="container">
            <div class="pnav">
                <nav class="nav_bar">
                    <ul>
                        <li><a href="#cursor_move_detail">상품상세</a></li>
                        <li><a href="#cursor_move_review">상품리뷰</a></li>
                        <li><a href="#cursor_move_qna">상품문의</a></li>
                        <li><a href="#cursor_move_delivery">배송/반납</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </section> 
    
    
    <!-- 상품정보 네비게이션 바 -->
    <!--  -->
    <!-- 상품 이미지 -->
    <div class="container">
        <div class="product_content" id="#cursor_move_detail">
            <div style="text-align: center; width:65%;  margin-left: auto; margin-right: auto">
                <img src="/bit_project/image/<%=prVO.getMain_img()%>">
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <!-- 상품 이미지 -->



    <!-- 상품 리뷰 -->
    <div class="container">
        <div class="pr_title" id="cursor_move_review">
            <h3>상품 리뷰
                <em class="reviewcssf"></em>
                <a href="javascript:review_write()"
                    style="float:right; background:#444; color:#fff; border:1px solid #444; font-size:14px; line-height:25px; height:25px; padding:5px 20px; text-align:center;">작성하기</a>
            </h3>
        </div>

        <div class="starRev">
            <div class="star_lay">
                <span class="starR1"></span>
                <span class="starR2"></span>
                <span class="starR1"></span>
                <span class="starR2"></span>
                <span class="starR1"></span>
                <span class="starR2"></span>
                <span class="starR1"></span>
                <span class="starR2"></span>
                <span class="starR1"></span>
                <span class="starR2"></span><br>
            </div>

            <div><%=String.format("%.2f", prVO.getGpa()) %>/5</div>
            <input type="hidden" id="reviewTotal" value="<%=prVO.getGpa() %>" />
        </div>
        <hr style="border: 1px solid #c6c6c6;">

		<div class="review">

        </div>
        <br><br>
        <div class="review_paginate" style="text-align:center;"></div>

        <div class="reviewForm" style="display:none;">
            <h2>상품리뷰 작성</h2>
            <h3>리뷰 시 유의해 주세요!
                <br>
                상품과 관련 없는 내용, 비방, 광고, 불건전한 내용의 글은 사전 동의 없이 삭제될 수 있습니다.
            </h3>
            <br>
            <form id="ReviewForm" method="post" enctype="multipart/form-data">
                <input type="hidden" name="product_num" value="<%=prVO.getProduct_num() %>" />
                <input type="hidden" name="nickname" value="<%=nickname %>" />
                <input type="hidden" name="review_num" value="" />
                <input type="hidden" name="email" value="<%=email %>" />
                <div>
                    <label for="reviewcheck">평점</label>
                    <div><input type="radio" name="reviewcheck" value="5" />★★★★★</div>
                    <div><input type="radio" name="reviewcheck" value="4" />★★★★</div>
                    <div><input type="radio" name="reviewcheck" value="3" />★★★</div>
                    <div><input type="radio" name="reviewcheck" value="2" />★★</div>
                    <div><input type="radio" name="reviewcheck" value="1" />★</div>
                </div>
                <br>
                <div>
                    <textarea rows="20" cols="20" name="content" placeholder="내용을 작성해주세요."></textarea>
                </div>
                <br>
                <div>
                    <input type="file" name="img" />
                </div>
                <div class="review_writebtn">
                    <a href="javascript:void(0)">저장</a>
                    <a href="javascript:void(0)">취소</a>
                </div>
            </form>
        </div>
    </div>
    <!-- 상품 리뷰 -->

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <!-- 상품 문의 -->
    <div class="container" id="cursor_move_qna">
        <div id="goodsQna" class="qna">
            <h3>상품Q&A&nbsp;
                <em class="qnacssf"></em>
                <a href="javascript:qna_write()"
                    style="float:right; background:#444; color:#fff; border:1px solid #444; font-size:14px; line-height:25px; height:25px; padding:5px 20px; text-align:center;">작성하기</a>
            </h3>
            <hr style="border: 1px solid #c6c6c6;">
            <div class="accordion">
                <ul>

                </ul>
            </div>
        </div>
        <br><br>
        <div class="qna_paginate" style="text-align:center;">

        </div>
        <div class="qnaForm" style="display:none;">
            <h2>상품Q&A 작성</h2>
            <h3>문의 시 유의해 주세요!
                <br>
                상품과 관련 없는 내용, 비방, 광고, 불건전한 내용의 글은 사전 동의 없이 삭제될 수 있습니다.
            </h3>
            <form id="QnaForm" method="post">
                <input type="hidden" name="product_num" value="<%=prVO.getProduct_num() %>" />
                <input type="hidden" name="nickname" value="<%=nickname %>" />
                <input type="hidden" name="question_num" value="" />
                <input type="hidden" name="email" value="<%=email %>" />
                <div>
                    <br>
                    <label>제목</label>
                    <span><input type="text" name="question_title" placeholder="제목을 작성해주세요." /></span>
                </div>
                <div>
                    <textarea rows="20" cols="20" name="content" placeholder="내용을 작성해주세요."></textarea>
                </div>

                <div>
                    <label for="privatecheck">공개 여부</label>
                    <span><input type="radio" name="privatecheck" value="공개" checked/>공개</span>
                    <span><input type="radio" name="privatecheck" value="비공개" />비공개</span>
                </div>
                <div class="qna_writebtn">
                    <a href="javascript:void(0)">저장</a>
                    <a href="javascript:void(0)">취소</a>
                </div>
            </form>
        </div>
		<div class="adminAnsForm" style="display:none;">
            <h2>관리자 상품Q&A 답변</h2>
            <form id="AnsForm" method="post">
                <input type="hidden" name="product_num" value="<%=prVO.getProduct_num() %>" />
                <input type="hidden" name="nickname" value="<%=nickname %>" />
                <input type="hidden" name="question_num" value="" />
                <input type="hidden" name="email" value="<%=email %>" />
                <div>
                    <textarea rows="20" cols="20" name="content" placeholder="내용을 작성해주세요."></textarea>
                </div>
                <div class="admin_writebtn">
                    <a href="javascript:void(0)">저장</a>
                    <a href="javascript:void(0)">취소</a>
                </div>
            </form>
        </div>
    </div>


    <!-- 상품 문의 -->

    <br><br>
    <!-- 배송/반납  -->
    <div class="container">
    <hr style="border: 1px solid #c6c6c6;">
        <div class="pr_title" id="cursor_move_delivery">배송/반납</div>
		<div class="baesong" style="font-size: 15px;"> 
		   <br>
        <br>
              ㆍ대한민국택배(1588-1233)을 통한 배송 업무를 보고 있습니다.<br>
           <br>
         ㆍ첫 배송일은 4쨋주 목요일날 일괄 배송 되고 있습니다.(비정기구독자 분들은 고정입니다.)<br>
         <br>
         ㆍ구독중이신 고객님들은 한달에 1회 혹은 2회(구독 등급에 따라)반납 신청이 가능합니다. 반납 신청하시면 돌아오는 목요일에 배송됩니다.<br>
         <br>
         ㆍ고객님의 등급이 실버일경우 1달에 1번 교환 가능하시고 골드, 플레티넘은 매달 2번씩 가능합니다. 반품은 상품에 문제가 있을시 가능합니다.<br>
         <br>
         ㆍ교환 또는 반납을 원하실때에는 메뉴안에 Contact Us에서 문의사항에 작성 해주시면 됩니다.<br>
         <br>
         ㆍ반납신청이나 배송내역은 마이페이지에서 확인이 가능하며 대한민국택배 주문 조회를 통해서도 확인이 가능합니다.<br>
                 
        </div>
    </div>

    
    <!-- 배송/반납  --> 
 
	<%@ include file="/WEB-INF/views/footer.jsp"%>

    <!-- //footer -->
    <!-- 자바스크립트 라이브러리 -->

    <script src="${pageContext.request.contextPath}/resources/js/product/jquery.min_1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/product/mun.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/product/swiper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/product/munreview.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/product/bookmark.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/product/wishlist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/product/reservation.js"></script>

    <script>
        //배너 이미지 슬라이드
        var swiper = new Swiper('.swiper-container', {
            pagination: {
                el: '.swiper-pagination',
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            autoplay: {
                delay: 5000,
            },
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var reviewScore = 0.00;
            reviewScore = document.getElementById('reviewTotal').value;
            reviewScore *= 10;
            //5개
            if (reviewScore == 50) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').addClass('on').prevAll('span').addClass('on');
            } else if (reviewScore >= 45 && reviewScore < 50) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').slice(0, 9).addClass('on');
            } else if (reviewScore >= 40 && reviewScore < 45) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').slice(0, 8).addClass('on');
            } else if (reviewScore >= 35 && reviewScore < 40) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').slice(0, 7).addClass('on');
            } else if (reviewScore >= 30 && reviewScore < 35) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').slice(0, 6).addClass('on');
            } else if (reviewScore >= 25 && reviewScore < 30) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').slice(0, 5).addClass('on');
            } else if (reviewScore >= 20 && reviewScore < 25) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').slice(0, 4).addClass('on');
            } else if (reviewScore >= 15 && reviewScore < 20) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').slice(0, 3).addClass('on');
            } else if (reviewScore >= 10 && reviewScore < 15) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').slice(0, 2).addClass('on');
            } else if (reviewScore >= 5 && reviewScore < 10) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').slice(0, 1).addClass('on');
            } else if (reviewScore >= 0 && reviewScore < 5) {
                $('.starRev span').parent().children('span').removeClass('on');
                $('.starRev span').children().first().addClass('on');
            } else {
                $('.starRev span').parent().children('span').removeClass('on');
            }
        })

        /*   $('.starRev span').click(function () {
              $(this).parent().children('span').removeClass('on');
              $(this).addClass('on').prevAll('span').addClass('on');
              return false;
          }); */
    </script>

    <script src="${pageContext.request.contextPath}/resources/js/product/munqna.js"></script>
    <script>
      /*   var revcount = 0;
        var scrollHeight = 0;
        var qnacheck = 0;
        var revcheck = 0; 
        /* function qna_write() {
            if (sessionChk == "" || sessionChk == null) {
                location.href = "login.me";
            } else {
                $('body').css("background", "grey");
                $(".qnaForm").show();
                scrollHeight = $("body").scrollTop(); // [var사용하지 않았으므로 전역스코프로 정의됨]열렸을떄 scrollTop 체크
                $("body").addClass('not_scroll'); //overflow:hidden 추가
                $('.qnaForm').css('position', 'fixed'); //최상위 div 고정
                $('.qnaForm').css('top', - scrollHeight + 100);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
                $('.qnaForm').css('left', 700);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
                //등록
                if ($('#QnaForm textarea').val().length == 0) {
                    qnacheck = 1;
                }
            }

        };
        $('.qna_writebtn a').first().click(function () {
            $("body").removeClass('not_scroll');
            $('.qnaForm').css('position', 'relative');//top값 해제
            $('.qnaForm').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
            $('.qnaForm').css('top', 0);//최상위 div 고정해제
            $(".qnaForm").hide();
            $('body').css("background", "none");
            $('body').scrollTop(scrollHeight);
            //등록
            if (qnacheck == 1) {
                var frm = document.getElementById("QnaForm");
                frm.action = "qnaWrite.pr";
                frm.submit();
                var ta = $("#QnaForm textarea[name=content]").html("");
                frm.reset();
            } else {
                var frm = document.getElementById("QnaForm");
                frm.action = "qnaModify.pr";
                frm.submit();
                frm.reset();
            }
            var scrollTop = $(window).scrollTop();
            var captionTop = $('.reviewcssf').offset().top;
            $('html, body').animate({ scrollTop: captionTop }, 0);

        });
        $('.qna_writebtn a').last().click(function () {
            $("body").removeClass('not_scroll');
            $('.qnaForm').css('position', 'relative');//top값 해제
            $('.qnaForm').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
            $('.qnaForm').css('top', 0);//최상위 div 고정해제
            $(".qnaForm").hide();
            $('body').css("background", "none");
            $('body').scrollTop(scrollHeight);
            var frm = document.getElementById("QnaForm");
            var ta = $("#QnaForm textarea[name=content]").html("");
            frm.reset();
        });

        function review_write(rcnt) {
            if (sessionChk == "" || sessionChk == null) {
                location.href = "login.me";
            } else {
                // 이메일과 pnum 넘겨서 이새끼 리뷰 쓴게 있나 확인. 쓴게 있으면 리뷰는 1개만 가능하다 안내.
                $.ajax({
                    url: '/bit_project/reviewoverflow.pr',
                    type: 'POST',
                    dataType: 'json',
                    data: { "email": sessionChk, "product_num": p },
                    async: false,
                    success: function (data) {
                        revcount = data;
                    },
                    error: function () {
                    }
                });
                if (revcount == 0) {
                    $('body').css("background", "grey");
                    $(".reviewForm").show();
                    scrollHeight = $("body").scrollTop(); // [var사용하지 않았으므로 전역스코프로 정의됨]열렸을떄 scrollTop 체크
                    $("body").addClass('not_scroll'); //overflow:hidden 추가
                    $('.reviewForm').css('position', 'fixed'); //최상위 div 고정
                    $('.reviewForm').css('top', - scrollHeight + 100);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
                    $('.reviewForm').css('left', 700);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
                    //텍스트에어리어가 빈값이다 -> 리뷰등록
                    if ($('#ReviewForm textarea').val().length == 0) {
                        revcheck = 1;
                    }
                } else {
                    if (rcnt == 1) {
                        $('body').css("background", "grey");
                        $(".reviewForm").show();
                        scrollHeight = $("body").scrollTop(); // [var사용하지 않았으므로 전역스코프로 정의됨]열렸을떄 scrollTop 체크
                        $("body").addClass('not_scroll'); //overflow:hidden 추가
                        $('.reviewForm').css('position', 'fixed'); //최상위 div 고정
                        $('.reviewForm').css('top', - scrollHeight + 100);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
                        $('.reviewForm').css('left', 700);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
                        //텍스트에어리어가 빈값이다 -> 리뷰등록
                        if ($('#ReviewForm textarea').val().length == 0) {
                            revcheck = 1;
                        }
                    } else {
                        alert('리뷰는 하나만 작성가능합니다.')
                    }

                }

            }

        };
        $('.review_writebtn a').first().click(function () {
            $("body").removeClass('not_scroll');
            $('.reviewForm').css('position', 'relative');//top값 해제
            $('.reviewForm').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
            $('.reviewForm').css('top', 0);//최상위 div 고정해제
            $(".reviewForm").hide();
            $('body').css("background", "none");
            $('body').scrollTop(scrollHeight);
            if (revcheck == 1) {
                var frm = document.getElementById("ReviewForm");
                frm.action = "reviewWrite.pr";
                frm.submit();
                var ta = $("#ReviewForm textarea[name=content]").html("");
                frm.reset();
            } else {
                var frm = document.getElementById("ReviewForm");
                frm.action = "reviewModify.pr";
                frm.submit();
                frm.reset();
            }
            var scrollTop = $(window).scrollTop();
            var captionTop = $('.reviewcssf').offset().top;
            $('html, body').animate({ scrollTop: captionTop }, 0);
        });
        $('.review_writebtn a').last().click(function () {
            $("body").removeClass('not_scroll');
            $('.reviewForm').css('position', 'relative');//top값 해제
            $('.reviewForm').css('left', 0);// 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
            $('.reviewForm').css('top', 0);//최상위 div 고정해제
            $(".reviewForm").hide();
            $('body').css("background", "none");
            $('body').scrollTop(scrollHeight);
            var frm = document.getElementById("ReviewForm");
            frm.reset();
        });
        */
    </script>
    <script>
        var bcheck = <%=bookmark%>;
        var wcheck = <%=wishlist%>;
        var rcheck = <%=reservation%>;
        var acheck = <%=alarm%>;
        if (bcheck == 0) {
            $('#wishlist-pid-0001').prop('checked', false);
        } else {
            $('#wishlist-pid-0001').prop('checked', true);
            //$('#wishlist-pid-0001').attr('checked', true);
        }
        if (wcheck == 0) {
            $('#wish_button').css("background", "#EA7475");
        } else if (wcheck == 1 || wcheck == 11) {
            $('#wish_button').css("background", "black");
        } else {
            $('#wish_button').css("background", "#EA7475");
        }

        if (rcheck == 0 || rcheck == 2) {
            $('#reservation_button').css("background", "#EA7475");
        } else {
            $('#reservation_button').css("background", "black");
        }
        if (acheck == 0) {
            $('.alarm_btn').css("background", "#EA7475");
        } else {
            $('.alarm_btn').css("background", "black");
        }
        function amount_alert() {
            var alert_params = $("#amount_alarm").serialize();
            var alarm_chk = 0;

            /*  $.ajax({
                  url: '/bit_project/alarmCheck.pr',
                 type: 'GET',
                 dataType: 'json',
                 async:false,
                 data: alert_params,
                 success: function (data) {
                      if(data.val=="no"){
                            alarm_chk = 0;
                      }else {
                            alarm_chk = 1;
                      }
                 },
                  error: function () {
                        alert("ajax오류");
                    }
             });
              */
            if (acheck == 0) {
                var alarm_y = confirm("입고 알림을 신청하시겠습니까?");
                console.log(alert_params);
                if (alarm_y) {

                    $.ajax({
                        url: '/bit_project/addalarm.pr',
                        type: 'GET',
                        dataType: 'json',
                        async: false,
                        data: alert_params,
                        success: function (data) {
                            $('.alarm_btn').css("background", "black");
                        },
                        error: function () {
                            alert("ajax오류");
                        }
                    });

                }
            } else {
                var alarm_n = confirm("입고 알림을 취소하시겠습니까?");
                if (alarm_n) {
                    $.ajax({
                        url: '/bit_project/deletealarm.pr',
                        type: 'GET',
                        dataType: 'json',
                        async: false,
                        data: alert_params,
                        success: function (data) {
                            console.log("취소되었습니다.");
                            $('.alarm_btn').css("background", "#EA7475");
                        },
                        error: function () {
                            alert("ajax오류");
                        }
                    });

                }
            }
        }
        function prModify() {
            location.href = "productModifyForm.pr?num=<%=prVO.getProduct_num()%>";
        }
        function prDelete() {
            var pr_delete = confirm("해당 상품을 삭제하시겠습니까?");
            if (pr_delete) {
                location.href = "productDeleteForm.pr?num=<%=prVO.getProduct_num()%>";
            }

        }
    </script>
     <script src="${pageContext.request.contextPath}/resources/js/product/pdetail.js"></script> 
</body>

</html>