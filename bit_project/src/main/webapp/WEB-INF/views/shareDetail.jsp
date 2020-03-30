<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
   request.setCharacterEncoding("UTF-8");
   int waiting_num = Integer.parseInt(request.getParameter("waiting_num")); 
   String email = request.getParameter("email"); 
   String name = request.getParameter("name"); 
   String product_name = request.getParameter("product_name");
   String amount = request.getParameter("amount"); 
   String share_content = request.getParameter("share_content"); 
   String share_img1 = request.getParameter("share_img1");
   String share_img2 = request.getParameter("share_img2"); 
   String share_img3 = request.getParameter("share_img3"); 
   String bank = request.getParameter("bank");
   String account = request.getParameter("account"); 
   
%>
<html>
<head>
<style>
ul, li {list-style: none;}
.container {width:1200px; height:700px; }
.i {width:1200px; height:400px; }
.i img {width:50px; height:50px;}
.i1, .i2, .i3 {display:inline-block; flex:3; text-align: center;}
.d1 {width:1200px; height:70px;}
.d2 {display:inline-block; }
.d3 {display:inline-block; }
.d3 img {width:50px; height:50px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="d1">
		<div class="d2">웨이팅넘버</div>
		<div class="d3"><%=waiting_num %></div>
	</div>
	<div class="d1">
		<div class="d2">이메일</div>
		<div class="d3"><%=email %></div>
	</div>
	<div class="d1">
		<div class="d2">이름</div>
		<div class="d3"><%=name %></div>
	</div>
	<div class="d1">
		<div class="d2">상품명</div>
		<div class="d3"><%=product_name %></div>
	</div>
	<div class="d1">
		<div class="d2">수량</div>
		<div class="d3"><%=amount %></div>
	</div>
	<div class="d1">
		<div class="d2">상품내용, 연식</div>
		<div class="d3"><%=share_content %></div>
	</div>
	<div class="d1">
		<div class="d2">은행</div>
		<div class="d3"><%=bank %></div>
	</div>
	<div class="d1">
		<div class="d2">계좌</div>
		<div class="d3"><%=account %></div>
	</div>	
</div>
	<div class="i">
		<div class="i1">이미지1</div>
		<div class="i2">이미지2</div>
		<div class="i3">이미지3</div>
	</div>
	<div class="i">
		<div class="i1"><img src="/bit_project/image/<%=share_img1 %>"></div>
		<div class="i2"><img src="/bit_project/image/<%=share_img2 %>"></div>
		<div class="i3"><img src="/bit_project/image/<%=share_img3 %>"></div>
	</div>
	
</body>
</html>