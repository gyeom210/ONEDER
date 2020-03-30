<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*, com.spring.community.*" %>
<%
String nickname1 = (String)request.getAttribute("nickname");
%>
<html>
<head>
<title>community</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"  content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link href="${pageContext.request.contextPath}/resources/css/community.css" rel="stylesheet" type="text/css" /> <!-- css -->
<script src="https://kit.fontawesome.com/fa509a9993.js" crossorigin="anonymous"></script> <!--icon--> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/dropdown.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-custom.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/community_menu.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>

<div style="height: 60px;">
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
<header >
 	<%@ include file="/WEB-INF/views/header1.jsp" %> 
</header>
</div>

    <div id="community_container_menubar">
		<ul class="community_menubar">
        	<li data-tab="자유게시판" class="community_menubar_item"><a href="#">자유게시판</a></li>
        	<li data-tab="육아사진게시판" class="community_menubar_item"><a href="#">육아사진게시판</a></li>
        	<li data-tab="정보공유(팁)" class="community_menubar_item"><a href="#">정보공유(팁)</a></li>
        	<li data-tab="공구게시판" class="community_menubar_item"><a href="#">공구게시판</a></li>
        	<li data-tab="육아게시판" class="community_menubar_item"><a href="#">육아게시판</a></li>
        	<li data-tab="이슈,토론게시판" class="community_menubar_item"><a href="#">이슈,토론게시판</a></li>
        </ul>
    </div>
    
<!-- 게시판 내용 시작 -->
<div id="community_main">
    
    <div id="community_container_header">
        <div class="community_title"><p class="zz"></p></div>
    </div>
	 
	 <!-- 닉네임 검색 결과 -->
	 <div class="community_search_result"><p class="nickname_zz" style="font-size: 12px;"><%=nickname1 %></p><p>님 검색 결과</p></div>
	 
	<!-- 게시글 리스트 -->
    <div id="community_data" class="paginated"></div>
    
</div> 

<footer>
	 <%@ include file="/WEB-INF/views/footer.jsp" %> 
</footer>

 
<script>
	$("document").ready(function(){
		
		userSearch();
	});
	
	//태그 제거
	function removeTag( str ) {
		return str.replace(/(<([^>]+)>)/gi, "");
	}
	
		function userSearch() {
		var nickname = "<%=nickname1%>";
		var datacount = 0;
			
		$.ajax({
            url : '/bit_project/getuserSearch.co', 
	            type : "post", 
	            data : {"nickname" : nickname},
	            dataType: 'json',
	            async: false,
	        	cache : false,
            	success : function(data) {
            		$('#community_data').empty();
            		datacount = data.length;
            		if(data.length != 0) { //게시글 존재
 					 $.each(data, function(index, item) {
 						 
 						var output = ' ';
						var reg_date = new Date(item.regist); 
		                var date = date_format(reg_date);  //날짜 format
		                
		                		output += '<div id="community_container_mt" class="community_container_mt">';
							output += '<div class="underline"></div>';
							output += '<div class="community_mt_title">';
							output += '<a class="community_mt_link" href="community_detail.co?board_num=' + item.board_num  + '">';
							
							if(item.img != "null") {
       							output += '<div class="community_mt_img">';
       							output += '<img src="' + item.img + '" class="com_img1">';
       							output += '</div>';
       							}else {
   								output += '<div class="community_mt_img">';
       							output += '</div>';
       							}
							
							output += '<h2 class="community_name">' + item.board_name + '</h2>';
							output += '<p class="community_mt_mt">' + removeTag(item.content) + '</p>';
							output += '<footer class="community_mt_footer">';
							output += '<a class="community_mt_footer_user" href="community_user.co?nickname=' + item.nickname + ' ">';
							output += '<img src="' + item.profile + '">';
							output += '<span class="community_mt_footer_users">' +  item.nickname + ' </span>';
							output += '</a>';
							output += '<span class="community_mt_footer_caption">';
							output += '<span class="community_mt_footer_time">' + date + ' </span>';
							output += '<span class="community_mt_footer_comments">' + "댓글 " + item.co_count + ' </span>';
							output += '<span class="community_mt_footer_views">' + "조회수 " + item.count + ' </span>';
							output += '<span class="community_mt_footer_category">' + "[" + item.category + "]" + ' </span>';
							output += '</span>';
							output += '</footer>';
							output += '</a>';
							output += '</div><br>';
							output += '</div>';
							
							$('#community_data').append(output);
						}); 
		            
 				}
            		else {
            			var outputnull = "<div class='community_ncontainer'>";
							outputnull += "<div>검색 결과가 없습니다.</div>";
							outputnull += "</div>";
							$('#community_data').append(outputnull);
						}
            		page(datacount);
					},
	              error : function(data){
	            		alert('검색 실패');
            }
        }); //ajax
		}
        
        //날짜 format
        function date_format(format) {
            var year = format.getFullYear();
            var month = format.getMonth()+1;
            var hour = format.getHours();
            var min = format.getMinutes();
            
            if(month<10) {
               month = '0' + month;
            }
            var date = format.getHours();
            if(hour<10) {
               hour = '0' + hour;
            }
            var min = format.getMinutes();
            if(min<10) {
               min = '0' + min;
            }
            return year + "." + month + "." + date + " " + hour +":" + min;
         }
      
        function page(datacount){ 

        	var reSortColors = function($table) {
//        		  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
//        		  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
        	 };
        			
        	 $('div.paginated').each(function() {
        	  var pagesu = 10;  //페이지 번호 갯수
        	  var currentPage = 0;
        	  var numPerPage = 5;  //목록의 수
        	  var $table = $(this);    
        	  
        	  //length로 원래 리스트의 전체길이구함
        	  var numRows = datacount;
        	  //Math.ceil를 이용하여 반올림
        	  var numPages = Math.ceil(numRows / numPerPage);
        	  //리스트가 없으면 종료
        	  if (numPages==0) return;
        	  //pager라는 클래스의 div엘리먼트 작성
        	  var $pager = $('<div align="center" id="remo"><div class="pager"></div></div>');
        	  
        	  var nowp = currentPage;
        	  var endp = nowp+5;
        	  
        	  //페이지를 클릭하면 다시 셋팅
        	  $table.bind('repaginate', function() {
        	  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
        	  
        	   $table.find('div.community_container_mt').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
        	   $("#remo").html("");
        	   
        	   if (numPages > 1) {     // 한페이지 이상이면
        	    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
        	     nowp = 0;     // 1부터 
        	     endp = pagesu;    // 10까지
        	    }else{
        	     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
        	     endp = nowp+pagesu;   // 10까지
        	     pi = 1;
        	    }
        	    
        	    if (numPages < endp) {   // 10페이지가 안되면
        	     endp = numPages;   // 마지막페이지를 갯수 만큼
        	     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
        	    }
        	    if (nowp < 1) {     // 시작이 음수 or 0 이면
        	     nowp = 0;     // 1페이지부터 시작
        	    }
        	   }else{       // 한페이지 이하이면
        	    nowp = 0;      // 한번만 페이징 생성
        	    endp = numPages;
        	   }

        	   // [처음]
        	   $('<br /><span class="page-number" onclick="window.scrollTo(0,0);">[처음]</span>').bind('click', {newPage: page},function(event) {
        	          currentPage = 0;   
        	          $table.trigger('repaginate');  
        	          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
        	      }).appendTo($pager).addClass('clickable');
        	    // [이전]
        	      $('<span class="page-number" onclick="window.scrollTo(0,0);">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
        	          if(currentPage == 0) return; 
        	          currentPage = currentPage-1;
        	    $table.trigger('repaginate'); 
        	    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
        	   }).appendTo($pager).addClass('clickable');
        	    // [1,2,3,4,5,6,7,8]
        	   for (var page = nowp ; page < endp; page++) {
        	    $('<span class="page-number" style="margin-left: 8px;" onclick="window.scrollTo(0,0);"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
        	     currentPage = event.data['newPage'];
        	     $table.trigger('repaginate');
        	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
        	     }).appendTo($pager).addClass('clickable');
        	   } 
        	    // [다음]
        	      $('<span class="page-number" onclick="window.scrollTo(0,0);">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
        	    if(currentPage == numPages-1) return;
        	        currentPage = currentPage+1;
        	    $table.trigger('repaginate'); 
        	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
        	   }).appendTo($pager).addClass('clickable');
        	    // [끝]
        	   $('<span class="page-number" onclick="window.scrollTo(0,0);">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
        	           currentPage = numPages-1;
        	           $table.trigger('repaginate');
        	           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
        	   }).appendTo($pager).addClass('clickable');
        	     
        	     $($(".page-number")[2]).addClass('active');
        	reSortColors($table);
        	  });
        	   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
        	   $pager.appendTo($table);
        	   $table.trigger('repaginate');
        	 });
        	}
</script>

</body>
</html>