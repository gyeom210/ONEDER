<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.spring.login.*"%>
<%
	String email = (String) session.getAttribute("email");
	String img = (String) session.getAttribute("img");
	LoginVO userDetail_h = (LoginVO) session.getAttribute("userDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="./resources/css/qna.css" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 폰트어썸 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
	function doDisplay() {
		var con = document.getElementById("question");
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}

	function doDisplay1() {
		var con1 = document.getElementById("question1");
		if (con1.style.display == 'none') {
			con1.style.display = 'block';
		} else {
			con1.style.display = 'none';
		}
	}

	function doDisplay2() {
		var con2 = document.getElementById("question2");
		if (con2.style.display == 'none') {
			con2.style.display = 'block';
		} else {
			con2.style.display = 'none';
		}
	}
	function doDisplay3() {
		var con3 = document.getElementById("question3");
		if (con3.style.display == 'none') {
			con3.style.display = 'block';
		} else {
			con3.style.display = 'none';
		}
	}
	function doDisplay4() {
		var con4 = document.getElementById("question4");
		if (con4.style.display == 'none') {
			con4.style.display = 'block';
		} else {
			con4.style.display = 'none';
		}
	}
	function doDisplay5() {
		var con4 = document.getElementById("question5");
		if (con4.style.display == 'none') {
			con4.style.display = 'block';
		} else {
			con4.style.display = 'none';
		}
	}
	function doDisplay6() {
		var con4 = document.getElementById("question6");
		if (con4.style.display == 'none') {
			con4.style.display = 'block';
		} else {
			con4.style.display = 'none';
		}
	}
	function doDisplay7() {
		var con4 = document.getElementById("question7");
		if (con4.style.display == 'none') {
			con4.style.display = 'block';
		} else {
			con4.style.display = 'none';
		}
	}
	function doDisplay8() {
		var con4 = document.getElementById("question8");
		if (con4.style.display == 'none') {
			con4.style.display = 'block';
		} else {
			con4.style.display = 'none';
		}
	}
	function doDisplay9() {
		var con4 = document.getElementById("question9");
		if (con4.style.display == 'none') {
			con4.style.display = 'block';
		} else {
			con4.style.display = 'none';
		}
	}
	function doDisplay10() {
		var con4 = document.getElementById("question10");
		if (con4.style.display == 'none') {
			con4.style.display = 'block';
		} else {
			con4.style.display = 'none';
		}
	}

	/*
	$(function(){
		$('a').click(function(){
			$('a').removeClass()
			$(this).addClass('on')
		
		})
	})
	 */

	$(function() {
		$('th').click(function() {
			$('th').removeClass()
			$('th').children().children().removeClass()
			$(this).addClass('on1')
			$(this).children().children().addClass('on');

		})

		$('#1').click(function() {
			total();
		})
		$('#2').click(function() {
			member();
		})
		$('#3').click(function() {
			reservation();
		})
		$('#4').click(function() {
			delivery();
		})
		$('#5').click(function() {
			change();
		})

	})
</script>


<script>
	function member() {
		$("#question_1").show();
		$("#question_2").hide();
		$("#question1").hide();
		$("#question_3").hide();
		$("#question2").hide();
		$("#question_4").hide();
		$("#question3").hide();
		$("#question_5").hide();
		$("#question4").hide();
		$("#question_6").show();
		$("#question_7").show();
		$("#question_8").hide();
		$("#question7").hide();
		$("#question_9").hide();
		$("#question8").hide();
		$("#question_10").hide();
		$("#question9").hide();
	}

	function reservation() {
		$("#question_1").hide();
		$("#question").hide();
		$("#question_2").show();
		$("#question_3").hide();
		$("#question2").hide();
		$("#question_4").hide();
		$("#question3").hide();
		$("#question_5").hide();
		$("#question4").hide();
		$("#question_6").hide();
		$("#question5").hide();
		$("#question_7").hide();
		$("#question6").hide();
		$("#question_8").hide();
		$("#question7").hide();
		$("#question_9").show();
		$("#question_10").show();
	}

	function delivery() {
		$("#question_1").hide();
		$("#question").hide();
		$("#question_2").hide();
		$("#question1").hide();
		$("#question_3").show();
		$("#question_4").hide();
		$("#question3").hide();
		$("#question_5").hide();
		$("#question4").hide();
		$("#question_6").hide();
		$("#question5").hide();
		$("#question_7").hide();
		$("#question6").hide();
		$("#question_8").show();
		$("#question_9").hide();
		$("#question8").hide();
		$("#question_10").hide();
		$("#question9").hide();
	}
	function change() {
		$("#question_1").hide();
		$("#question").hide();
		$("#question_2").hide();
		$("#question1").hide();
		$("#question_3").hide();
		$("#question2").hide();
		$("#question_4").show();
		$("#question_5").show();
		$("#question_6").hide();
		$("#question5").hide();
		$("#question_7").hide();
		$("#question6").hide();
		$("#question_8").hide();
		$("#question7").hide();
		$("#question_9").hide();
		$("#question8").hide();
		$("#question_10").hide();
		$("#question9").hide();
	}
	function total() {
		$("#question_1").show();
		$("#question_2").show();
		$("#question_3").show();
		$("#question_4").show();
		$("#question_5").show();
		$("#question_6").show();
		$("#question_7").show();
		$("#question_8").show();
		$("#question_9").show();
		$("#question_10").show();
	}
</script>


<script>
	$(document).ready(function() {
		$('#oneder').click(function() {

			location.href = "main.ma";
		});

		$('#connection-chat').click(function() {
			var chat = $('#chatframe');
			if (chat.is(':visible')) {
				chat.fadeOut();
			} else {
				chat.fadeIn();
			}
		});

	});
</script>
<body>
	<%@ include file="/WEB-INF/views/chatframe.jsp"%>
	<header>
		<div id="wrap">
			<div id="intro_bg">
				<div class="header">
					<div class="main">
						<h1 class=""
							style="font-weight: 900; text-transform: uppercase; margin-top: 10px; font-size: 2.5rem; line-height: 1.2;">
							<a href="main.ma" class="" style="color: #ea7475;">Oneder</a>
						</h1>
					</div>
					<ul class="nav">

						<%
							if (email != null) {
						%>
						<div class="logout_text" style="margin: auto 20px auto 0;"
							onclick="location.href='logout.me'">
							<p style="cursor: pointer; font-size: 16px;">로그아웃</p>
						</div>
						<div class="header_img"
							style="margin-top: 6.5px; margin-right: 5px;">
							<%
								if (userDetail_h.getUsergroup().equals("admin")) {
							%>
							<img src="<%=img%>" id="rumi" onclick="location.href='index.se'"
								style="box-sizing: border-box; border-radius: 50px; width: 55px; height: 55px; border: 2px solid #EA7475; margin: 0; cursor: pointer;">
							<%
								} else {
							%>
							<img src="<%=img%>" id="rumi"
								onclick="location.href='mypage_main.my'"
								style="box-sizing: border-box; border-radius: 50px; width: 55px; height: 55px; border: 2px solid #EA7475; margin: 0; cursor: pointer;">
							<%
								}
							%>
						</div>
						<%
							} else {
						%>
						<div class="login_text">
							<a href="login.me">로그인</a>
						</div>
						<%
							}
						%>

						<li><input type="checkbox" id="menuicon"> <label
							for="menuicon"> <span></span> <span></span> <span></span>
						</label>

							<div class="sidebar">
								<div id="sidemenu">
									<table class="menu_w">
										<tbody>
											<tr>
												<td><button name="button" class="subscribe-btn"
														onclick="location.href='subscribestep1.me'" type="button">구독하기</button></td>

												<td><a href="community.co">커뮤니티</a></td>
												<td><a href="product.pr">상품보기</a></td>
												<td><a href="qna.se">QnA</a></td>
												<td><a href="contactus.ms">Contact Us</a></td>

											</tr>
											<tr>
												<td><button name="button" class="subscribe-btn2"
														onclick="location.href='signup.me'" type="button">회원가입</button></td>

												<td></td>
												<td><a href="about.ma">이용방법</a></td>
												<td><a href="kindergarten.ms">어린이집</a></td>
												<td><a href="partner.ms">파트너</a></td>

											</tr>
										</tbody>
									</table>
									<table class="menu_m">
										<tbody>

											<tr>
												<td><button name="button1" class="subscribe-btn"
														onclick="location.href='subscribestep1.me'" type="button">구독하기</button></td>
											</tr>
											<tr>
												<td><button name="button1" class="subscribe-btn"
														onclick="location.href='signup.me'" type="button">회원가입</button></td>
											</tr>

											<tr>
												<td><a href="about.ma">이용방법</a></td>
											</tr>
											<tr>
												<td><a href="kindergarten.ms">어린이집</a></td>
											</tr>
											<tr>
												<td><a href="partner.ms">파트너</a></td>
											</tr>
											<tr>
												<td><a href="community.co">커뮤니티</a></td>
											</tr>
											<tr>
												<td><a href="product.pr">상품보기</a></td>
											</tr>
											<tr>
												<td><a href="qna.se">QnA</a></td>
											</tr>
											<tr>
												<td><a href="contactus.ms">Contact Us</a></td>
											</tr>


										</tbody>
									</table>
								</div>
							</div></li>

					</ul>
				</div>
			</div>
		</div>
	</header>

	<div id="commuBanner">

		<img
			src="${pageContext.request.contextPath}/resources/img/qna_main.PNG">
	</div>

	<div id="contents">

		<h1 style="font-size: 30px;">자주묻는 질문</h1>

		<div class="contents1">
			<table>
				<colgroup>

					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">


				</colgroup>
				<thead>

					<tr>
						<th scope="col" id="1"><a href="javascript:void(0)"
							onclick="total()"><h2>전체</a>
						</h2></th>


						<th scope="col" id="2"><a href="javascript:void(1)"
							onclick="member()"><h2>회원</a>
							</h2></th>


						<th scope="col" id="3"><a href="javascript:void(2)"
							onclick="reservation()"><h2>예약/구독</a>
							</h2></th>


						<th scope="col" id="4"><a href="javascript:void(3)"
							onclick="delivery()"><h2>배송</a>
							</h2></th>


						<th scope="col" id="5"><a href="javascript:void(4)"
							onclick="change()"><h2>환불 및 교환</a>
							</h2></th>
					</tr>

				</thead>
			</table>
		</div>
		<div id="list_nav_wrap">
			<div class="wrapper">
				<div class="question1"
					style="border-bottom: 0.1px solid rgb(221, 221, 221);">
					<h3>
						<a href="javascript:doDisplay();" style="color: black;"
							id="question_1">&emsp;&emsp;&emsp;회원 가입은 무료 인가요?</a>
					</h3>

					<ul id="question" style="display: none;">
						<li>
							<p></p>
							<h3>&emsp;&emsp;회원가입은 무료입니다. 하지만 장난감을 받아보려면 구독신청을 따로 하셔야합니다.</h3>
						</li>
					</ul>
				</div>
				<div class="question2"
					style="border-bottom: 0.1px solid rgb(221, 221, 221);">
					<h3>
						<a href="javascript:doDisplay1();" style="color: black;"
							id="question_2">&emsp;&emsp;&emsp;구독 하는 방법이 궁금해요</a>
					</h3>
					<ul id="question1" style="display: none;">
						<li>
							<p></p>
							<h3>&emsp;&emsp;메인 페이지 또는 메뉴 누르시면 "구독하기" 를 찾으실수 있습니다.</h3>
						</li>
					</ul>
				</div>
				<div class="question3"
					style="border-bottom: 0.1px solid rgb(221, 221, 221);">
					<h3>
						<a href="javascript:doDisplay2();" style="color: black;"
							id="question_3">&emsp;&emsp;&emsp;배송은 언제 되나요</a>
					</h3>
					<ul id="question2" style="display: none;">
						<li>
							<p></p>
							<h3>&emsp;&emsp;매달 넷째주 목요일에 일괄 배송됩니다.</h3>
						</li>
					</ul>
				</div>
				<div class="question4"
					style="border-bottom: 0.1px solid rgb(221, 221, 221);">
					<h3>
						<a href="javascript:doDisplay3();" style="color: black;"
							id="question_4">&emsp;&emsp;&emsp;환불신청 어떻게 할수있나요</a>
					</h3>
					<ul id="question3" style="display: none;">
						<li>
							<p></p>
							<h3>&emsp;&emsp;메인 페이지 우측하단에있는 채팅 기능으로 문의 주세요</h3>
						</li>
					</ul>
				</div>
				<div class="question5"
					style="border-bottom: 0.1px solid rgb(221, 221, 221);">
					<h3>
						<a href="javascript:doDisplay4();" style="color: black;"
							id="question_5">&emsp;&emsp;&emsp;교환신청 하고싶어요</a>
					</h3>
					<ul id="question4" style="display: none;">
						<li>
							<p></p>
							<h3>&emsp;&emsp;메뉴안에 Contact Us에서 문의사항에 작성 해주시면 됩니다.</h3>
						</li>
					</ul>
				</div>
				<div class="question6"
					style="border-bottom: 0.1px solid rgb(221, 221, 221);">
					<h3>
						<a href="javascript:doDisplay5();" style="color: black;"
							id="question_6">&emsp;&emsp;&emsp;아이디를 잃어버렸어요</a>
					</h3>
					<ul id="question5" style="display: none;">
						<li>
							<p></p>
							<h3>&emsp;&emsp;로그인 버튼을 누르시고 이메일/비밀번호 찾기를 누르시면 됩니다.</h3>
						</li>
					</ul>
				</div>
				<div class="question7"
					style="border-bottom: 0.1px solid rgb(221, 221, 221);">
					<h3>
						<a href="javascript:doDisplay6();" style="color: black;"
							id="question_7">&emsp;&emsp;&emsp;비밀번호를 잃어버렸어요</a>
					</h3>
					<ul id="question6" style="display: none;">
						<li>
							<p></p>
							<h3>&emsp;&emsp;로그인 버튼을 누르시고 이메일/비밀번호 찾기를 누르시면 됩니다.</h3>
						</li>
					</ul>
				</div>
				<div class="question8"
					style="border-bottom: 0.1px solid rgb(221, 221, 221);">
					<h3>
						<a href="javascript:doDisplay7();" style="color: black;"
							id="question_8">&emsp;&emsp;&emsp;구독된 배송지를 바꾸고 싶어요</a>

					</h3>
					<ul id="question7" style="display: none;">
						<li>
							<p></p>
							<h3>&emsp;&emsp;로그인을 하시고 마이페이지에 들어가면 수정이 가능합니다.</h3>
						</li>
					</ul>
				</div>
				<div class="question9"
					style="border-bottom: 0.1px solid rgb(221, 221, 221);">
					<h3>
						<a href="javascript:doDisplay8();" style="color: black;"
							id="question_9">&emsp;&emsp;&emsp;예약은 어떻게 하나요?</a>

					</h3>
					<ul id="question8" style="display: none;">
						<li>
							<p></p>
							<h3>&emsp;&emsp;상품페이지에 예약버튼이 있으면 최대 1개 예약 가능합니다.</h3>
						</li>
					</ul>
				</div>
				<div class="question10"
					style="border-bottom: 0.1px solid rgb(221, 221, 221);">
					<h3>
						<a href="javascript:doDisplay9();" style="color: black;"
							id="question_10">&emsp;&emsp;&emsp;교환/반품 기준이 어떻게 되나요?</a>
					</h3>
					<ul id="question9" style="display: none;">
						<li>
							<p></p>
							<h3>&emsp;&emsp;고객님의 등급이 실버일경우 1달에 1번 교환 가능하시고 골드, 플레티넘은 매달
								2번씩 가능합니다. 반품은 상품에 문제가 있을시 가능합니다.</h3>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="anotherQna">
			<p style="font-size: 18px; text-align: center; padding-top: 30px;">다른
				질문 있으신가요?</p>
			<div class=anotherQna1>
				<button name="button" class="subscribe-btn3" id="connection-chat"
					type="button">1:1 채팅</button>
				<button name="button" class="subscribe-btn4"
					onclick="location.href='contactus.ms'" type="button">이메일
					문의</button>
			</div>
		</div>
	</div>

	<footer id="footer">
		<div id="footer_right">
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
		</div>

		<div id="footer_infor" style="height: 0px;">
			<div class="container">
				<div class="row">
					<div class="footer_infor" style="width: 450px; height: 200px;">
						<!-- <h2><img src="assets/img/logo_footer.png" alt="megabox"></h2> -->
						<h2 id="oneder"
							style="color: #8f8f8f; font-size: 30px; margin: 0 10px; cursor: pointer; font-weight: normal; font-family: 'S-CoreDream-4Regular';">ONEDER</h2>

						<ul>
							<li><a href="kindergarten.ms">어린이집</a></li>
							<li><a href="partner.ms">파트너</a></li>
							<li><a href="contactus.ms">고객센터</a></li>
							<li><a href="share.ms">개인 쉐어</a></li>
							<li><a href="#">어린이집 쉐어</a></li>

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

</body>
</html>