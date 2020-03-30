<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_email1 = (String)session.getAttribute("email");
%>
<!DOCTYPE html>
<html>

<!-- 폰트어썸 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/mypage/bye.css" rel="stylesheet">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="member_bye">
            <h2>회원탈퇴</h2>
            <form id="pass_confirm_form" name="pass_confirm_form" method="POST" action="deleteMyAccount.ac" style="width:100%;">
            <input type="hidden" id="user_email1" name="email" value="<%=user_email1 %>">
            
            <div class="pass_confirm">
                <table>
                    <tr class="pass_line">
                        <th>비밀번호</th>
                        <th><input type="password" id="pw" name="password" class="pw" placeholder="비밀번호 입력" style="height:30px; border-radius:5px;"></th>
                    </tr>
                </table>
            </div>
            <div class="content">
                <p>ㆍ포인트, 적립금, 회원등급 등의 정보는 모두 삭제됩니다.</p><br>
                <p>ㆍ게시판의 게시글, 댓글 등의 정보는 삭제되지 않습니다.</p><br>
                <p>&nbsp;&nbsp;&nbsp;(탈퇴 전 직접 삭제)</p>
            <div class="content_block"></div>
            </div>
            <div class="content_confirm">
                <input type="checkbox" name="confirm"><h5>안내사항을 모두 확인하였으며, 이에 동의합니다.</h5><br>
                <button type="button" id="checkPW" value="N"  class="member_button" >회원탈퇴</button>
            </div>
            </form>
        </div>
        
        <script>
        $("#checkPW").on("click", function(){  
        	var pw = $('#pw').val();
        	var email1 = $('#user_email1').val();
        	
        	$.ajax({
    			url : '/bit_project/checkPW.at',
    			type :'post',
    			dataType : "json",
    			data : { email : $('#user_email1').val(), password:$('#pw').val()},
    			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
    			success : function(data) {
    				if (data.res == "OK") {
    					document.pass_confirm_form.submit();
    				} else { 
    					alert("비밀번호가 일치하지 않습니다.");
    				}
    			},
    			error : function() {
    				alert("checkPW : ajax통신 실패");
    			}

    		});
        	
        });  



</script>
</body>
</html>