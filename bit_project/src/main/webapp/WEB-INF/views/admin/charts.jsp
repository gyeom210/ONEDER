<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.spring.login.*" %>
<%
	String nickname = (String)session.getAttribute("nickname");
	String img = (String)session.getAttribute("img");	
	LoginVO userDetail = (LoginVO)session.getAttribute("userDetail");
	
	if((String)session.getAttribute("email") == null || !(userDetail.getUsergroup().equals("admin"))) {
		out.println("<script>");
		out.println("alert('관리자만 접근할수있습니다')");
		out.println("location.href='main.ma'");
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Lumino - Widgets</title>
	<link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin/datepicker3.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet">
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
    <![endif]-->
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->

    
    <!-- 
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
     <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css">
     -->

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script><!-- 주석 가능 -->
    <!-- Latest compiled and minified Locales -->
    <script src="https://unpkg.com/bootstrap-table@1.15.5/dist/locale/bootstrap-table-zh-CN.min.js"></script><!-- 주석 가능 -->
	
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script> <!-- 테이블 js -->
	<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/> <!-- 테이블 css -->

	
</head>

<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><span>Lumino</span>Admin</a>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	
	
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="<%=img %>" class="img-responsive" alt="" style="box-sizing:border-box; border-radius:100px; border:2px solid #EA7475;">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-status"></div>
				<div class="profile-usertitle-name"><%=nickname %></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<!--Dashboard-->
			<li><a href="index.se"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li>

			<!--회원관리-->
			<li class="parent "><a data-toggle="collapse" href="#sub-member-1">
				<em class="fa fa-navicon">&nbsp;</em> 회원관리 <span data-toggle="collapse" href="#sub-member-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-member-1">
					<li><a class="" href="member_admin.se">
						<span class="fa fa-arrow-right">&nbsp;</span> Member
					</a></li>
					<li><a class="" href="member_group.se">
						<span class="fa fa-arrow-right">&nbsp;</span> Member Group
					</a></li>
				</ul>
			</li>
			
			<!--어린이집 관리-->
			<li><a href="kindergarten_admin.se"><em class="fa fa-bar-chart">&nbsp;</em> 어린이집 관리</a></li>

			<!--파트너 관리-->
			<li><a href="partner_admin.se"><em class="fa fa-bar-chart">&nbsp;</em> 파트너 관리</a></li>

			<!--쉐어 관리-->
			<li class="parent "><a data-toggle="collapse" href="#sub-share-1">
				<em class="fa fa-navicon">&nbsp;</em> 쉐어관리 <span data-toggle="collapse" href="#sub-share-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-share-1">
					<li><a class="" href="share.se">
						<span class="fa fa-arrow-right">&nbsp;</span> 쉐어 수락/거절
					</a></li>
					<li><a class="" href="shareOK.se">
						<span class="fa fa-arrow-right">&nbsp;</span> 쉐어 상품 등록
					</a></li>
						<li><a class="" href="share_settle.se">
						<span class="fa fa-arrow-right">&nbsp;</span> 쉐어 정산 목록
					</a></li>
				</ul>
			</li>
			
			<!-- 결제 관리 -->
			<li><a href="payment.se"><em class="fa fa-bar-chart">&nbsp;</em> 결제 관리</a></li>

		</ul>
	</div><!--/.sidebar-->
		
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="index.se"> <!-- 이모티콘 클릭시 관리자페이지 홈으로 이동 -->
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Share</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Share</h1>
			</div>
		</div><!--/.row-->

        <div class="row">
            <div class="col-lg-12">
				<div class="board_list_wrap">
					<form name="frmData" id="frmData" method="post">
						<input type="hidden" name="waiting_num" id="waiting_num" value="" />
					    <input type="hidden" name="email" id="email" value="" />
					    <input type="hidden" name="name" id="name" value="" />
					    <input type="hidden" name="product_name" id="product_name" value="" />
					    <input type="hidden" name="amount" id="amount" value="" />
					    <input type="hidden" name="share_content" id="share_content" value="" />
					    <input type="hidden" name="share_img1" id="share_img1" value="" />
					    <input type="hidden" name="share_img2" id="share_img2" value="" />
					    <input type="hidden" name="share_img3" id="share_img3" value="" />
					    <input type="hidden" name="bank" id="bank" value="" />
					    <input type="hidden" name="account" id="account" value="" />
					</form>
					<table id="foo-table" class="foo-ex">
						
					</table>
				</div>
            </div>
        </div>
	</div>	<!--/.main-->
	  

<script src="${pageContext.request.contextPath}/resources/js/admin/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/custom.js"></script>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/share.js"></script>
</body>
</html>
