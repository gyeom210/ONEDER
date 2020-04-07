<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.spring.community.*" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.spring.login.*" %>
<%@ page session="true" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
	CommunityVO cmvo = (CommunityVO)request.getAttribute("cmvo");
	int comment_count = (int)request.getAttribute("cocount");
	String img_e = (String)request.getAttribute("img");
	String email_e = (String)request.getAttribute("email_co");
	
	String email_co = (String)session.getAttribute("email");
	String nickname_co = (String)session.getAttribute("nickname");
	String img_co = (String)session.getAttribute("img");
	LoginVO userDetail_co = (LoginVO)session.getAttribute("userDetail");
	
	String group = null;
	if(userDetail_co != null) {
		group = userDetail_co.getUsergroup();
	}
	
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"  content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">

<title>community</title>
<link href="${pageContext.request.contextPath}/resources/css/community_detail.css" rel="stylesheet" type="text/css" /> <!-- css -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/community_menu.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>

<body>
<!-- header 시작 -->
<div style="height: 90px;">
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
<header >
 	<%@ include file="/WEB-INF/views/header1.jsp" %>  
</header>
</div>
<!-- header 끝 -->

    <div id="community_container_menubar">
		<ul class="community_menubar">
        	<li data-tab="자유게시판" class="community_menubar_item"><a href="#"><span class="category-txt">자유게시판</span></a></li>
        	<li data-tab="육아사진게시판" class="community_menubar_item"><a href="#"><span class="category-txt">육아사진게시판</span></a></li>
        	<li data-tab="정보공유(팁)" class="community_menubar_item"><a href="#"><span class="category-txt">정보공유(팁)</span></a></li>
        	<li data-tab="공구게시판" class="community_menubar_item"><a href="#"><span class="category-txt">공구게시판</span></a></li>
        	<li data-tab="육아게시판" class="community_menubar_item"><a href="#"><span class="category-txt">육아게시판</span></a></li>
        	<li data-tab="이슈,토론게시판" class="community_menubar_item"><a href="#"><span class="category-txt">이슈,토론게시판</span></a></li>
        </ul>
    </div>

    <div id="community_container_header_d">
        <div class="community_title_d">
            <h2 class="category_detail"><%=cmvo.getCategory() %></h2>
        </div>
    </div>

<!--     </div> -->
    <!--게시글 시작-->
    <div id="community_container_mt_d" style="max-width:950px; margin:0 auto;">
        <div class="community_mt_title_d">
            <h1 class="detail_subject"><%=cmvo.getBoard_name() %></h1>
        </div>
        <div class="community_mt_title" style="border-bottom:2px solid rgba(27,25,25,0.26); padding-bottom:10px;">
        	
        	<img src="<%=img_e %>">
        	<p style="margin-left:10px; margin-right:10px; margin-top:5px; font-size:1.2rem;"><%=cmvo.getNickname() %></p>
        	
        	  <% if(email_co != null ) { %> <!-- 세션 존재 -->
	                <% if (email_e.equals(email_co)) { %> <!-- 작성자 본인일때 글수정,글삭제 표시 --> 
	                <div class="community_mt_footer_btn">
	                
	                <button type="button" class="community_mt_footer_update_btn" onclick="location.href='community_updateForm.cw?board_num=<%=cmvo.getBoard_num() %>'">글수정</button>
	           		<button type="button" class="community_mt_footer_delete_btn" onclick="delchk('<%=cmvo.getBoard_num() %>');">글삭제</button>
	                
	                <% } else if(userDetail_co.getUsergroup().equals("admin")) { %> <!-- 관리자일때 글삭제 표시 -->
	                		<button type="button" class="community_mt_footer_delete_btn" onclick="delchk('<%=cmvo.getBoard_num() %>');">글삭제</button>
	                <% } %>
	                	 </div>
                <% } %>
                
        </div>
       
        <div class="community_mt_mt">
            <%=cmvo.getContent() %>
        </div>
        <footer class="community_mt_footer">
            <div class="community_mt_footer_caption">
                <span class="community_mt_footer_time">
                    <%=sdf.format(cmvo.getRegist()) %>
                </span>
                <span class="community_mt_footer_views">
                    조회수 <%=cmvo.getCount() %>
                </span>
                <span class="community_mt_footer_share">
        
                </span>
                <div class="community_mt_footer_share_click"> <!-- sns 공유 -->
                    <a id="kakao-link-btn" href="javascript:kakao_click();"><img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" style="width: 30px; height: 30px"/></a>
                    <a href="http://share.naver.com/web/shareView.nhn?url=http://localhost:8080/bit_project/community_detail.co?board_num=${cmvo.getBoard_num()}&title=${cmvo.getBoard_name()}" onclick="window.open(this.href, '', 'resizable=no,status=no,location=no,toolbar=no,menubar=no,fullscreen=no,scrollbars=no,dependent=no,width=600,height=600'); return false;">
                    <img src="${pageContext.request.contextPath}/resources/icons/naver.png" style="border-radius: 5px;" ></a>
                    <div class="line-it-button" data-lang="ko" data-type="share-b" data-ver="3" data-url="http://localhost:8080/bit_project/community_detail.co?board_num=${cmvo.getBoard_num()}"  data-color="default" data-size="small" data-count="false" style="display: none;"></div>
                </div>
              
            </div>
        </footer>
       
    </div>
    <!-- 게시글  끝 -->
    
    <!-- 댓글입력창 시작 -->
    <div id="community_container_comments">
        <div class="community_comments_count">
            <p>댓글 <span class="comment_count_num"><%=comment_count %></span></p>
        </div>
     <form method="POST" name="commentsForm" id ="commentsForm" accept-charset="utf-8">
        <div class="community_comments_form">
            <div class="community_comments_form_user">
            <% if(email_co != null) { %>
            	<input type="hidden" name="nickname" id="nickname1" value="<%=nickname_co %>">
            	<input type="hidden" name="email" id="email1" value="<%=email_co %>">
            <% } %>
            	
            	<% if(email_co == null) { %>
            	<img src="/bit_project/image/0c57c52f289644ceb799d673566eed91.png">
            	<% } else { %>
                <img src="<%=img_co %>" >
                <% } %>
                
            </div>
            <div class="community_comments_form_input">
            <input type="hidden" name="board_num" id="board_num" value="<%=cmvo.getBoard_num() %>">
                <div class="community_comments_form_content">
                <% if(email_co != null) { %>
                	<% if(userDetail_co.getUsergroup().equals("비매너회원")) {%>
                		<input type="text" class="community_comments_form_comments" name="content" placeholder="의견을 남겨 보세요." readonly>
                	<% } else { %>
                    <input type="text" class="community_comments_form_comments" name="content" contenteditable="true" placeholder="의견을 남겨 보세요.">
                <% } %>
                <% } %>
                </div>
                <div class="community_comments_form_actions">
                    <button class="community_comments_form_enter" id="community_comments_form_enter" type="button" >등록</button>
                </div>
            </div>
        </div>
	</form>
    <!-- 댓글입력창 끝 -->   
       
       <!--  댓글 목록 시작 -->
        <div class="community_comments_view"></div>
		
		<!-- 댓글 더보기 -->
		<!-- <div class="community_comments_view_more" style="width:100px; height:25px; margin:0 auto;"><button type="button" class="view_more" style="width:100%; height:100%; border-radius:5px;">더보기</button></div> -->
	</div> <!-- 댓글 입력창 끝 -->
	
  
<footer>
	<%@ include file="/WEB-INF/views/footer.jsp" %> 
</footer>
 


<script type="text/javascript">
var start = 6;
var end = 10;

function delchk(board_num) {
	if(confirm("게시글을 삭제하시겠습니까?")) {
		location.href= 'delete.cw?board_num=' + board_num
	}else {
		return false;
	}
}


	$("document").ready(function(){
		coList();
		
		//댓글 등록
		document.getElementById("community_comments_form_enter").addEventListener("click", cowrite);
		
		function cowrite() {
			if($.trim($('.community_comments_form_comments').val()) == "") {
				alert("댓글을 입력해주세요");
				return false;
			}

			var params = $("#commentsForm").serialize(); //#commentsForm : 이름과 값. 문자형태로 만들어 params에 저장
			
			$.ajax({
				url:'/bit_project/writeCO.co',
				type: 'POST',
				data: params,
				dataType: "json",
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(retVal) {
					if (retVal.res == "OK") { //데이터 성공일때 이벤트 작성
						coList();
						$('.community_comments_form_comments').val(''); //초기화
					}
				},
				error:function(request,status,error){
			    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
			}); //ajax
		} //function
		
		
		//대댓 폼
		$('.answer_btn').click(function() {
			var email_co = '<%=(String)session.getAttribute("email")%>';
			var group1 = '<%=group%>';
		
			if(email_co == 'null') {
				alert("로그인 후 이용해주세요");
				window.location.href = "login.me";	
				return false;
			}else {
				if(group1 == "비매너회원") {
					alert("접근금지입니다.");
					return false;
				}else {
	        		if ($(this).parents(".community_comments_view_container").next().css("display") == 'none') {
	                		$(this).parents(".community_comments_view_container").next().show();
	                } else {
	                    $(this).parents(".community_comments_view_container").next().hide();
	                }
				} //일반회원
			} // email_co != null
		});
		
	}); //ready
	
	//focus 마우스 위치 글자 맨뒤로 보내기
	$.fn.setCursorPosition = function( pos )
	{
	    this.each( function( index, elem ) {
	        if( elem.setSelectionRange ) {
	            elem.setSelectionRange(pos, pos);
	        } else if( elem.createTextRange ) {
	            var range = elem.createTextRange();
	            range.collapse(true);
	            range.moveEnd('character', pos);
	            range.moveStart('character', pos);
	            range.select();
	        }
	    });
	    
	    return this;
	};
	
	//댓글 수정버튼 눌렀을 시 폼
    function comod_form($comment_num) {
     	var num = $comment_num;
     	
     	$(this).parent().prev().css("display", "none");
     	console.log(this);
   		$('input[id="' + num + '"]').removeAttr("readonly");
   		$('input[id="' + num + '"]').focus().setCursorPosition($('input[id="' + num + '"]').val().length);
   		$('input[id="' + num + '"]').css("border", "1px solid #ccc9c9");
   		$("div[id='" + num + "']").html('<button type="button" class="community_comment_update_btn" onclick="comod_btn(' + num + ')">수정하기</button></div>');
	} 

    //댓글 수정
    function comod_btn($num) {
    	var num1 = $num;
    	var co = $('input[id="' + num1 + '"]').val();
    	$('.community_comment_answer_btn').hide();
    	
       jQuery.ajax({
          url : '/bit_project/updateCO.co',
          type : 'POST',
          data : {'comment_num' : num1, 'content' : co},
          contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
          dataType : "json",
          success : function(retVal) {
             if(retVal.res == "OK") {
            	 alert("댓글이 수정되었습니다.");
            	 coList();
             }
             else {
                alert("댓글 수정 실패!!!")
             }
          },
          error:function() {
             alert("ajax 통신 실패!(update)");
          }
       });
    }
    
  //댓글 삭제
	function codel_btn($comment_num) {
	 	var num = $comment_num;
		msg = "삭제하시겠습니까?";
        if (confirm(msg)!=0) { //Y
        	$.ajax({
				url:'/bit_project/deleteCO.co',
				type: 'POST',
				data:{'comment_num' : num},
				dataType: "json",
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(retVal) {
					if (retVal.res == "OK") {
						alert("댓글이 삭제되었습니다.");
						coList();
					}
					else {
						alert("댓글 삭제 실패 !!");
					}

				},
				error:function(request,status,error){
			    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
        	}); //ajax
        } else { //N
        	alert("취소되었습니다");
		}
	}
 	
	//댓글 목록
	function coList() {
		$('.community_comments_view').empty();
		var datacount = '<%=comment_count %>';
				
		$.ajax({
			url:'/bit_project/getCO.co',
			type: 'POST',
			data:{'board_num' : $("#board_num").attr("value")},
			dataType: "json",
			async: false,
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				if(data.length!=0){ //댓글 존재할시
					 $.each(data, function(index, item) {
						var output = ' ';
						var reg_date = new Date(item.regist); 
	                		var date = date_format(reg_date);
	                		var email = "<%=email_co %>";
	                		var nickname = "<%=nickname_co %>";
	                		var img = "<%=img_co %>";
	                
						output += '<div class="comments_container" value="' + item.comment_num + '">';	 
	                		output += '<div class="community_comments_view_user">';
	                		output += '<img src="' + item.profile + '">';
	                		output += '</div>';
	                		output += '<div class="community_comments_view_container" id="' + item.comment_num + '_co">';
	                		output += '<div class="community_comments_view_comments">'; 
	                		output += '<input type="hidden" id="comment_num" value="' + item.comment_num + '">';
	                		output += '<span class="community_mt_footer_users"><b>' + item.nickname + '</b></span>';
	                		output += '<input type="hidden" id="email" value="' + item.email + '">';
	                		output += '<input type="text" id="' + item.comment_num + '" class="comment_form" readonly onfocus:"this.blur()"; value="' + item.content + '" style="padding-left:10px;">';
	                		output += '</div>';
	                		output += '<div class="community_comments_view_actions">';
	                		output += '<span class="community_comments_view_time" style="margin-top:3px; margin-right:10px;">' + date + '</span>';
	                		output += '<div class="community_comments_view_add">'; 
	                		output += '<button type="button" class="community_comment_answer_btn answer_btn">' + "답글작성" + '</button>' + '</div>';
	                		
	                		if(item.email == email) 
	                		{ //로그인한사람과 댓글쓴사람이 같을 경우 수정 삭제 가능
						output += '<div class="community_comments_view_modify" id="' + item.comment_num + '">';
						output += '<button type="button" class="community_comment_update_btn" onclick="comod_form(' + item.comment_num + ')">' + "수정" + '</button>';
						output += '<button type="button" class="community_comment_delete_btn" onclick="codel_btn(' + item.comment_num + ')">' + "삭제" + '</button></div>';
	                		}
						output += '</div>';
						output += '</div>';
						
						output += '<div class="answer_form" style="display: none;" id="' + item.comment_num + '">';
						output += '<form id="answerForm" method="POST" accept-charset="utf-8">';
				     	output += '<div class="community_answer_form">';
				     	output += '<div class="community_answer_form_user">';
				     	output += '<input type="hidden" name="nickname" id="nickname1" value="' + nickname + '">';
				     	output += '<img src="' + img + '">';
				     	output += '<input type="hidden" name="email" id="email" value="' + email + '">';
				     	output += '</div>';
				     	output += '<div class="community_answer_form_input">';
				     	output += '<input type="hidden" name="comment_num" value="' + item.comment_num + '">';
				     	output += '<input type="hidden" name="board_num" value="' + item.board_num + '">';
				     	output += '<div class="community_answer_form_content">';
				     	output += '<input type="text" class="community_answer_form_comments" name="content" contenteditable="true" placeholder="의견을 남겨 보세요.">';
				     	output += '</div>';
				     	output += '<div class="community_answer_form_actions">';
				     	output += '<button class="community_answer_form_enter" id="community_answer_form_enter" type="button" onclick="answerwrite(' + item.comment_num + ')">' + "등록" + '</button>';
				     	output += '</div>';
				     	output += '</div>';
				     	output += '</div>';
				     	output += '</form>';
				     	output += '</div>';
						output += '</div>';
						
						$('.community_comments_view').append(output);
					alert(item.comment_num + "번 대댓 찾는중");
	                answerList(item.comment_num);
				});
					 $('.comment_count_num').load(location.href + ' .comment_count_num'); //댓글 갯수 카운트 새로고침
					 if(datacount >= 6) {
						 var output = '';
						 
						 output += '<div class="community_comments_view_more"><a class="view_more" href="javascript:moreComment();">더보기</a></div>';
						 $('.community_comments_view').append(output);
					 }
				} else { //댓글 없을때
					var outputnull = "<div>";
					outputnull += "<div class='cono' style='text-align:center; height: 50px; padding-top: 40px;'>등록된 댓글이 없습니다.</div>";
					outputnull += "</div>";
					$('.community_comments_view').append(outputnull);
				}
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		       }
			}); //ajax
		}
  
	
	//댓글 더보기
	function moreComment(){
		var datacount = '<%=comment_count %>';
		
		$.ajax({
			url:'/bit_project/getCOM.co',
			type: 'POST',
			data:{'board_num' : $("#board_num").attr("value"), 'start' : start, 'end' : end},
			dataType: "json",
			async: false,
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				if(data.length!=0){ //댓글 존재할시
					$('.community_comments_view_more').remove();
					 $.each(data, function(index, item) {
						var output = ' ';
						var reg_date = new Date(item.regist); 
	                		var date = date_format(reg_date);
	                		var email = "<%=email_co %>";
	                		var nickname = "<%=nickname_co %>";
	                		var img = "<%=img_co %>";
	                
						output += '<div class="comments_container" value="' + item.comment_num + '">';	 
	                		output += '<div class="community_comments_view_user">';
	                		output += '<img src="' + item.profile + '">';
	                		output += '</div>';
	                		output += '<div class="community_comments_view_container" id="' + item.comment_num + '_co">';
	                		output += '<div class="community_comments_view_comments">'; 
	                		output += '<input type="hidden" id="comment_num" value="' + item.comment_num + '">';
	                		output += '<span class="community_mt_footer_users"><b>' + item.nickname + '</b></span>';
	                		output += '<input type="hidden" id="email" value="' + item.email + '">';
	                		output += '<input type="text" id="' + item.comment_num + '" class="comment_form" readonly onfocus:"this.blur()"; value="' + item.content + '" style="padding-left:10px;">';
	                		output += '</div>';
	                		output += '<div class="community_comments_view_actions">';
	                		output += '<span class="community_comments_view_time" style="margin-top:3px; margin-right:10px;">' + date + '</span>';
	                		output += '<div class="community_comments_view_add">'; 
	                		output += '<button type="button" class="community_comment_answer_btn answer_btn">' + "답글작성" + '</button>' + '</div>';
	                		
	                		if(item.email == email) 
	                		{ //로그인한사람과 댓글쓴사람이 같을 경우 수정 삭제 가능
						output += '<div class="community_comments_view_modify" id="' + item.comment_num + '">';
						output += '<button type="button" class="community_comment_update_btn" onclick="comod_form(' + item.comment_num + ')">' + "수정" + '</button>';
						output += '<button type="button" class="community_comment_delete_btn" onclick="codel_btn(' + item.comment_num + ')">' + "삭제" + '</button></div>';
	                		}
						output += '</div>';
						output += '</div>';
						
						output += '<div class="answer_form" style="display: none;" id="' + item.comment_num + '">';
						output += '<form id="answerForm" method="POST" accept-charset="utf-8">';
				     	output += '<div class="community_answer_form">';
				     	output += '<div class="community_answer_form_user">';
				     	output += '<input type="hidden" name="nickname" id="nickname1" value="' + nickname + '">';
				     	output += '<img src="' + img + '">';
				     	output += '<input type="hidden" name="email" id="email" value="' + email + '">';
				     	output += '</div>';
				     	output += '<div class="community_answer_form_input">';
				     	output += '<input type="hidden" name="comment_num" value="' + item.comment_num + '">';
				     	output += '<input type="hidden" name="board_num" value="' + item.board_num + '">';
				     	output += '<div class="community_answer_form_content">';
				     	output += '<input type="text" class="community_answer_form_comments" name="content" contenteditable="true" placeholder="의견을 남겨 보세요.">';
				     	output += '</div>';
				     	output += '<div class="community_answer_form_actions">';
				     	output += '<button class="community_answer_form_enter" id="community_answer_form_enter" type="button" onclick="answerwrite(' + item.comment_num + ')">' + "등록" + '</button>';
				     	output += '</div>';
				     	output += '</div>';
				     	output += '</div>';
				     	output += '</form>';
				     	output += '</div>';
						output += '</div>';
						
						$('.community_comments_view').append(output);
	                alert(item.comment_num + "번 대댓 찾는중");
	                answerList(item.comment_num);
				});
					 $('.comment_count_num').load(location.href + ' .comment_count_num'); //댓글 갯수 카운트 새로고침
					 
					 if(end <= datacount) {
						 var output = '';
						 
						 output += '<div class="community_comments_view_more"><a class="view_more" href="javascript:moreComment();">더보기</a></div>';
						 $('.community_comments_view').append(output);
						 
						 start += 5;
						 end += 5;
					 }
				} 
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		       }
			}); //ajax
	}; //function
	
	
  //대댓 목록
  function answerList($comment_num) {
	  var num = $comment_num;
/* 	  var profile = null; */
	alert(num + "댓글 번호");
	
	  $.ajax({
			url:'/bit_project/getAnswer.co',
			type: 'POST',
			data:{'comment_num' : num},
			dataType: "json",
			async: false,
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				if(data.length == 0){
					alert("없음");
					$(".answer_container").css("display","none");
				}
				else { //데이터 존재
				$.each(data, function(index, item) {
					var answer = ' ';
					var reg_date = new Date(item.regist); 
            		var date = date_format(reg_date);
            		var email = "<%=email_co %>";
            		
						answer += '<div class="answer_container" value="' + item.comment_num + '">';	 
						answer += '<div class="community_answer_view_user">';
						answer += '<img src="' + item.profile + '">';
						answer += '</div>';
						answer += '<div class="community_answer_view_container">';
						answer += '<div class="community_answer_view_answer">';
						answer += '<input type="hidden" id="answer_num" value="' + item.answer_num + '">';
						answer += '<span class="community_mt_footer_users" style="font-size:14px;"><b>' + item.nickname + '</b></span>';
						answer += '<input type="hidden" id="email" value="' + item.email + '">';
						answer += '<input type="text" id="' + item.answer_num + '" class="answer_form" readonly onfocus:"this.blur()"; value="' + item.content + '" style="padding-left:10px;">';
						answer += '</div>';
						answer += '<div class="community_answer_view_actions">';
						answer += '<span class="community_answer_view_time" style="margin-top:3px; margin-right:10px;">' + date + '</span>';
						
						if(item.email.trim() == email) {
						answer += '<div class="community_answer_view_modify" id="' + item.answer_num + '">';
						answer += '<button type="button" class="community_comment_update_btn" "onclick="anmod_form(' + item.answer_num + ')">' + "수정" + '</button>';
						answer += '<button type="button" class="community_comment_delete_btn" "onclick="andel_btn(' + item.answer_num + ')">' + "삭제" + '</button></div>';
						}
						
						answer += '</div>';
						answer += '</div>';
						answer += '</div>';
						
						/* $('#"'+ item.comment_num + '".community_comments_view_container').append(answer); */
						/* $('.community_comments_view_container').append(answer); */
						/* $("#' + item.commnet_num + '_co").append(answer); */
						$('div[id="' + item.comment_num +'_co"]').append(answer);
						
				});
				}
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
		}); //ajax
	  }
	
	//대댓 등록
	function answerwrite($comment_num) {
		if($.trim($('.community_answer_form_comments').val()) == "") {
			alert("댓글을 입력해주세요");
			return false;
		}
		var num = $comment_num;
		var params = $('div[id="' + num +'"]').children('form').serialize();
		alert(num + "==" + params);
		$.ajax({
			url:'/bit_project/writeAnswer.co',
			type: 'POST',
			data: params,
			dataType: "json",
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(retVal) {
				
				if (retVal.res == "OK") { //데이터 성공일때 이벤트 작성
					coList();
					
					//초기화
					$('.community_answer_form_enter').val('');
				}
			
			},
			error:function(request,status,error){
		    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
		}) //ajax
	}
	
	//대댓 수정 폼
    function anmod_form($answer_num) {
     	var num = $answer_num;
     	
   		$('input[id="' + num + '"]').removeAttr("readonly");
   		$('input[id="' + num + '"]').focus();
   		$('input[id="' + num + '"]').css("border","1px solid #ccc9c9");
   		$('div[id="' + num + '"]').html('<button type="button" class="community_comment_update_btn" onclick="anmod_btn(' + num + ')">수정하기</button></div>');
	} 

    //대댓 수정
    function anmod_btn(num) {
    	if($.trim($('.answer_form').val()) == "") {
			alert("내용을 입력해주세요");
			return false;
		}
    	alert($(".answer_form").val());
    	
       jQuery.ajax({
          url : '/bit_project/updateAnswer.co',
          type : 'POST',
          data : {'answer_num' : num, 'content' : $(".answer_form").val()},
          contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
          dataType : "json",
          success : function(retVal) {
             if(retVal.res == "OK") {
            	 coList();
             }
             else {
                alert("댓글 수정 실패");
             }
          },
          error:function() {
             alert("댓글 ajax 오류");
          }
       });
    }
	
	//대댓 삭제
	function andel_btn($answer_num) {
		var num = $answer_num;
		msg = "삭제하시겠습니까?";
        if (confirm(msg)!=0) { //Y
        	$.ajax({
				url:'/bit_project/deleteAnswer.co',
				type: 'POST',
				data:{'answer_num' : num},
				dataType: "json",
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(retVal) {
					if (retVal.res == "OK") {
						alert("댓글이 삭제되었습니다.");
						coList();
					}
					else {
						alert("댓글 삭제 실패 !!");
					}

				},
				error:function(request,status,error){
			    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
        	}); //ajax
        } else { //N
        	alert("취소되었습니다");
		}
	}
	
	
	//댓글 input칸
	 //session 없으면 로그인으로 이동, 비매너회원은 접근금지
	$(".community_comments_form_content").click(function() {
		var email_co = '<%=(String)session.getAttribute("email")%>';
		var group1 = '<%=group%>';
		
		if(email_co == 'null') {
			alert("로그인 후 이용해주세요");
			window.location.href = "login.me";	
			return false;
		}else if(group1 == '비매너회원') {
			alert("접근금지");
			return false;
		}
	});
	  
	//session 없을시 로그인페이지로 이동(대댓 input)
	$(".community_answer_form_comments").click(function() {
		var email_co = '<%=(String)session.getAttribute("email")%>';
		var group1 = '<%=group%>';
		
		if(email_co == 'null') {
			alert("로그인 후 이용해주세요");
			window.location.href = "login.me";	
			return false;
		   }else if(group1 == '비매너회원') {
				alert("접근금지");
				return false;
			}
	});
	
	//input 엔터 막기
	$('input[type="text"]').keydown(function() {
 		if (event.keyCode === 13) {
    		event.preventDefault();
  		};
	});
	
	//날짜 format
    function date_format(format) {
    	var now = new Date(); 
    	var minus;
    	
        if(now.getDate() == format.getDate()){
            var nowTime = now.getTime();
            var writeTime = format.getTime();
            
            if(nowTime>writeTime){
                sec =parseInt(nowTime - writeTime) / 1000;
                day  = parseInt(sec / 60 / 60 / 24);
                sec = (sec - (day * 60 * 60 * 24));
                hour = parseInt(sec/60/60);
                sec = (sec - (hour*60*60));
                min = parseInt(sec/60);
                sec = parseInt(sec-(min*60));
                if(hour > 0){
                		return hour+"시간 전";
                    console.log(hour+"시간 전");
                }else if(min > 0){
                		return min+"분 전";
                    console.log(min+"분 전");
                }
            }
        }else {
        	var year = format.getFullYear();
            var month = format.getMonth()+1;
            if(month < 10) {
            	month = '0' + month;
            }
            var date = format.getDate();
            if(date < 10) {
            	date = '0' + date;
            }
            var hour = format.getHours();
            var min = format.getMinutes();
            if(min < 10){
            	min = '0' + min;
            }
        	return year + "." + month + "." + date + "&nbsp; " + hour +":" + min;
        }
     }

<%-- 	
//네이버 블로그 공유
    function share() {
    	var url_default_naver = "http://share.naver.com/web/shareView.nhn?url=";
    	var url_combine_naver = url_default_naver + encodeURI(url_this_page) + title_default_naver + encodeURI(title_this_page);
    	
    	var url_this_page = location.href; 
    	var title_this_page = document.title;

    	
       var url = document.location.href;
        var title = '<%=cmvo.getBoard_name() %>';
        var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;
        var link = StringTool.format('https"//share.naver.com/web/shareView.nhn?url={0}&title={1}', url, title);
        document.location = shareURL; 
}
 --%>
        
//태그 제거
    function removeTag( str ) {
    	return str.replace(/(<([^>]+)>)/ig,"");
    }

//카카오톡 공유
     var content = '<%=cmvo.getContent() %>'; 

        // // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('55c690e62a4cab3263ba4b230bb6af19');
        // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
        Kakao.Link.createDefaultButton({
          container: '#kakao-link-btn',
          objectType: 'feed',
          content: {
            title: '<%=cmvo.getBoard_name() %>',
            description: removeTag(content),
            imageUrl: '<%=cmvo.getImg() %>',
           link: {
             webUrl: document.location.href,
             mobileWebUrl: document.location.href
           }
          },
          buttons: [
            {
              title: 'Open!',
              link: {
                mobileWebUrl: document.location.href,
                webUrl: document.location.href
              }
            }  
          ]
        });
  
      //스크랩수 업데이트
		function countupdate(){
			var num = <%=cmvo.getBoard_num() %>;
			
			$.ajax({
		          url : '/bit_project/updateScrap.co',
		          type : 'POST',
		          data : {'board_num' : num},
		          contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		          dataType : "json",
		          success : function(retVal) {
		             if(retVal.res == "OK") {
		            	 location.reload();
		             }
		          },
		          error:function() {
		             alert("스크랩 오류");
		          }
		       });
		}
    
</script>

<!-- 라인 공유 -->
<script src="https://d.line-scdn.net/r/web/social-plugin/js/thirdparty/loader.min.js" async="async" defer="defer"></script>

</body>
</html>