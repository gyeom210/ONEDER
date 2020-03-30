<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.spring.login.*" %>
<%
	String email = (String)session.getAttribute("email");
	String img = (String)session.getAttribute("img");
	LoginVO userDetail_h = (LoginVO)session.getAttribute("userDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/header3.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<header id="real_header">
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
							if(email != null) {
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
                    		<div class="login_text"><a href="login.me">로그인</a></div>
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
												<td><button name="button" class="subscribe-btn"
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
											<tr><td><a href="contactus.ms">Contact Us</a></td></tr>

										</tbody>
									</table>
								</div>
							</div></li>

					</ul>
				</div>
			</div>
		</div>
	</header>
</body>
</html>