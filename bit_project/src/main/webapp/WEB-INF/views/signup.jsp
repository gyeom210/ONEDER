<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/profile.css" rel="stylesheet">
<title>Document</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://kit.fontawesome.com/fa509a9993.js" crossorigin="anonymous"></script> <!--icon-->

</head>

<script>
$(document).ready(function() {
	$('#oneder').click(function() {
		
		location.href="main.ma";
	});
});
</script>
<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
   <div style="height: 50px;">
      <header>
         <%@ include file="/WEB-INF/views/header1.jsp"%>
      </header>
   </div>
   <div id="contentbox">
      <div id="signup-content">
         <div id="signup-title">
            <h1>회원가입</h1>
         </div>
   
            
            <div id="signup-ipt">
               <form method="POST" name="signupForm" action="memberInsert.me" enctype="multipart/form-data">
                  <div id="profilefield">
                     <div class="image-upload"> <!-- 이미지 올릴곳 -->
                       <div class="image-edit">
                           <input type="file" name="img2" id="imageUpload" class="imageUpload" data-preview="imagePreview" accept=".png, .jpg, .jpeg" style="width:100px; height: 300px; border:1px solid;"multiple />
                           <label for="imageUpload"><i class="fas fa-chevron-circle-up fa-2x" style="color: #757575"></i></label> 
                           <div class="zz" data-preview="imagePreview" style="width:250px; height:200px;" ></div>
                       </div>
                       <div class="preview" >
                           <div id="imagePreview" style="background-image: url('${pageContext.request.contextPath}/resources/img/default_profile.png');"></div>
                       </div>
                        </div>
                  </div>
                  <div class="checkfield">
                     <span> <input type="text" name="nickname" id="nickname"
                        class="checkfield" placeholder="닉네임" required></span> <span>
                        <button type="button" class="nicknamecheck-btn"
                           onclick="nnChk();" value="N">중복확인</button></span>
                        <div class="alert alert-true" id="nickname-alert-true" style="font-size:10px; float:left; color:green;">사용 가능한 닉네임입니다.</div>
                        <div class="alert alert-false" id="nickname-alert-false" style="font-size:10px;float:left;color:red;">이미 사용 중인 닉네임입니다. </div>
                  </div>
                  <div class="checkfield">
                     <span><input type="email" name="email" id="email"
                        class="checkfield" placeholder="이메일주소" required></span> <span><button
                           type="button" class="emailcheck-btn" onclick="emChk();"
                           value="N">중복확인</button></span>
                     <div class="alert alert-true" id="email-alert-true" style="font-size:10px; float:left; color:green;">사용 가능한 이메일입니다.</div>
                     <div class="alert alert-false" id="email-alert-false" style="font-size:10px;float:left;color:red;">이미 사용 중인 이메일입니다. </div>
                  </div>


                  <div class="formfield">
                     <input type="text" name="name" class="checkfield"
                        placeholder="이름" required>
                  </div>
                  <div class="formfield">
                     <input type="password" class="pw" id="password" name="password"
                        placeholder="비밀번호(8자리이상, 특수문자, 대소문자)" required><br /> 
                        <div class="alert alert-check" id="pw-alert-check" style="font-size:10px; float:left; color:red;">비밀번호 8자리 이상</div>
                        <input
                        type="password" class="pw" id="pwcheck" name="pwcheck" placeholder="비밀번호 확인" required>
                     <div class="alert alert-true" id="pw-alert-true" style="font-size:10px; float:left; color:green;">비밀번호가 일치합니다.</div>
                     <div class="alert alert-false" id="pw-alert-false" style="font-size:10px;float:left;color:red;">비밀번호가 일치하지 않습니다.</div>
                  </div>
                  <div class="formfield">
                     <input type="text" name="phone" placeholder="핸드폰번호" >
                  </div>
                  <div class="formfield">
                     <input type="text" name="postal_num" id="pos_num" placeholder="우편번호" >
                  </div>
                  <div class="formfield">
                     <input type="text" name="address" id="address" placeholder="주소">
                  </div>
                  <div class="formfield">
                     <input type="text" name="address_detail" id="address_detail" placeholder="상세주소">
                  </div>
                  <div class="formfield">
                     <input type="text" name="birth" placeholder="생년월일(6자리)" maxlength="6" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                  </div>

                  <h4 id="additional-text">추가정보 입력</h4>
                  <div class="additional-info">
                     <input type="text" name="children_birth"
                        placeholder="자녀 생년월일(6자리)" maxlength="6" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                  </div>
                  <div class="additional-info">
                     <input type="text" name="instagram_id" placeholder="인스타그램 아이디">
                  </div>
                  <div class="signup-agree">
                     <input type="checkbox" id="signup-agree" value="Y"> <label
                        for="signup-agree">이용 약관 동의</label>
                  </div>
                  <div class="marketing-agree">
                     <input type="checkbox" id="marketing-agree1" name="receive_text"
                        value="Y"> <label for="marketing-agree1">문자 수신 동의</label>
                  </div>
                  <div class="marketing-agree">
                     <input type="checkbox" id="marketing-agree2" name="receive_email"
                        value="Y"> <label for="marketing-agree2">메일링 수신
                        동의</label>
                  </div>

                  <div>
                     <input type="button" class="signup-btn" onclick="inputChk()"value="가입하기">
                  </div>
               </form>
            </div>
         </div>
      </div>
      <!-- footer 시작 -->
      <footer id="footer">
         <div id="footer_sns">
            <div class="container">
               <div class="footer_sns">
                  <ul>
                     <li class="icon s1"><a href="#"><span class="ir_pm">트위터</span></a></li>
                     <li class="icon s2"><a href="#"><span class="ir_pm">페이스북</span></a></li>
                     <li class="icon s3"><a href="#"><span class="ir_pm">인스타그램</span></a></li>
                     <li class="icon s4"><a href="#"><span class="ir_pm">구글
                              플레이</span></a></li>
                     <li class="icon s5"><a href="#"><span class="ir_pm">아이폰
                              앱스토어</span></a></li>
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

                     <ul>
                       			<li><a href="kindergarten.ms">어린이집</a></li>
								<li><a href="partner.ms">파트너</a></li>
								<li><a href="contactus.ms">고객센터</a></li>
								<li><a href="share.ms">개인 쉐어</a></li>
								<li><a href="#">어린이집 쉐어</a></li>
							
                     </ul>
                     <address>
                        <p>
                           서울특별시 서초구 강남대로 459 <br> <span class="bar2">대표자명 김진근</span>
                           <br> <span class="bar2">사업자등록번호 111-11-1111</span>
                           통신판매업신고번호 제 111호
                        </p>
                        <p>Copyright 2020 by Bit Inc. All right reserved</p>
                     </address>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- footer 끝 -->
      
      <script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
       <script>
       $('#pos_num').click(function() {
         goPopup();
      })
      $('#pos_num').keyup(function() {
         goPopup();
      })
       function goPopup() {
          // 주소검색을 수행할 팝업 페이지를 호출합니다.
          // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
          var pop = window.open("/bit_project/jusoPopup.jsp", "pop",
                "width=570,height=420, scrollbars=yes, resizable=yes");
      
          // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
          //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
       }
      
       function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn){
           // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
      
          $('#pos_num').val(zipNo);
          $('#address').val(roadAddrPart1);
          $('#address_detail').val(addrDetail);
      }
 </script>
</body>
</html>