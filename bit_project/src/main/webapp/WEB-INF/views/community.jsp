<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*, com.spring.community.*" %>
<%@ page import="java.util.*, com.spring.login.*" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
	LoginVO vo = (LoginVO)request.getAttribute("vo");
	String category = (String)request.getAttribute("category");

	String email_co = (String)session.getAttribute("email");
	LoginVO userDetail_co = (LoginVO)session.getAttribute("userDetail");
	
	String group = "일반회원";
	if (email_co != null){ 
		group = userDetail_co.getUsergroup();
	}
%>	
<!DOCTYPE html>
<html>
<head>
<title>community</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"  content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link href="${pageContext.request.contextPath}/resources/css/community.css" rel="stylesheet" type="text/css" /> <!-- css -->
<script src="https://kit.fontawesome.com/fa509a9993.js" crossorigin="anonymous"></script> <!--icon--> 
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/dropdown.css" /> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-custom.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/community.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/community_menu.js"></script>

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
        <div class="community_title"><p class="community_category"><%=category %></p></div>
    </div>
    
    <!-- filter + dropdown -->
	<div id="community_container_filter">
	
	<!-- dropdown -->
     <div class="community_filter">
		<select id="wrapper-dropdown" class="wrapper-dropdown" onchange="button_click()">
			<option value="최신순">최신순</option>
			<option value="조회순">조회순</option>
			<option value="댓글순">댓글순</option>
		</select>
   	</div>
   	
   	<!-- 글쓰기 버튼 -->
   	<input type="button" onclick="write_btn('<%=email_co %>','<%=group %>')" id="community_write" value="글쓰기">
   	
		<!-- filter -->
	    <div class="community_search">
	        <div class="wrap">
	            <input id="search_form" name="search_form" type="search">
	            <i class="fas fa-search fa-2x" style="color: darkgray;">
	            		<input id="search_submit"  type="submit" name="search_submit"></i> <!-- icon -->
	        </div>
	    </div>
   	
	</div>
	
	<!-- 검색 결과 -->
	 <div class="community_search_result"><p class="community_search_result_text"></p></div>
	 
	<!-- 게시글 리스트 -->
	<% if(category.equals("육아사진게시판")) { %>
    	<div id="community_data_d"></div>
    <% } else { %>
    	<div id="community_data"></div>
    <% } %>
    
     <!-- 페이징 -->
    <div class="paginate" style="text-align:center;"></div>
    
</div> <!-- 게시판 내용 끝 -->

<script>
//글쓰기 버튼 
//session 없으면 로그인으로 이동, 비매너회원은 접근금지
	function write_btn(){
		var email = '<%=email%>';
		var group = '<%=group%>';
		
		if(email != 'null') {
			if(group != "비매너회원") {
				window.location.href = "community_writeForm.co";
			}else {
				alert("접근금지");
  			return false;
			}
		}else{
			alert("로그인 후 이용해주세요");
			window.location.href = "login.me";	
			return false;
		}
	}
</script>

<div style="height: 50px;">
<footer>
	 <%@ include file="/WEB-INF/views/footer.jsp" %> 
</footer>
</div>

</body>
</html>