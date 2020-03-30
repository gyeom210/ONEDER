<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.adminchart.*" %>
<%@ page import="java.util.*, com.spring.login.*" %>
<%@ page import="java.util.List" %>
<%
	int new_users = (int)request.getAttribute("new_users");
	int total_subscribers = (int)request.getAttribute("total_subscribers");
	int total_b2b = (int)request.getAttribute("total_b2b");
	List<RankingVO> rankingList = (List<RankingVO>)request.getAttribute("rankingList");
	
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
	<title>Lumino - Dashboard</title>
	<link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin/datepicker3.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/b2b_join_form.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<!-- chart.js -->
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart/utils.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/admin/chart/Chart.css" rel="stylesheet">

	<script>	
	/* 영업이익 그래프 ebitGraph */
	var chartData = {
			labels: [
				'${ebitMonth0 }', 
				'${ebitMonth1 }', 
				'${ebitMonth2 }', 
				'${ebitMonth3 }', 
				'${ebitMonth4 }', 
				'${ebitMonth5 }', 
				'${ebitMonth6 }', 
				'${ebitMonth7 }', 
				'${ebitMonth8 }', 
				'${ebitMonth9 }', 
				'${ebitMonth10 }', 
				'${ebitMonth11 }'
			],
			datasets: [{
				type: 'line',
				lineTension: 0,
				label: '영업이익',
				yAxisID: 'y-axis-1',
				borderColor: window.chartColors.red,
				borderWidth: 2,
				fill: false,
				data: [
					'${ebit0 }', 
					'${ebit1 }', 
					'${ebit2 }', 
					'${ebit3 }', 
					'${ebit4 }', 
					'${ebit5 }', 
					'${ebit6 }', 
					'${ebit7 }', 
					'${ebit8 }', 
					'${ebit9 }', 
					'${ebit10 }', 
					'${ebit11 }'
				]
			},{
				type: 'line',
				label: '영업이익률', //영업이익률
				lineTension: 0,
				yAxisID: 'y-axis-2',
				borderColor: window.chartColors.purple,
				borderWidth: 2,
				fill: false,
				data: [
					'${om0 }', 
					'${om1 }', 
					'${om2 }', 
					'${om3 }', 
					'${om4 }', 
					'${om5 }', 
					'${om6 }', 
					'${om7 }', 
					'${om8 }', 
					'${om9 }', 
					'${om10 }', 
					'${om11 }'
				]
			}, {
				type: 'bar',
				label: '매출',
				yAxisID: 'y-axis-1',
				backgroundColor: window.chartColors.green,
				data: [
					'${revenue0 }', 
					'${revenue1 }', 
					'${revenue2 }', 
					'${revenue3 }', 
					'${revenue4 }', 
					'${revenue5 }', 
					'${revenue6 }', 
					'${revenue7 }', 
					'${revenue8 }', 
					'${revenue9 }', 
					'${revenue10 }', 
					'${revenue11 }'
				],
				borderColor: 'white',
				borderWidth: 2
			}, {
				type: 'bar',
				label: '비용',
				yAxisID: 'y-axis-1',
				backgroundColor: window.chartColors.yellow,
				data: [
					'${expense0 }', 
					'${expense1 }', 
					'${expense2 }', 
					'${expense3 }', 
					'${expense4 }', 
					'${expense5 }', 
					'${expense6 }', 
					'${expense7 }', 
					'${expense8 }', 
					'${expense9 }', 
					'${expense10 }', 
					'${expense11 }'
				]
			}]

		};
	/*회원변동 추이*/
	var chartData2 = {
			labels: [
				'${vgDay0 }', 
				'${vgDay1 }', 
				'${vgDay2 }', 
				'${vgDay3 }', 
				'${vgDay4 }', 
				'${vgDay5 }', 
				'${vgDay6 }', 
				'${vgDay7 }', 
				'${vgDay8 }', 
				'${vgDay9 }', 
				'${vgDay10 }', 
				'${vgDay11 }',
				'${vgDay12 }',
				'${vgDay13 }'
				],
			datasets: [{
				type: 'line',
				label: '총 회원 수',
				lineTension: 0,
				borderColor: window.chartColors.green,
				borderWidth: 2,
				fill: false,
				data: [
					'${total0 }', 
					'${total1 }', 
					'${total2 }', 
					'${total3 }', 
					'${total4 }', 
					'${total5 }', 
					'${total6 }', 
					'${total7 }', 
					'${total8 }', 
					'${total9 }', 
					'${total10 }', 
					'${total11 }',
					'${total12 }',
					'${total13 }'
				]
			}, {
				type: 'bar',
				label: '가입자 수',
				backgroundColor: window.chartColors.orange,
				data: [
					'${vgIncrease0 }', 
					'${vgIncrease1 }', 
					'${vgIncrease2 }', 
					'${vgIncrease3 }', 
					'${vgIncrease4 }', 
					'${vgIncrease5 }', 
					'${vgIncrease6 }', 
					'${vgIncrease7 }', 
					'${vgIncrease8 }', 
					'${vgIncrease9 }', 
					'${vgIncrease10 }', 
					'${vgIncrease11 }',
					'${vgIncrease12 }',
					'${vgIncrease13 }'
				],
				borderColor: 'white',
				borderWidth: 2
			}, {
				type: 'bar',
				label: '탈퇴자 수',
				backgroundColor: window.chartColors.grey,
				data: [
					'${vgDecrease0 }', 
					'${vgDecrease1 }', 
					'${vgDecrease2 }', 
					'${vgDecrease3 }', 
					'${vgDecrease4 }', 
					'${vgDecrease5 }', 
					'${vgDecrease6 }', 
					'${vgDecrease7 }', 
					'${vgDecrease8 }', 
					'${vgDecrease9 }', 
					'${vgDecrease10 }', 
					'${vgDecrease11 }',
					'${vgDecrease12 }',
					'${vgDecrease13 }'
				]
			}]

		};
		
	
	/* 구독상품 파이 */
	var config = {
		type: 'doughnut',
		data: {
			datasets: [{
				data: [ '${dngData0 }', '${dngData1 }', '${dngData2 }', '${dngData3 }'],
				backgroundColor: [
					window.chartColors.red,
					window.chartColors.yellow,
					window.chartColors.grey,
					window.chartColors.blue
				],
				label: 'Dataset 1'
			}],
			labels: [
				'플래티넘',
				'골드',
				'실버',
				'비정기'
			]
		},
		options: {
			responsive: true,
			legend: {
				position: 'bottom',
			},
			title: {
				display: false,
			},
			animation: {
				animateScale: true,
				animateRotate: true
			}
		}
	};

	/* 커뮤니티 게시글 */
	var config4 = {
			type: 'line',
			data: {
				labels: [	
					'${vgDay7 }', 
					'${vgDay8 }', 
					'${vgDay9 }', 
					'${vgDay10 }', 
					'${vgDay11 }',
					'${vgDay12 }',
					'${vgDay13 }'],
				datasets: [{
					label: '게시글 수',
					backgroundColor: 'rgb(255, 99, 132, 0.6)',
					borderColor: window.chartColors.red,
					data: [
						'${totalcp0 }', 
						'${totalcp1 }', 
						'${totalcp2 }', 
						'${totalcp3 }', 
						'${totalcp4 }', 
						'${totalcp5 }', 
						'${totalcp6 }'
					],
					fill: 'start',
					lineTension: 0,
				//	steppedLine: 'middle', //계단식 그래프
				}/* , {
					label: 'My Second dataset',
					fill: false,
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor()
					],
				} */]
			},
			options: {
				responsive: true,
				legend: {
					position: 'bottom',
				},
				title: {
					display: false,
				},
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: true,
						scaleLabel: {
							display: true,
						}
					}],
					yAxes: [{
						 ticks: {
			                  beginAtZero: true,
			                  fontSize : 14,
			               }
					}]
				}
			}
		};
	
	
	window.onload = function() {
		/* 영업이익 그래프  ebitGraph */
		var ctx1 = document.getElementById('ebitGraph').getContext('2d');
		window.myMixedChart = new Chart(ctx1, {
				type: 'bar',
				data: chartData,
				options: {
					responsive: true,
					maintainAspectRatio: false, //상위 <div>에 속하게 됨.
					legend: {
						position: 'bottom',
					},
					title: {
						display: false,
					},
					tooltips: {
						mode: 'index',
						intersect: true
					},
					scales: {
						yAxes: [{
							type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
							display: true,
							position: 'left',
							id: 'y-axis-1',
						}, {
							type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
							display: true,
							position: 'right',
							id: 'y-axis-2',
							labelString: '%',
							gridLines: {
								drawOnChartArea: false
							}
						}]
					}
				}
			});
		/* 회원 변동 추이 */
		var ctx2 = document.getElementById('variationGraph').getContext('2d');
		window.myMixedChart = new Chart(ctx2, {
			type: 'bar',
			data: chartData2,
			options: {
				responsive: true,
				maintainAspectRatio: false,
				legend: {
					position: 'bottom',
				},
				title: {
					display: false,
				},
				tooltips: {
					mode: 'index',
					intersect: true
				}
			}
		});
		
		/*구독상품 파이 subscriberGraph */
		var ctx3 = document.getElementById('subscriberGraph').getContext('2d');
		window.myDoughnut = new Chart(ctx3, config);
		
		/* 커뮤니티 게시글 */
		var ctx4 = document.getElementById('postGraph').getContext('2d');
		window.myLine = new Chart(ctx4, config4);
		
		
	};
	</script>
</head>
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
			<li class="active"><a href="index.se"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li>

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
			<li><a href="payment.se"><em class="fa fa-bar-chart">&nbsp;</em> 결제관리</a></li>

			<!--사이트 이동-->
			<li><a href="main.ma"><em class="fa fa-power-off">&nbsp;</em> 사이트 이동</a></li>
		</ul>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="index.se"> <!-- 이모티콘 클릭시 관리자페이지 홈으로 이동 -->
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Dashboard</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div>
		</div><!--/.row-->
		
		<div class="panel panel-container">
			<div class="row">
				<div class="col-xs-6 col-md-4 col-lg-4 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-shopping-cart color-teal"></em>
							<div class="large"><%=total_subscribers %></div>
							<div class="text-muted">Total Subscribers</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-4 col-lg-4 no-padding">
					<div class="panel panel-orange panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-users color-orange"></em>
							<div class="large"><%=new_users %></div>
							<div class="text-muted">New Users</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-4 col-lg-4 no-padding">
					<div class="panel panel-red panel-widget ">
						<div class="row no-padding"><em class="fa fa-xl fa-home color-red"></em>
							<div class="large"><%=total_b2b %></div>
							<div class="text-muted">Total B2B</div>
						</div>
					</div>
				</div>
			</div><!--/.row-->
		</div>
		<!-- 영업이익 그래프 -->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						영업이익
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<div class="chart-container" style="position: relative; height:40vh;">
							<canvas id="ebitGraph"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
		
		<!-- 회원 변동 추이 -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						회원 변동 추이
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body">
							<div class="canvas-wrapper">
							<!-- 막대 그래프 -->
								<div class="chart-container2" style="position: relative; height:40vh;">							
	 								<canvas id="variationGraph"></canvas>
	 							</div>	
							</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->		

		<div class="row">
			<div class="col-md-2">
				<div class="panel panel-default">
					<div class="panel-heading">
						WishList Top5
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body">
						<div class="canvas-wrapper">
						<table>
                            <% 
                                try {
                                    for(int i=0; i<5; i++) 
                                    {
                                        RankingVO rankingvo = (RankingVO)rankingList.get(i);
							%> 
								<tr>
									<td>&nbsp;&nbsp;&nbsp;<%=i+1 %>.&nbsp;</td>
									<td>
										<%=rankingvo.getProduct_name() %>
									</td>
								</tr>
							<%
                                    }
                                } catch(Exception e) {}
							%> 
	
						</table>	
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel-heading">
						구독상품 
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas id="subscriberGraph"> </canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel-heading">
						커뮤니티 게시글
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas id="postGraph"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>	<!--/.row-->
	</div>	<!--/.main-->
	
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/custom.js"></script>


		
</body>
</html>
