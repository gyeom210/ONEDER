<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.spring.login.*" %>
<%
	String img = (String)session.getAttribute("img");
	String email = (String)session.getAttribute("email");
	String usergroup="";
	LoginVO userDetail_h = (LoginVO)session.getAttribute("userDetail");
	try {
		
		
		if(userDetail_h.getUsergroup().equals("admin")){
			usergroup="admin";
		}
	}catch (Exception e){
		e.getMessage();
		e.printStackTrace();
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

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset19.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style19.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mchk.css">


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
	
</head>

<body>
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
						if(email != null || img != null) {
					%>
						<div class="logout_text" style="margin:auto 20px auto 0;" onclick="location.href='logout.me'">
							<p style="cursor:pointer; font-size:16px;">로그아웃</p>
						</div>					
						<div class="header_img" style="margin-top:6.5px; margin-right:5px;">
							<% if(userDetail_h.getUsergroup().equals("admin")) { %>
							<img src="<%=img %>" id="rumi" onclick="location.href='index.se'" style="box-sizing:border-box; border-radius:50px; width:55px; height:55px; border:2px solid #EA7475; margin:0; cursor:pointer;">
						<% }else { %>
							<img src="<%=img %>" id="rumi" onclick="location.href='mypage_main.my'" style="box-sizing:border-box; border-radius:50px; width:55px; height:55px; border:2px solid #EA7475; margin:0; cursor:pointer;">
						<% } %>
						</div>
						
					
					<%
						} else {
					%>
                    <div class="login_text"><a href="login.me" >로그인</a></div>
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
	<!-- <section id="banner">
		<div class="slider">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide ss1">
						 <div class="container">
							<div class="row">
								<h3>텍스트</h3>
								<p>텍스트</p>
							</div>
						</div> 
					</div>
					<div class="swiper-slide ss2">
						<div class="container">
							 <div class="row">
								<h3>텍스트</h3>
								<p>텍스트</p>
							</div>
						</div> 
					</div>
					<div class="swiper-slide ss3">
						<div class="container">
							<div class="row">
								<h3>텍스트</h3>
								<p>텍스트</p>
							</div> 
						</div> 
					</div>
				</div>
				<div class="swiper-pagination"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>
	</section> -->

	<div class="testsearch">
   <div class="container">
      <div class="row">
         <select name="searchtype" id="select_searchtype" class="form-control">
            <option value="na" selected="selected">상품명</option>
            <option value="no">상품번호</option>
         </select>
         <input type="text" name="searchword" id="searchword" class="form-control" />
         <a href="javascript:fn_searchList()" class="searchbtn form-control">검색</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <% if(usergroup.equals("admin")) { %>
               	<button type="button" class="btn btn-sm jeon1"  style="margin: 15px 5px 15px 5px; font-size: 14px; width: 75px; height: 33px; border-radius: 5PX;" onclick="location.href='productForm.pr'">상품등록</button>
             <%} %>
      </div>
   </div>
   </div>

	<div id="wFilter" class="container">
		<div class="row">

			<form class="category" id="categoryListForm">
				<!-- 
                    필터 적용 후 아래 input 태그 value에 값을 삽입(자바스크립트로.)
                    그리고나서 적용 버튼을 누르면, input값 전송하는 방식.
                <input type="hidden" id="brandCode" name="brandCode" value="">
                <input type="hidden" id="brandName" name="brandName" value="">
                <input type="hidden" name="categoryCode" value="me094">
                <input type="hidden" id="repProdColorCode" name="repProdColorCode" value="">
                <input type="hidden" id="repSizeEnumCode" name="repSizeEnumCode" value="">
                <input type="hidden" id="priceOrderCode" name="priceOrderCode" value="">
                <input type="hidden" id="productOrderCode" name="productOrderCode" value="NEW">
                <input type="hidden" id="check4pmCode" name="check4pmCode" value="">
                <input type="hidden" id="checkAtHomeCode" name="checkAtHomeCode" value="">
                <input type="hidden" id="checkSaleCode" name="checkSaleCode" value="">
                <input type="hidden" id="checkQuickCode" name="checkQuickCode" value="">
                <input type="hidden" id="checkDeliveryCode" name="checkDeliveryCode" value="">
                -->
                <input type="hidden" id="printNumber" value="">
				<ul class="cate clearfix">
					<li class="product_tier"><a href="javascript:void(0)" onclick="select(1)"> 등급 <span
								id="tier"></span> <span><i class="fas fa-angle-down"></i></span>
						</a>
						<div id="list1" style="display: none;">
							<ul>
								<li><input type="checkbox" name="check1" class="c1" value="실버"
										onclick="Chk(1);" />&nbsp;실버
									<!--<label for="f1" id="label_f1">실버</label>-->
								</li>
								<li><input type="checkbox" name="check1" class="c1" value="골드"
										onclick="Chk(1);" />&nbsp;골드
									<!-- <label for="f2" id="label_f2">골드</label>-->
								</li>
								<li><input type="checkbox" name="check1" class="c1" value="플레티넘"
										onclick="Chk(1);" />&nbsp;플레티넘
									<!-- <label for="f3" id="label_f3">플레티넘</label> -->
								</li>
								<li><input type="checkbox" name="check1" class="c1" value="개인쉐어"
										onclick="Chk(1);" />&nbsp;개인쉐어
									<!--<label for="f4" id="label_f4">개인쉐어</label>-->
								</li>
							</ul>
						</div>
					</li>
					<li class="product_age"><a href="javascript:void(0)" onclick="select(2)"> 연령 <span id="age"></span>
							<span><i class="fas fa-angle-down"></i></span>
						</a>
						<div id="list2" style="display: none;">
							<ul>
								<li><input type="checkbox" name="check2" class="c2" value="04" onclick="Chk(2);" />
									<label for="c2">0~4</label></li>
								<li><input type="checkbox" name="check2" class="c2" value="57" onclick="Chk(2);" />
									<label for="c2">5~7</label></li>
							</ul>
						</div>
					</li>
					<li class="product_type"><a href="javascript:void(0)" onclick="select(3)"> 종류 <span
								id="type"></span> <span><i class="fas fa-angle-down"></i></span>
						</a>
						<div id="list3" style="display: none;">
							<ul>
								<li><input type="checkbox" name="check3" class="c3" value="장난감" onclick="Chk(3);" />
									<label for="c3">장난감</label>
								</li>
								<li><input type="checkbox" name="check3" class="c3" value="나무 장난감" onclick="Chk(3);" />
									<label for="c3">나무 장난감</label></li>
								<li><input type="checkbox" name="check3" class="c3" value="역할놀이" onclick="Chk(3);" />
									<label for="c3">역할놀이</label></li>
									<li><input type="checkbox" name="check3" class="c3" value="놀이" onclick="Chk(3);" />
									<label for="c3">놀이</label></li>
									<li><input type="checkbox" name="check3" class="c3" value="기타" onclick="Chk(3);" />
									<label for="c3">기타</label></li>
							</ul>
						</div>
					</li>
					<li class="product_sort"><a href="javascript:void(0)" id="select4" onclick="select(4)"> 등급 <span
								id="sort"></span>
							<span><i class="fas fa-angle-down"></i></span>
						</a>
						<div id="list4" style="display: none;">
							<ul>

								<li><a href="javascript:productSort('NEW','신상품');">신상품</a>
								</li>
								<li><a href="javascript:productSort('SALES','인기순');">인기순</a>
								</li>
								<li><a href="javascript:productSort('REVIEW','평점순');">평점순</a>

							</ul>
						</div>
					</li>

					<li class="filterbtn">
<a href="javascript:void(0)" onclick="formReset();">초기화</a>
<a href="javascript:void(0)" onclick="fil();">적용</a>

					</li>
					<li class="total_count"><a href="javascript:void(0)">전체보기</a>
					</li>
				</ul>

			</form>
		</div>
	</div>




	<!-- 모바일 용 상품 필터 -->
	<form id="testForm">
		<input type="checkbox" id="menu_state">
		<nav id="mFilter">
			<label for="menu_state"><i class="fa"></i></label>
			<div class="fildivision" style="text-align: center; padding: 5px 0 5px 0; display: none;">
				필터링 
			</div>
			<br>
			<ul id="mFilter_menu" class="clearfix" style="display: none;">
				<li id="mFilter_menu_li1"><a href="javascript:void(0)"> <span id="js-Exchange_Bank_Btn">등급</span> <span
							id="mtier"></span>
					</a></li>
				<div id="mFilter_menu_list1" style="display: none; height: 100%;">
					<ul>
						<li><input type="checkbox" name="check1" class="m1" value="실버" onclick="mChk(1);" />&nbsp;실버
							<!--<label for="f1" id="label_f1">실버</label>-->
						</li>
						<li><input type="checkbox" name="check1" class="m1" value="골드" onclick="mChk(1);" />&nbsp;골드
							<!-- <label for="f2" id="label_f2">골드</label>-->
						</li>
						<li><input type="checkbox" name="check1" class="m1" value="플레티넘" onclick="mChk(1);" />&nbsp;플레티넘
							<!-- <label for="f3" id="label_f3">플레티넘</label> -->
						</li>
						<li><input type="checkbox" name="check1" class="m1" value="개인쉐어" onclick="mChk(1);" />&nbsp;개인쉐어
							<!--<label for="f4" id="label_f4">개인쉐어</label>-->
						</li>
					</ul>
				</div>

				<li id="mFilter_menu_li2"><a href="javascript:void(0)"> <span>연령</span>
						<span id="mage"></span>
					</a></li>
				<div id="mFilter_menu_list2" style="display: none;">
					<ul>
						<li><input type="checkbox" name="check2" class="m2" value="04" onclick="mChk(2);" /> <label
								for="c2">0~4</label></li>
						<li><input type="checkbox" name="check2" class="m2" value="57" onclick="mChk(2);" /> <label
								for="c2">5~7</label></li>
					</ul>
				</div>

				<li id="mFilter_menu_li3"><a href="javascript:void(0)"> <span>종류</span>
						<span id="mtype"></span>
					</a></li>
				<div id="mFilter_menu_list3" style="display: none;">
					<ul>
								<li><input type="checkbox" name="check3" class="m3" value="장난감" onclick="mChk(3);" />
									<label for="c3">장난감</label>
								</li>
								<li><input type="checkbox" name="check3" class="m3" value="나무 장난감" onclick="mChk(3);" />
									<label for="c3">나무 장난감</label></li>
								<li><input type="checkbox" name="check3" class="m3" value="역할놀이" onclick="mChk(3);" />
									<label for="c3">역할놀이</label></li>
									<li><input type="checkbox" name="check3" class="m3" value="놀이" onclick="mChk(3);" />
									<label for="c3">놀이</label></li>
									<li><input type="checkbox" name="check3" class="m3" value="기타" onclick="mChk(3);" />
									<label for="c3">기타</label></li>
					</ul>
				</div>

				<div
					style="line-height: 70px; position: fixed; left: 0; bottom: 0; width: 100%; height: 70px; text-align: center;">
					<div style="width: 50%; height: 100%; float: left; background: #4c515d;">
						<input type="button" value="검색" style="background: none; color: #fff;" onclick="javascript:fil();"/>
					</div>

					<div style="width: 50%; height: 100%; float: right; background: black;">
						<input type="button" value="초기화" onclick="fclear();" style="background: none; color: #fff;" />
					</div>
				</div>
				<br>

			</ul>
		</nav>
	</form>
	<!-- 모바일 용 상품 필터 -->

	
	
	<section id="product_section" style="min-height: 1000px;">
		<div class="container">
			<div class="row">
				<div class="product">
					<h3 class="product-normal">일반상품</h3>
					<div class="product_chart">
					
					</div>
				</div>
			</div>
		</div>
	</section> 
	<!-- //product -->

		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp"%>
		</footer>
	</div>
	 
	<!-- //footer -->
<!-- 자바스크립트 라이브러리 -->
	<script src="${pageContext.request.contextPath}/resources/js/product/jquery.min_1.12.4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/product/mun.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/product/swiper.min.js"></script>
	
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
	
	<script src="${pageContext.request.contextPath}/resources/js/product/munfilter.js"></script>
	<%@ include file="/WEB-INF/views/chatframe.jsp" %>
</body>

</html>