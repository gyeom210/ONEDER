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
	<title>Lumino - Dashboard</title>
	<link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin/datepicker3.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet">
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/b2b_join_form.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/b2b.js"></script>
	
	
	<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script> <!-- 테이블 js -->
	<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/> <!-- 테이블 css -->
	
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
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
    	var check = true;
    	  $.ajax({

    	         url : '/bit_project/partner_admin.se',
    	         type : "post",
    	         dataType : "json",
    	         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
    	         async: false,
    	         success:function(data){
    	        	 
    	             $('#output').empty();
    	            $.each(data, function(index, item){   //각각의 데이터는 item에 저장됨. index는 parameter값 item은 실제 저장된 값.
    	             if(item.state == null) {
    	               var name = "'" + item.name + "'"; 
    	               var output = '';
    	               output += '<tr>';
    	               output += '<td>' + item.name + '</td>';
    	               output += '<td>' + item.phone + '</td>';
    	               output += '<td>' + item.term +"개월"+ '</td>';
    	                
    	               output += '<td><button type="button" class="btn btn-sm btnadd" onclick="add(' + name + ');">수락</button>&nbsp;<button type="button" class="btn btn-sm btnDel"onclick="del(' + name + ');">거절</button></td>';
    	               
    	               output += '</tr>';
    	               
    	             }
    	          
    	               console.log("output:"+output);
    	               $('#output').append(output);
    	        
    	            });
    	            
    	            
    	          },
    	         error:function(){
    	            alert("ajax통신 실패 !!!");
    	            check = false;
    	         }

    	      });
    	  if(check == true) {
  			$('#foo-table').DataTable({
  				language: lang_kor
  			});
  		}	
    	  
    	  
    	  var check2 = true;
    	  $.ajax({

    	         url : '/bit_project/partner_admin.se',
    	         type : "post",
    	         dataType : "json",
    	         async: false,
    	         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
    	         success:function(data){
    	        	//$('#output1').empty();
    	        	 
    	            $.each(data, function(index, item){   //각각의 데이터는 item에 저장됨. index는 parameter값 item은 실제 저장된 값.
    	            	if(item.state == 'Y') {
    	            		 
    	            		  var license_num = "'" + item.license_num + "'"; 
    	            		  var name = "'" + item.name + "'";
    	            		  var phone = "'" + item.phone + "'";
    	            		  var email = "'" + item.email + "'";
    	            		  var homepage = "'" + item.homepage + "'";
    	            		  var postal_num = "'" + item.postal_num + "'";
    	            		  var address = "'" + item.address + "'";
    	            		  var address_detail = "'" + item.address_detail + "'";
    	            		  var term = "'" + item.term + "'";
    	            		  var category = "'" + item.category + "'";
    	            		  var content = "'" + item.content + "'";
    	            		  var accept_date= "'" +item.accept_date + "'";
    	            		  
    	                      var output = '';
    	                      
    	                      output += '<tr>';  
    	                      output += '<td>' +item.name +'</td>';
    	                      output += '<td>' + '<input type="hidden" value='+ item.license_num +'><span>'+item.license_num+'</span></td>';
    	                      output += '<td>' + '<input type="hidden" value='+ item.homepage +'><span>'+item.homepage+'</span></td>';
    	                      output += '<td>' + '<input type="hidden" value='+ item.phone +'><span>'+item.phone+'</span></td>';
    	   	                  
    	                      var date = new Date(item.accept_date);
    	                      date = date_to_str(date, item.term);
    	                      var date2 = "'" + date + "'";

    	                      
    		  			      output += '<td>' + '<input type="hidden" value='+ date +'><span>'+ date +'</span></td>';
    		  			      output += '<td>' + '<input type="hidden" value='+ item.term +'><span>'+ item.term +'<span>개월</span></span></td>';
    		   	                  		   	               
    	                      output += '<td><button type="button" class="btn btn-sm btndetail" onclick="detail('+license_num+', '+name+','+phone+','+email+','+homepage+','+item.postal_num+','+address+','+address_detail+','+term +','+category+','+content+', '+date2+');">정보</button>&nbsp;<button type="button" class="btn btn-sm ptsave" style="display:none;">저장<button type="button" class="btn btn-sm btnmodify">수정</button>&nbsp;<button type="button" class="btn btn-sm btnDel1"onclick="del1(' + name + ');">삭제</button></td>';
    	                      output += '</tr>';
    	                      	             
    	            	}
    	            	
    	               console.log("output:"+output);
    	               $('#output1').append(output);
    	            
    	            });
    	         },
    	         error:function(){
    	        	 
    	            alert("ajax통신 실패 !!!");
    	            check2 = false;
    	         }

    	      });
    	  
    	  if(check2 == true) {
         	  $('#foo-table2').DataTable({
         		 language: lang_kor 
         	  });
           }
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
			<li class="active"><a href="partner_admin.se"><em class="fa fa-bar-chart">&nbsp;</em> 파트너 관리</a></li>

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
         	<li><a href="payment.se"><em class="fa fa-bar-chart">&nbsp;</em> 결제 관리</a></li>
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
				<li class="active">Partner</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Partner</h1>
			</div>
		</div><!--/.row-->
		
		
			<table id="foo-table" class="foo-ex">
    		<h2>파트너 신청</h2>
			<thead>
            	<tr>
                	<th>사업자명</th>
                	<th>연락처</th>
                	<th>계약기간</th>
                	<th>상태</th>
            	</tr>        
			</thead>
		
			<tbody id = "output">
			
			
			</tbody>
    	</table>
    	
    		<table id="foo-table2" class="foo-ex">
    		<h2>파트너 정보</h2>
			<thead>
            	<tr>
                	<th>사업자명</th>
                	<th>사업자 번호</th>
                	<th>홈페이지</th>
                	<th>연락처</th>
                	<th>계약기간</th>
                	<th>텀</th>
                	<th>상태</th>
            	</tr>        
			</thead>
			
			<tbody id = "output1">
			
			</tbody>
				
    	</table>
				 <!-- 파트너 가입신청 모달-->
			 
     <div class="modal" id="partner-dtmodal">
         <div class="modal-content" style="top:35%; height:700px;">  
             <span class="close-button" id="pclose-button1">&times;</span>
             <h1 class="title">파트너 정보</h1>
            <table style="text-align: center; margin: 0 auto;">
             <tr style="width: 80%;">
            	 <th>사업자 등록번호 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="license_num" readonly></th>
            </tr>
            <tr>
            	 <th>회사명 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="name" readonly></th>
            </tr>
            <tr>
            	 <th>연락처 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="phone" readonly></th>
            </tr>
            <tr>
            	 <th>이메일 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="email" readonly></th>
            </tr>
            <tr>
            	 <th>홈페이지 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="homepage" readonly></th>
            </tr>
            <tr>
            	 <th>우편번호 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="postal_num" readonly></th>
            </tr>
            <tr>
            	 <th>주소 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="address" readonly></th>
            </tr>
            <tr>
            	 <th>상세주소 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="address_detail" readonly></th>
            </tr>      
            <tr>
            	 <th>카테고리 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="category" readonly></th>
            </tr>
            <tr>
            	 <th>간단한 소개 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="content" readonly></th>
            </tr>
            <tr>
            	 <th>계약개월 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;" name="term" readonly></th>
            </tr>
            <tr>
            	 <th>계약기간 :</th>
                 <th><input type=text style="border-radius:5px; height:35px; width:250px;"name="date2" readonly></th>
            </tr>
			
			</table>
             </div>
         </div> 
     </div>

 	<script>
 	function detail(param_license_num, param_name, param_phone, param_email, param_homepage, param_postal_num, param_address, param_address_detail, param_term, param_category, param_content, param_date2){
 		$('input[name=license_num]').val(param_license_num);
 		$('input[name=name]').val(param_name);
 		$('input[name=phone]').val(param_phone);
 		$('input[name=email]').val(param_email);
 		$('input[name=homepage]').val(param_homepage);
 		$('input[name=postal_num]').val(param_postal_num);
 		$('input[name=address]').val(param_address);
 		$('input[name=address_detail]').val(param_address_detail);
 		$('input[name=term]').val(param_term);
 		$('input[name=category]').val(param_category);
 		$('input[name=content]').val(param_content);
 		$('input[name=date2]').val(param_date2);
 		
 		var Mmodal = document.querySelector("#partner-dtmodal");
        var Mtrigger = document.querySelector(".btndetail");
        var MpcloseButton = document.querySelector("#pclose-button1");
     
        Mmodal.classList.toggle("show-modal");
 	}
 	$(document).on("click", "#pclose-button1", function() {
 		var Mmodal = document.querySelector("#partner-dtmodal");
 		 Mmodal.classList.toggle("show-modal");
	})

 
     </script>
     
     <!---------------------여기까지 ------------------------------------->
		
		
		
	</div>	<!--/.main-->
	
	<%-- <script src="${pageContext.request.contextPath}/resources/js/admin/jquery-1.11.1.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart-data.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/easypiechart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/easypiechart-data.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/partner.js"></script>
	

		
</body>
</html>