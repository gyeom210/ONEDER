<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.chat.ChatVO" %>
<%@ page import="com.spring.login.LoginVO" %>
<%@ page import="com.spring.chat.MessageVO" %>
<%@ page import ="java.util.ArrayList" %>
<%
	String sender = null; //sender 닉네임
	String img = null; //sender 이미지
	String nickname = null;
	LoginVO userDetail = null;
	String usergroup = null;
	
	if(session.getAttribute("email") != null) {
		sender = (String)session.getAttribute("nickname");
		userDetail = (LoginVO)session.getAttribute("userDetail"); //유저정보
		img = userDetail.getImg();
		if(userDetail.getUsergroup().equals("admin")) {
			nickname = userDetail.getNickname();   //관리자 닉네임
			usergroup = userDetail.getUsergroup(); //관리자인지 확인
		} 
	} else {
		sender = "비회원";
		img = "img";
	}
	
	ArrayList<MessageVO> roomlist = (ArrayList<MessageVO>)request.getAttribute("roomlist"); //관리자일 경우 채팅방 정보
	ArrayList<ChatVO> adminlist = (ArrayList<ChatVO>)request.getAttribute("adminlist"); //모든관리자 목록 
	
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

<title>Chat</title>
</head>

<script type="text/javascript">

var ws;
var userid = '<%=sender%>';

function register() {
	var msg = {
		target : 'target',
		type : "register",
		userid : userid
	};
	ws.send(JSON.stringify(msg));
};

function connect() {

	ws = new WebSocket('ws://localhost:8080/bit_project/chat');
	
	ws.onopen = function() {
		/* console.log('연결 생성'); */
		register();
	};
	
	ws.onclose = function() {
		/* console.log('연결 끊김'); */
	};

	ws.onmessage = function(e) {
		/* console.log('메시지 받음'); */
		var data = e.data;
		addMsg(data);
	};
};

function addMsg(msg) { //받은 메시지 미리보기
	$('.friend__bottom-text').text("");
	$('.newcheck').css("background-color", "rgb(255,100,100,0.92)");
	$('.friend__bottom-text').text(msg);
};

if('<%=usergroup%>'== 'admin') {
	connect();
};

</script>

<body>


<div class="status-bar">
    </div>
    <header class="header">
      <div class="header__header-column">
        <h1 class="header__title">상담시작</h1>
      </div>
    </header>
    <main class="chats">
      <ul class="chats__list">
        <li class="chats__chat chat">
        <%
         if(userDetail == null || !(userDetail.getUsergroup().equals("admin"))) {  //관리자가 아니거나 유저정보가 null값이면(비회원) list에 관리자 목록출력
        	for(int i = 0; i < adminlist.size(); i++) { 
        		ChatVO list = (ChatVO)adminlist.get(i);
        		%>
          <a href="chatstart.ct?nickname=<%=list.getNickname() %>&sender=<%=sender %>">
            <div class="chats__chat friend friend--lg">
              <div class="friend__column">
                <img src="<%=list.getImg() %>" class="m-avatar friend__avatar" />
                <div class="friend__content">
                  <span class="friend__name">
                    <%=list.getNickname() %>
                  </span>
                  <span class="friend__bottom-text">
                    접속중
                  </span>
                </div>
              </div>
              <div class="friend__column">
                <span class="chat__timestamp">
                  채팅하기
                </span>
              </div>
            </div>
           	</a>
        <%
        		}
        	} else {
        		if(roomlist != null) {
        		for(int i = 0; i < roomlist.size(); i++) {
        			MessageVO mlist = (MessageVO)roomlist.get(i);
        %>
        	 <a href="chatstart.ct?nickname=<%=mlist.getReceiver() %>&usergroup=<%=usergroup%>&sender=<%=mlist.getSender() %>">
            <div class="chats__chat friend friend--lg">
              <div class="friend__column">
                <img src="<%=mlist.getImg() %>" class="m-avatar friend__avatar" />
                <div class="friend__content">
                  <span class="friend__name">
                    <%=mlist.getSender() %>
                  </span>
                  <div class="newcheck" style="width:7px; height:7px; border-radius:50%; background-color:rgb(31,177,31,0.79); margin-top:3px; display:inline-block;" ></div>
                  <span class="friend__bottom-text">
               			
                  </span>
                </div>
              </div>
              <div class="friend__column">
                <span class="chat__timestamp">
                  채팅하기
                </span>
              </div>
            </div>
           	</a>
        <%
        			}
        		}
        	}
        %>
        </li>
      </ul>
    </main>
    <nav class="nav">
      <ul class="nav__list">
        <li class="nav__list-item">
          <a href="index.ct" class="nav__list-link">
            <img src="${pageContext.request.contextPath}/resources/icons/chats.png" style="width:30px; height:30px;">
          </a>
        </li> 
      </ul>
    </nav>
</body>
</html>