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
	<title>Lumino UI Elements</title>
	<link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin/font-awesome.min.css" rel="stylesheet">
	<%-- <link href="${pageContext.request.contextPath}/resources/css/admin/datepicker3.css" rel="stylesheet"> --%>
	<link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet">
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/b2b_join_form.css" rel="stylesheet">
	
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	
	<![endif]-->
	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
	
	
	<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script> <!-- 테이블 js -->
	<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/> <!-- 테이블 css -->
	
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	
</head>
<script type="text/javascript">
    $(document).ready(function() {        
    	var lang_kor = {
    	        "decimal" : "",
    	        "emptyTable" : "데이터가 없습니다.",
    	        "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
    	        "infoEmpty" : "0명",
    	        "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
    	        "infoPostFix" : "",
    	        "thousands" : ",",
    	        "lengthMenu" : "_MENU_ 개씩 보기",
    	        "loadingRecords" : "로딩중...",
    	        "processing" : "처리중...",
    	        "search" : "검색 : ",
    	        "zeroRecords" : "검색된 데이터가 없습니다.",
    	        "paginate" : {
    	            "first" : "첫 페이지",
    	            "last" : "마지막 페이지",
    	            "next" : "다음",
    	            "previous" : "이전"
    	        },
    	        "aria" : {
    	            "sortAscending" : " :  오름차순 정렬",
    	            "sortDescending" : " :  내림차순 정렬"
    	        }
    	};

        //관리자 페이지 이동시 예약대기 테이블 불러오기
		var check = true;
		$.ajax({
			url: '/bit_project/subscribemember.su',
			type: 'POST',
			dataType: 'json',
			async: false,
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data) {
				$.each(data, function(index, item) {
					if(item.state != '구독취소') {
					var pay_price = item.price + item.point_price; 
    				var output = '';
    				output += '<tr>';
    				output += '<td>'+ item.email +'</td>';
    				output += '<td>'+ item.name +'</td>';
    				output += '<td>'+ item.phone +'</td>';
    				output += '<td>'+ item.grade +'</td>';
    				output += '<td>'+ item.price +'</td>';
    				output += '<td>'+ item.point_price +'</td>';
    				output += '<td>'+ pay_price +'</td>';
    				output += '</tr>';
    				
    				console.log("output:" + output);
    				$('#foo-table').prepend(output);
					}
    			});
			},
			error:function() {
				alert('ajax통신 실패');
				check = false;
			}
		});
		
		if(check == true) {
			$('#foo-table').DataTable({
				language: lang_kor
			});
		}	

		//예약완료 테이블 불러오기
		var check = true;
		$.ajax({
			url: '/bit_project/paymember.su',
			type: 'POST',
			dataType: 'json',
			async: false,
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data) {
				$.each(data, function(index, item) {
					var email = "'" + item.email + "'";
    				var output = '';
    				output += '<tr>';
    				output += '<td>'+ item.email +'</td>';
    				output += '<td>'+ item.name +'</td>';
    				output += '<td>'+ item.phone +'</td>';
    				output += '<td>'+ item.grade +'</td>';
    				output += '<td>'+ item.pay_price +'</td>';
    				if(item.state == '구독취소') {
    					output += '<td><button type="button" class="btn btn-sm btncc" style="background-color: #ea7475; border-color: #ea7475; color:#fff;" value="'+ item.email +'">구독취소</button></td>';
        			} else {
        				output += '<td><button type="button" class="btn btn-sm btncc" style="background-color: #30a5ff; border-color: #30a5ff; color:#fff;" value="'+ item.email +'">예약취소</button></td>';
                	}
    				output += '</tr>';
    				
    				console.log("output:" + output);
    				$('#foo-table2').prepend(output);
    			});
			},
			error:function() {
				alert('ajax통신 실패');
				check = false;
			}
		});

		if(check == true) {
			$('#foo-table2').DataTable({
				language: lang_kor
			});
		}	

		//결제완료 목록 불러오기
		var check = true;
		$.ajax({
			url: '/bit_project/paidhistory.su',
			type: 'POST',
			dataType: 'json',
			async: false,
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data) {
				$.each(data, function(index, item) {
					var email = "'" + item.email + "'";
    				var output = '';
    				output += '<tr>';
    				output += '<td>'+ item.email +'</td>';
    				output += '<td>'+ item.name +'</td>';
    				output += '<td>'+ item.phone +'</td>';
    				output += '<td>'+ item.grade +'</td>';
    				output += '<td>'+ item.pay_price +'</td>';
    				output += '</tr>';
    				
    				console.log("output:" + output);
    				$('#foo-table3').prepend(output);
    			});
			},
			error:function() {
				alert('ajax통신 실패');
				check = false;
			}
		});
		
		if(check == true) {
			$('#foo-table3').DataTable({
				language: lang_kor
			});
		}	

		//결제예약 (예약시 customer_uid, schedule(merchant_uid, amount, schedule_at) 필수)
		$('#schedule_payment').click(function() {
			var text = $('#datepicker').val(); //예약날짜
			 
			$.ajax ({
				url: '/bit_project/schedulepayment.su',
				type: "POST",
				dataType: "json",
				data: {
					date: text
				},
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success:function(map) {
					 if(map.res == "OK") {
						alert('결제예약 성공');
					} else if (map.res == "False") {
						alert('결제예약 실패');
					} else {
						alert('날짜선택 오류');
					}
				}, error:function() {
					alert('ajax통신 실패');
				}
			});
			location.href='<%=request.getContextPath()%>/payment.se';
		});

		//예약취소 (customer_uid, merchant_uid 필수)
		$('.btncc').click(function(){
			var check = confirm("취소하시겠습니까?");

			if(check == true) {
			var email = $(this).val();
			$.ajax ({
				url:'/bit_project/unschedulepayment.su',
				type:"POST",
				dataType:"json",
				data: {
					email: email
				},
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(map) {
					if(map.res == "OK") {
						alert('예약취소 성공');
					} else {
						alert('예약취소 실패');
					}
				}, error:function() {
					alert('ajax통신 실패');
				}
			});
				location.href='<%=request.getContextPath()%>/payment.se';
			}
		});
		
    });

          
</script>
<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.se"><span>ONEDER</span>Admin</a>
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


			<!-- 쉐어 관리 -->
			<li class="parent"><a data-toggle="collapse" href="#sub-share-1">

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

				<!--  반납&&배송 -->			
			<li class="parent "><a data-toggle="collapse" href="#sub-return-1">
				<em class="fa fa-navicon">&nbsp;</em> 반납확정&&배송관리 <span data-toggle="collapse" href="#sub-return-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-return-1">
					<li><a class="" href="return.se">
						<span class="fa fa-arrow-right">&nbsp;</span> 반납확정 wish
					</a></li>
					<li><a class="" href="returnpick.se">
						<span class="fa fa-arrow-right">&nbsp;</span> 픽업 시 반납완료
					</a></li>
				</ul>
			</li>

			<!-- 결제 관리 -->
			<li class="active"><a href="payment.se"><em class="fa fa-bar-chart">&nbsp;</em> 결제 관리</a></li>

			<!--사이트 이동-->
			<li><a href="main.ma"><em class="fa fa-power-off">&nbsp;</em> 사이트 이동</a></li>
		</ul>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="index.se">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">결제 관리</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">정기예약</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="board_list_wrap">
					
					<table id="foo-table" class="foo-ex">
						<h2>예약대기</h2>
						<thead>
							<tr>
								<th>Email</th>
								<th>Name</th>
								<th>Phone</th>
								<th>Grade</th>
								<th>Price</th>
								<th>Point</th>
								<th>Pay Price</th>
							</tr>
						</thead>
						<tbody id="output">
							<!-- 예약대기 -->
						</tbody>
					</table>
					<div style="margin: 0 auto; text-align: center; margin-top:10px;">
						<input type="text" id="datepicker" style="border-radius:5px;">
					</div>
					<div style="margin: 0 auto; text-align: center; margin-top:20px;">
						<button type="button" class="btn btn-lg btn-primary" id="schedule_payment" style="margin-bottom:50px;">결제예약</button>
					</div>
					
					<table id="foo-table2" class="foo-ex">
						<h2>예약완료</h2>
						<thead>
							<tr>
								<th>Email</th>
								<th>Name</th>
								<th>Phone</th>
								<th>Grade</th>
								<th>Pay Price</th>
								<th>Cancle</th>
							</tr>
						</thead>
						<tbody id="output2">
							<!-- 예약완료 -->
						</tbody>
					</table>
					
					<div style="margin-top:150px; margin-bottom:150px;">
					<table id="foo-table3" class="foo-ex">
						<h2 class="table3-drop" style="margin-top:50px;">결제내역</h2>
						<thead>
							<tr>
								<th>Email</th>
								<th>Name</th>
								<th>Phone</th>
								<th>Grade</th>
								<th>Pay Price</th>
							</tr>
						</thead>
						<tbody id="output3">
							<!-- 결제완료 -->
						</tbody>
					</table>
					</div>
				</div>
			</div><!-- /.col-->
			
		</div><!-- /.row -->
	</div><!--/.main-->
	
	<script>
	$(document).ready(function() {
		$( "#datepicker1" ).datepicker({
		    dateFormat: 'yy/mm/dd'
		  });

		//초기값을 오늘 날짜로 설정
	    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

	});

	
	</script>
	
	<%-- <script src="${pageContext.request.contextPath}/resources/js/admin/jquery-1.11.1.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart-data.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/easypiechart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/easypiechart-data.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/custom.js"></script>
	
</body>
</html>
