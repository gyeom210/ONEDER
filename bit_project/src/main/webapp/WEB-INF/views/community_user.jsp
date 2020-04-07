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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-custom.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/community_menu.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>

<%@ include file="/WEB-INF/views/chatframe.jsp" %>
<div style="height: 90px;">

<header >
 	<%@ include file="/WEB-INF/views/header1.jsp" %> 
</header>
</div>

    <div id="community_container_menubar">
		<ul class="community_menubar">
        	<li data-tab="자유게시판" class="community_menubar_item"><a href="#" style="color: #616161;">자유게시판</a></li>
        	<li data-tab="육아사진게시판" class="community_menubar_item"><a href="#" style="color: #616161;">육아사진게시판</a></li>
        	<li data-tab="정보공유(팁)" class="community_menubar_item"><a href="#" style="color: #616161;">정보공유(팁)</a></li>
        	<li data-tab="공구게시판" class="community_menubar_item"><a href="#" style="color: #616161;">공구게시판</a></li>
        	<li data-tab="육아게시판" class="community_menubar_item"><a href="#" style="color: #616161;">육아게시판</a></li>
        	<li data-tab="이슈,토론게시판" class="community_menubar_item"><a href="#" style="color: #616161;">이슈,토론게시판</a></li>
        </ul>
    </div>
    
<!-- 게시판 내용 시작 -->
<div id="community_main">
    
    <div id="community_container_header">
        <div class="community_title"><p class="community_category"></p></div>
    </div>
	 
	 <!-- 닉네임 검색 결과 -->
	 <div class="community_search_result" style=""><p class="nickname_zz" style="font-size: 12px;"><%=nickname1 %></p><p>님 검색 결과</p></div>
	 
	<!-- 게시글 리스트 -->
    <div id="community_data"></div>
    
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
		                
		                output += '<div id="community_container_mt">';
							output += '<div class="underline"></div>';
							output += '<div class="community_mt_title">';
							output += '<a class="community_mt_link" href="community_detail.co?board_num=' + item.board_num  + '"></a>';
							
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
							output += '<a class="community_mt_footer_user" href="community_user.co?nickname=' + item.nickname + '">';
							output += '<img src="' + item.profile + '">';
							output += '<span class="community_mt_footer_users">' +  item.nickname + '</span>';
							output += '</a>';
							output += '<span class="community_mt_footer_caption">';
							output += '<span class="community_mt_footer_time">' + date + '</span>';
							output += '<span class="community_mt_footer_comments">' + "댓글 " + (item.co_count+item.an_count) + ' </span>';
							output += '<span class="community_mt_footer_views">' + "조회수 " + item.count + ' </span>';
							output += '<span class="community_mt_footer_category">' + "[" + item.category + "]" + ' </span>';
							output += '</span>';
							output += '</footer>';
							output += '</div>';
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
					},
	              error : function(data){
	            		alert('community search error');
            }
        }); //ajax
		}
        
		//날짜 format
        function date_format(format) {
        	var year = format.getFullYear();
            var month = format.getMonth()+1;
            var date = format.getDate();
            var hour = format.getHours();
            
            if(month<10) {
            	month = '0' + month;
            }
            if(date<10) {
            	date = '0' + date;
            }
            var min = format.getMinutes();
            if(min<10) {
               min = '0' + min;
            }
            return year + "." + month + "." + date + " ";
         }
      
</script>

</body>
</html>