<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="com.spring.tazo.SMTPAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String sellanddonation_amount = request.getParameter("sellanddonation_amount");
String chk_info2 = request.getParameter("chk_info2");
String from  = request.getParameter("from");
String to = request.getParameter("to");

Properties p = new Properties();	//정보를 담을 객체

p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP

p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");

try{
	Authenticator auth = new SMTPAuthenticator();
	Session ses = Session.getInstance(p, auth);
    
    ses.setDebug(true);
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체 
 
    msg.setSubject("Sell And Donation 신청"); //  제목
    
    if(chk_info2 == null){
    	chk_info2 = "판매";
    } else {
    	chk_info2 = "기부";
    }
    
    StringBuffer buffer = new StringBuffer();
    buffer.append("어린이집 이름 : ");
    buffer.append(name + "<br>");
    buffer.append("판매 및 기부할 장난감의 수 : ");
    buffer.append(sellanddonation_amount + "<br>");
    buffer.append("기부 여부 : ");
    buffer.append(chk_info2 + "<br>");
    
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr);

    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용
    Transport.send(msg); // 전송  
    
} catch(Exception e){
    e.printStackTrace();
    return;
}

out.println("<script>alert('Send Mail Success!!');location.href='sellanddonation.ms';</script>");	//성공 시
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>