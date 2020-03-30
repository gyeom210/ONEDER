<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if(!(session.getAttribute("id") == null) || session.getAttribute("id") != "admin"){
	
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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset19.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style19.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/swiper.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mchk.css">


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
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
</head>

<body>

	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
						<a href="#"> <!-- 
                            <em><img src="assets/img/logo.png" alt="MEGABOX"></em>
                            <strong><img src="assets/img/logo-sub.png" alt="LIFE THEATER"></strong>
                            --> <em>로고1</em>

						</a>
					</h1>
					<nav id="mNav">
						<h2 class="ir_so">전체메뉴</h2>
						<a href="#" class="ham"><span></span></a>
					</nav>
					<nav class="nav">
						<ul class="clearfix">
							<li><a href="#">상단바</a></li>
							<li><a href="#">상단바</a></li>
							<li><a href="#">상단바</a></li>
							<li><a href="#">상단바</a></li>
							<li><a href="#">상단바</a></li>
							<li><a href="#">상단바</a></li>
							<li><a href="#">로그인</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- //header -->
	<section id="banner">

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
	</section>



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
                <input type="hidden" id="rememberPage" name="rememberPage" value="">
                -->
				<ul class="cate clearfix">
					<li class="product_tier"><a href="javascript:void(0)"
						onclick="select(1)"> 등급 <span id="tier"></span> <span><i
								class="fas fa-angle-down"></i></span>
					</a>
						<div id="list1" style="display: none;">
							<ul>
								<li><input type="checkbox" name="check1" class="c1"
									value="실버" onclick="Chk(1);" />&nbsp;실버 <!--<label for="f1" id="label_f1">실버</label>-->
								</li>
								<li><input type="checkbox" name="check1" class="c1"
									value="골드" onclick="Chk(1);" />&nbsp;골드 <!-- <label for="f2" id="label_f2">골드</label>-->
								</li>
								<li><input type="checkbox" name="check1" class="c1"
									value="플레티넘" onclick="Chk(1);" />&nbsp;플레티넘 <!-- <label for="f3" id="label_f3">플레티넘</label> -->
								</li>
								<li><input type="checkbox" name="check1" class="c1"
									value="개인쉐어" onclick="Chk(1);" />&nbsp;개인쉐어 <!--<label for="f4" id="label_f4">개인쉐어</label>-->
								</li>
							</ul>
						</div></li>
					<li class="product_age"><a href="javascript:void(0)"
						onclick="select(2)"> 연령 <span id="age"></span> <span><i
								class="fas fa-angle-down"></i></span>
					</a>
						<div id="list2" style="display: none;">
							<ul>
								<li><input type="checkbox" name="check2" class="c2"
									value="0~4" onclick="Chk(2);" /> <label for="c2">0~4</label></li>
								<li><input type="checkbox" name="check2" class="c2"
									value="5~7" onclick="Chk(2);" /> <label for="c2">5~7</label></li>
							</ul>
						</div></li>
					<li class="product_type"><a href="javascript:void(0)"
						onclick="select(3)"> 종류 <span id="type"></span> <span><i
								class="fas fa-angle-down"></i></span>
					</a>
						<div id="list3" style="display: none;">
							<ul>
								<li><input type="checkbox" name="check3" class="c3"
									value="과학박스" onclick="Chk(3);" /> <label for="c3">과학박스</label>
								</li>
								<li><input type="checkbox" name="check3" class="c3"
									value="자동차" onclick="Chk(3);" /> <label for="c3">자동차</label></li>
								<li><input type="checkbox" name="check3" class="c3"
									value="로보트" onclick="Chk(3);" /> <label for="c3">로보트</label></li>
							</ul>
						</div></li>
					<li class="product_sort"><a href="javascript:void(0)"
						id="select4" onclick="select(4)"> 등급 <span id="sort">신상품</span>
							<span><i class="fas fa-angle-down"></i></span>
					</a>
						<div id="list4" style="display: none;">
							<ul>

								<li><a href="javascript:productSort('NEW','신상품');">신상품</a>
								</li>

								<li><a href="javascript:productSort('SALES','판매순');">인기순</a>
								</li>
								<li><a href="javascript:productSort('REVIEW','평점순');">평점순</a>
								</li>
								<li><a href="javascript:productSort('QNA','후기순');">후기순</a>
								</li>
							</ul>
						</div></li>

					<li class="btn">
						<!-- <input type='reset'> --> <a href="javascript:void(0)"
						onclick="formReset();">초기화</a> <a href="javascript:void(0)">적용</a>

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
			<div class="fildivision"
				style="text-align: center; padding: 5px 0 5px 0; display: none;">
				필터링 <a href="javascript:testfun();"> <i class="fas fa-times"
					style="float: right; padding: 5px; margin-right: 3px;"></i></a>
			</div>
			<br>
			<ul id="mFilter_menu" class="clearfix" style="display: none;">
				<li id="mFilter_menu_li1"><a href="javascript:void(0)"> <span
						id="js-Exchange_Bank_Btn">등급</span> <span id="mtier"></span>
				</a></li>
				<div id="mFilter_menu_list1" style="display: none; height: 100%;">
					<ul>
						<li><input type="checkbox" name="check1" class="m1"
							value="실버" onclick="mChk(1);" />&nbsp;실버 <!--<label for="f1" id="label_f1">실버</label>-->
						</li>
						<li><input type="checkbox" name="check1" class="m1"
							value="골드" onclick="mChk(1);" />&nbsp;골드 <!-- <label for="f2" id="label_f2">골드</label>-->
						</li>
						<li><input type="checkbox" name="check1" class="m1"
							value="플레티넘" onclick="mChk(1);" />&nbsp;플레티넘 <!-- <label for="f3" id="label_f3">플레티넘</label> -->
						</li>
						<li><input type="checkbox" name="check1" class="m1"
							value="개인쉐어" onclick="mChk(1);" />&nbsp;개인쉐어 <!--<label for="f4" id="label_f4">개인쉐어</label>-->
						</li>
					</ul>
				</div>

				<li id="mFilter_menu_li2"><a href="javascript:void(0)"> <span>연령</span>
						<span id="mage"></span>
				</a></li>
				<div id="mFilter_menu_list2" style="display: none;">
					<ul>
						<li><input type="checkbox" name="check2" class="m2"
							value="0~4" onclick="mChk(2);" /> <label for="c2">0~4</label></li>
						<li><input type="checkbox" name="check2" class="m2"
							value="5~7" onclick="mChk(2);" /> <label for="c2">5~7</label></li>
					</ul>
				</div>

				<li id="mFilter_menu_li3"><a href="javascript:void(0)"> <span>종류</span>
						<span id="mtype"></span>
				</a></li>
				<div id="mFilter_menu_list3" style="display: none;">
					<ul>
						<li><input type="checkbox" name="check3" class="m3"
							value="과학박스" onclick="mChk(3);" /> <label for="c3">과학박스</label>
						</li>
						<li><input type="checkbox" name="check3" class="m3"
							value="자동차" onclick="mChk(3);" /> <label for="c3">자동차</label></li>
						<li><input type="checkbox" name="check3" class="m3"
							value="로보트" onclick="mChk(3);" /> <label for="c3">로보트</label></li>
					</ul>
				</div>

				<div
					style="line-height: 70px; position: fixed; left: 0; bottom: 0; width: 100%; height: 70px; text-align: center;">
					<div
						style="width: 50%; height: 100%; float: left; background: #4c515d;">
						<input type="button" value="검색"
							style="background: none; color: #fff;" />
					</div>

					<div
						style="width: 50%; height: 100%; float: right; background: black;">
						<input type="button" value="초기화" onclick="fclear();"
							style="background: none; color: #fff;" />
					</div>
				</div>
				<br>

			</ul>
		</nav>
	</form>
	<!-- 모바일 용 상품 필터 -->

	<section id="product_section">
		<div class="container">
			<div class="row">
				<div class="product">
					<h3 class="product-normal">일반상품</h3>
					<div class="product_chart">
						<div class="swiper-container2">
							<div class="chart_cont1 swiper-wrapper">
								<div class="swiper-slide">
									<div class="pr_img">
										
										<figure>
										<a href="productDetail.pr">
											<img src="${pageContext.request.contextPath}/resources/img/item01.jpg" alt="pro1">
										</a>
										</figure>

										<div class="rank">
											<strong>1</strong>
										</div>

									</div>
									<div class="infor">
										<h3>
											<em>Juun.j</em> <strong>조거</strong>
										</h3>
										<div class="infor_btn">
											<a href="productDetail.pr">상세정보</a> 
											<a href="#">위시리스트</a>
										</div>
									</div>
								</div>
								<div class="swiper-slide">
									<div class="pr_img">
										<figure>

											<img
												src="${pageContext.request.contextPath}/resources/img/item02.jpg">

										</figure>
										<div class="rank">
											<strong>2</strong>
										</div>

									</div>
									<div class="infor">
										<h3>
											<em>브랜드</em> <strong>상품명</strong>
										</h3>
										<div class="infor_btn">
											<a href="#">상세정보</a> <a href="#">위시리스트</a>
										</div>
									</div>
								</div>
								<div class="swiper-slide">
									<div class="pr_img">
										<figure>
											<img
												src="${pageContext.request.contextPath}/resources/img/item03.jpg">
										</figure>
										<div class="rank">
											<strong>3</strong>
										</div>

									</div>
									<div class="infor">
										<h3>
											<em>브랜드</em> <strong>상품명</strong>
										</h3>
										<div class="infor_btn">
											<a href="#">상세정보</a> <a href="#">위시리스트</a>
										</div>
									</div>
								</div>
								<div class="swiper-slide">
									<div class="pr_img">
										<figure>
											<img
												src="${pageContext.request.contextPath}/resources/img/item01.jpg">
										</figure>
										<div class="rank">
											<strong>4</strong>
										</div>

									</div>
									<div class="infor">
										<h3>
											<em>브랜드</em> <strong>상품명</strong>
										</h3>
										<div class="infor_btn">
											<a href="#">상세정보</a> <a href="#">위시리스트</a>
										</div>
									</div>
								</div>
							</div>
						
					</div>
					<!-- //chart_cont1-->
					
					<div class="swiper-container2">
						<div class="chart_cont1 swiper-wrapper">
							<div class="swiper-slide">
								<div class="pr_img">
									<figure>
										<img
											src="${pageContext.request.contextPath}/resources/img/item01.jpg">
									</figure>
									<div class="rank">
										<strong>1</strong>
									</div>

								</div>
								<div class="infor">
									<h3>
										<em>브랜드</em> <strong>상품명</strong>
									</h3>
									<div class="infor_btn">
										<a href="#">상세정보</a> <a href="#">위시리스트</a>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="pr_img">
									<figure>
										<img
											src="${pageContext.request.contextPath}/resources/img/item02.jpg">
									</figure>
									<div class="rank">
										<strong>2</strong>
									</div>

								</div>
								<div class="infor">
									<h3>
										<em>브랜드</em> <strong>상품명</strong>
									</h3>
									<div class="infor_btn">
										<a href="#">상세정보</a> <a href="#">위시리스트</a>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="pr_img">
									<figure>
										<img
											src="${pageContext.request.contextPath}/resources/img/item03.jpg">
									</figure>
									<div class="rank">
										<strong>3</strong>
									</div>

								</div>
								<div class="infor">
									<h3>
										<em>브랜드</em> <strong>상품명</strong>
									</h3>
									<div class="infor_btn">
										<a href="#">상세정보</a> <a href="#">위시리스트</a>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="pr_img">
									<figure>
										<img
											src="${pageContext.request.contextPath}/resources/img/item01.jpg">
									</figure>
									<div class="rank">
										<strong>4</strong>
									</div>

								</div>
								<div class="infor">
									<h3>
										<em>브랜드</em> <strong>상품명</strong>
									</h3>
									<div class="infor_btn">
										<a href="#">상세정보</a> <a href="#">위시리스트</a>
									</div>
								</div>
							</div>

							<!-- //chart_cont2-->
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- //product -->
	<button onclick="location.href='productForm.pr'">상품등록하기</button>
	<button onclick="location.href='main.pr'">메인</button>
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
						<!-- <h2><img src="assets/img/logo_footer.png" alt=""></h2> -->
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
								서울특별시 서초구 강남대로 459 <br> <span class="bar2">대표자명 김진근</span>
								<br> <span class="bar2">사업자등록번호 111-11-1111</span>
								통신판매업신고번호 제 111호
							</p>
							<p>Copyright 2020 by Bit Inc. All right reserved</p>
						</address>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- //footer -->



	<!-- 자바스크립트 라이브러리 -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min_1.12.4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mun.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
	<script>
		//배너 이미지 슬라이드
		var swiper = new Swiper('.swiper-container', {
			pagination : {
				el : '.swiper-pagination',
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			autoplay : {
				delay : 5000,
			},
		});

		//이미지 슬라이드

		var swiper = new Swiper('.swiper-container2', {
			slidesPerView : 4,
			spaceBetween : 24,
			//            mousewheel: {
			//                invert: true,
			//            },
			/*
			keyboard: {
			    enabled: true,
			    onlyInViewport: false,
			},
			
			autoplay: {
			    delay: 6000,
			},
			 */
			breakpoints : {
				600 : {
					slidesPerView : 2,
					spaceBetween : 24
				},
				768 : {
					slidesPerView : 2,
					spaceBetween : 24
				},
				960 : {
					slidesPerView : 3,
					spaceBetween : 24
				}
			}
		});
	</script>
</body>

</html>