<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %> 
<%@ page import = "com.spring.login.LoginVO" %>
<%@ page import = "com.spring.chat.MessageVO" %>
<%

	LoginVO userDetail = (LoginVO)session.getAttribute("userDetail");

	ArrayList<MessageVO> messagelist = null;
	String nickname = null;
	String usergroup = null;
	
	if(userDetail != null) {
		nickname = userDetail.getNickname();
		usergroup = userDetail.getUsergroup();
	} else {
		nickname = "비회원";
		usergroup = "비회원";
	}	
	
	messagelist = (ArrayList<MessageVO>)request.getAttribute("messagelist");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link href="${pageContext.request.contextPath}/resources/css/chat/styles.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<link
     rel="stylesheet"
     href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
     integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
     crossorigin="anonymous"
/>
<title>Chats</title>
</head>
<!-- chat JS -->
<script type="text/javascript">

var ws;
var userid = '<%=nickname%>';
var target = '${target}';

function connect() {
	//웹소켓 객체 생성하는 부분
	//핸들러 등록(연결 생성, 메시지 수신, 연결 종료)
	
	//url 연결할 서버의 경로
	ws = new WebSocket('ws://localhost:8080/bit_project/chat');
	
	ws.onopen = function() {
		console.log('연결 생성');
		register();
	};
	
	ws.onmessage = function(e) {
		console.log('메시지 받음');
		var data = e.data;
		//alert("받은 메시지 : " + data);
		addMsg(data);
	};
	
	ws.onclose = function() {
		console.log('연결 끊김');
	};
};

function addMsg(msg) { //원래 채팅 메시지에 방금 받은 메시지 더해서 설정하기
	var receiveText = '<li class="incoming-message message"><img src="${img}" class="m-avatar message__avatar" /><div class="message__content"><span class="message__bubble">'+ msg +'</span><span class="message__author">'+'${target}'+'</span></div></li>';
	$('.chat__messages').append(receiveText);
	$(".chat-screen").scrollTop($(".chat-screen")[0].scrollHeight);
};

function register() { //메시지 수신을 위한 서버에 id 등록하기
	var msg = {
		target : 'target',
		type : "register", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함
		userid : userid
	};
	ws.send(JSON.stringify(msg));
};

function sendMsg() {
	//var msg = $('#chatMsg').val();
	//ws.send(userid + " : " + msg);
	var msg = {
			type : "chat", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
			target : target, //상대방 아이디 
			room_num : '${room_num}',
			message : $('#chat__content-text').val()
	};
	ws.send(JSON.stringify(msg));
};

//엔터키 이벤트
$(document).ready(function() {
	$('#chat__content-text').keydown(function(key) {
		if(key.keyCode == 13 && $('#chat__content-text').val() != '') {
			chat = $(this).val();
			var sentText = '<li class="sent-message message"><div class="message__content"><span class="message__bubble">'+ chat +'</span></div></li>';
			$('.chat__messages').append(sentText);
			sendMsg();
			$(this).val('');
			$(".chat-screen").scrollTop($(".chat-screen")[0].scrollHeight);
		}
	});
});


//페이지가 로딩되면 connect 실행
$(function() {
	connect();
}); 

</script>

<body class="chats-body">
<div class="header-wrapper">
      <div class="status-bar">
      </div>
      <header class="header">
       <div>
        <h1 class="header__title">${target}과 상담중</h1>
        </div>
        <div class="header__header-column">
    
        	<a href="index.ct" class="header__back-btn">
      
            <i class="fas fa-arrow-left"></i>
          </a>
        </div>
      </header>
    </div>

    <main class="chat-screen">
      <ul class="chat__messages">
        <span class="chat__timestamp">오늘날짜</span>
 		<%
 			if(usergroup.equals("admin") && messagelist != null) {
 				for(int i = 0; i < messagelist.size(); i++) {
 					MessageVO list = messagelist.get(i);
 					String msg = list.getContent();
 					String state = list.getState();
 					if(state.equals("1")) {
 		%>
 			<li class="incoming-message message">
          <img src="${img}" class="m-avatar message__avatar" />
          <div class="message__content">
            <span class="message__bubble">
              <%=msg %>
            </span>
            <span class="message__author">${target }</span>
          </div>
        </li>
 					
 		<%
 					} else {
 		%>
 					<li class="sent-message message">
          				<div class="message__content">
           				   <span class="message__bubble">
              					<%=msg %>
            			   </span>
         			    </div>
       				</li>
 		
 		<% 
 					}		
 				}
 			}
 		%>
      </ul>
    </main>
    <div class="chat__write--container">
      <input
        type="text"
        class="chat__write"
        placeholder="Send message"
        class="chat__write-input" 
        id="chat__content-text"
     	/>    
      </div>

</body>
</html>