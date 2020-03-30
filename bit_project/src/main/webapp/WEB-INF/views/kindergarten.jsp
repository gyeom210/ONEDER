<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.spring.menu.CompanyVO" %>
	<%@ page import="java.util.List" %>
	<%
		List<CompanyVO> list = (List<CompanyVO>)request.getAttribute("list");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Kindergarten</title>
<link rel="stylesheet"	
	href="<c:url value="/resources/css/kindergarten.css" />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>Insert title here</title>
<!-- 모달 -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/b2b_join_form.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/b2b.js"></script>


</head>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
<body>
	<div style="height: 50px;">
		<header>
			<%@ include file="/WEB-INF/views/header3.jsp"%>
		</header>
	</div>
	<div class="container">
	<!-- 용의자 -->
		<div class="info-wrapper">
			<div class="info-rent">
				<div class="h1">
					<h1>대여</h1>
				</div>

				<div class="h3">
					<h3>장난감이 필요한 순간,</h3>
					<h3>ONEDER 충분합니다.</h3>
				</div>

				<div class="p">
					<p>어린이집의 모든 아이들이 매 달 새로운 장난감을 위생적으로 이용하여,</p>
					<p>어린이와 학부모 선생님들까지 만족하는 서비스를 만들어 갑니다.</p>
				</div>


				<i class="fas fa-gift fa-9x"></i>

			</div>
			
			<div class="info-buy">
				<div class="h1">
					<h1>매입</h1>
				</div>

				<div class="h3">
					<h3>처리하기 힘든 장난감</h3>
					<h3>더이상 힘들지 않습니다.</h3>
				</div>

				<div class="p">
					<p>더 이상 필요하지 않은 장난감을 매입하여,</p>
					<p>어린이집 뿐만 아니라 환경에도 도움이 되는 문화를 만들어 갑니다.</p>
				</div>	

				<i class="fas fa-hand-holding-usd fa-9x"></i>

			</div>
			<!--어린이집 가입신청 모달-->
     	<div class="modal" id="nursery-modal">
         <div class="modal-content1">
             <span class="close-button" id="nclose-button">&times;</span> 
             <h1 class="title">어린이집 가입신청</h1>
             <h5 class="sentence">아래 사항을 작성하여 보내주시면 담당자가<br />
                확인하여 연락 드리도록 하겠습니다.</h5>
             
             <form id="mun2" action="companyAddProcess.se" method="POST" enctype="multipart/form-data">
                
                                
               <input type="text" name="license_num" placeholder="사업자등록번호" required="required">
               <input type="text" name="name" placeholder="어린이집 이름" required="required">
               <input type="tel" name="phone" placeholder="연락처" required="required">
               <input type="email" name="email" placeholder="이메일" required="required">       
               <input type="text" name="homepage" placeholder="홈페이지" required="required">
               <input type="text" name="postal_num" id="mun" placeholder="우편번호" required="required"> 
               <input type="text" name="address" id="address" placeholder="주소" required="required">
               <input type="text" name="address_detail" id="address_detail" placeholder="상세주소" required="required">
                
               <div>
               <select name="term" id="contract-term">  
				    <option value="">계약기간 선택</option>
				    <option value="3">3개월</option>
				    <option value="6">6개월</option>
				    <option value="9">9개월</option>
				    <option value="12">12개월</option>
				</select>
				</div>

               <div class="box-file-input"><label><input type="file" name="img" class="file-input" required="required"></label><span class="filename">대표사진을 선택해주세요.</div>
               
                <div class="button-box">
                    <input type="button" id="ncancel" value="취소">         
                    <input type="submit" id="nsubmit"  value="보내기">      
                </div>
             </form>
         </div> 
     </div>     
			
			
		</div>
		<!-- 용의자 -->
		<div class="contact-us">

			<div id="contact">
				<div class="h1">
					<h1>ONEDER와 함께할</h1>
					<h1>어린이집을 찾습니다.</h1>
				</div>
	
				<span>
					<a href="#"><button id="nursery-join-btn" class="btn-contact-us" style="cursor:pointer;">가입 신청</button></a>
   				</span>
			</div>
			<div id="icon">
				<i class="fas fa-home fa-9x"></i>

			</div> 
			</div>
 
		
		<div class="kindergarten-list">
		  <ul style=" display: flex;">
		  	<li style="flex: 8.5;">
		  	<%
		  	try {
			 	for (int i = 0; i < list.size(); i++) {
					CompanyVO cvo = list.get(i);
			%>
			<img src="/bit_project/image/<%=cvo.getImg() %>">
			
			<%} }catch(Exception e) {} %>
			
			</li>
		  </ul>
	   </div>
	  </div> 
	<div style="height: 50px;">
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp"%>
		</footer>
	</div>
	
	
    <script type="text/javascript">

/*어린이집*/
var modal2 = document.querySelector("#nursery-modal");
var ntrigger = document.querySelector("#nursery-join-btn"); 
var ncloseButton = document.querySelector("#nclose-button"); 
var ncancelButton = document.querySelector("#ncancel");       


function toggleNModal() {
   modal2.classList.toggle("show-modal1");
}

document.getElementById("nursery-join-btn").onclick = function() { 
   toggleNModal();
}

function windowOnClick(event) {
   if (event.target === modal2) {
      togglePModal();
   }
}


ncloseButton.addEventListener("click", toggleNModal);
ncancel.addEventListener("click", toggleNModal);    
window.addEventListener("click", windowOnClick); 

</script>

<script>
 $('#mun').click(function() {
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

    $('#mun').val(zipNo);
    $('#address').val(roadAddrPart1);
    $('#address_detail').val(addrDetail);
}
 </script>
 
	
	
</body>
</html>