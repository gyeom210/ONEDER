<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	@media (max-width: 480px){
    #chat{
       display: none;
    }
}    

@media (min-width: 481px){
    #chatM{
        display: none;
    }
}
</style>

<script>
$(document).ready(function(){
   var chat = $('#chatframe');
   $('#chat img').click(function(){
      if(chat.is(':visible')) {
         chat.fadeOut();
      } else {
         chat.fadeIn();
      }
         
   });
});
</script>
<body>
	<!-- 채팅 -->
	<div>
    <div id="chat" style="position: fixed; right: 1%; bottom: 1%; z-index: 9999;">
       <img src="${pageContext.request.contextPath}/resources/icons/chats.png" style="height: 70px;  width: 70px; cursor:pointer;"/>
    </div>
    <!-- 모바일 버전 -->
    <div id="chatM" style="position: fixed; right: 1%; bottom: 1%; z-index: 9999;">
        <a href="tel:0234869600">
         <img src="${pageContext.request.contextPath}/resources/icons/phone.png" style="height: 70px;  width: 70px; cursor:pointer;"/>
         </a>
    </div>
    <iframe id="chatframe" src="./index.ct" style="display:none; z-index:7777; position:fixed; width:385px; height:600px; right:3%; bottom:3%; border:1px solid #ffc9c9; border-radius:20px;"></iframe>
	</div>

</body>
</html>