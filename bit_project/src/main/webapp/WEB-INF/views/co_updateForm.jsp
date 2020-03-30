<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.writing.WritingVO" %>
<%
	WritingVO writingvo = (WritingVO)request.getAttribute("writingvo");
%>
<!DOCTYPE html>
<html>
<head>
<title>community(main)</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link href="${pageContext.request.contextPath}/resources/css/community.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/community_writeform.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" />

<!-- summernote -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<!-- include summernote-ko-KR -->
 <script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/community_menu.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
	<div style="height: 90px;">
		<header>
			<%@ include file="/WEB-INF/views/header2.jsp"%>
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

	<div id="community_container_header">
		<div class="community_title">
			<h1></h1>
		</div>
		<div></div>
	</div>
 	<div id="community-contentbox">
		<form method="POST" name="edit_Form" action="update.cw" role="form" enctype="multipart/form-data">		
			<input type="hidden" name="board_num" value="<%=writingvo.getBoard_num() %>" />
			<input type="hidden" name="nickname" value="<%=writingvo.getNickname() %>" />
			<input type="hidden" name="email" value="<%=writingvo.getEmail() %>" />
			<div id="cententbox-top">
			 	<span> <select id="category_select" name="category" disabled>
						<option value="<%=writingvo.getCategory() %>"><%=writingvo.getCategory() %></option>
				</select>
				</span> <span> <input id="title" name="board_name" class="" type="text" value="<%=writingvo.getBoard_name() %>">
				</span>
			</div>

			<div id="contentbox-middle">
				<textarea class="summernote" id="summernote" name="content" maxlength="140" rows="7"></textarea>
			</div>
			<div id="contentbox-bottom"> 
				<input type="button" id="cancel-btn" onclick="history.back(-1);" value="취소">
				<input type ="button" style="background-color: #ffb0b1;"   id="submit-btn" onclick="update_chk()" value="수정">
				
			</div>
		</form>
	</div> 
	<footer id="footer">
        <div id="footer_sns">
            <div class="container">
                <div class="footer_sns">
                    <ul>
                        <li class="icon s1"><a href="#"><span class="ir_pm">트위터</span></a></li>
                        <li class="icon s2"><a href="#"><span class="ir_pm">페이스북</span></a></li>
                        <li class="icon s3"><a href="#"><span class="ir_pm">인스타그램</span></a></li>
                        <li class="icon s4"><a href="#"><span class="ir_pm">구글 플레이</span></a></li>
                        <li class="icon s5"><a href="#"><span class="ir_pm">아이폰 앱스토어</span></a></li>
                    </ul>
                    <div class="tel">
                        <a href="#">ARS <em>1544-5252</em></a>
                    </div>
                </div>
            </div>
       	</div>
        <div id="footer_infor">
            <div class="container">
                <div class="row">
                    <div class="footer_infor">
                        <!-- <h2><img src="assets/img/logo_footer.png" alt="megabox"></h2> -->
              <h2 id="oneder" style="color: #8f8f8f; font-size: 30px; margin: 0 10px; cursor:pointer; font-weight: normal; font-family: 'S-CoreDream-4Regular';">ONEDER</h2>  
                        <ul style="margin-bottom: 0px;">  
                           		<li><a href="kindergarten.ms">어린이집</a></li>
								<li><a href="partner.ms">파트너</a></li>
								<li><a href="contactus.ms">고객센터</a></li>
								<li><a href="share.ms">개인 쉐어</a></li>
								<li><a href="#">어린이집 쉐어</a></li>
							 
                        </ul>
                        <address>
                            <p style="margin-bottom: 0px;">서울특별시 서초구 강남대로 459 <br><span class="bar2" style="color: #8f8f8f;">대표자명 김진근</span>
                                <br><span class="bar2" style="color: #8f8f8f;">사업자등록번호
                                    111-11-1111</span> 통신판매업신고번호 제 111호</p>
                            <p>Copyright 2020 by Bit Inc. All right reserved</p>
                        </address>
                    </div>
                </div>
            </div>
        </div>
    </footer>
  <script type="text/javascript">
  function update_chk() {
	  var edit_Form = document.edit_Form;
	  var content = edit_Form.content.value;
	  
		var target = document.getElementById("category_select");
		var option = target.options[target.selectedIndex].value;
		
		if(!content) {
		 	alert("내용을 입력해주세요");
		}else {
		 	if(option == "육아사진게시판" && $(content).find('img').attr('src') == null){
		  		alert("사진을 1개 이상 올려주세요");
		 }else {
			 edit_Form.submit();
		 }
		}
	  }
  
  $(document).ready(function() {
   
	    $("#summernote").summernote({
	        placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
	        lang : 'ko-KR',
	        callbacks: {
	            onImageUpload:function(files, editor, welEditable){
	                for(var i=files.length-1;i>=0;i--){
	                    sendFile(files[i], this);
	                }
	            }
	        }
	    });
	    $("#summernote").summernote('code', '${writingvo.content}'); //코드 수정할 때 필요
	    
	});

	function sendFile(file, editor, welEditable){
	    var form_data = new FormData();
	    form_data.append('file', file);
	    $.ajax({
	        data:form_data,
	        type:"POST",
	        url:'/bit_project/image.im',
	        dataType : "json",
	        cache:false,
	        contentType:false,
	        processData:false,
			success: function(data){
				var obj = data.url;
				alert(obj);
    		    var image = $('<img>').attr('src', '' + obj); // 에디터에 img 태그로 저장
	        	$('.summernote').summernote("insertNode", image[0]); // summernote 에디터에 img 태그 전송
	        },
	        error: function() {
	            console.log("에이젝스 통신 실패");
	        }
	    });
	}
</script>
</body>
</html>