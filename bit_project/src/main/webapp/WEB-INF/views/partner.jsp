<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Partner</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/partner.css" />">
<!-- 모달 -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/b2b_join_form.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/b2b.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/partner.js"></script>
<script src="http://code.jquery.com/jquery-3.4.1.js">
	
</script>


<style>
#content {
	width: 1280px;
	margin: 0 auto;
}

#logo {
	padding: 40px 0 40px 0;
	background-color: #ffb0b1;
	color: white;
	width: 100%;
	text-align: center;
}

#category {
	margin-left: 30px;
	margin-top: 100px;
}

#select_box {
	width: 150px;
	height: 35px;
	font-size: 16px;
}


/* img{
            width: 45%;
            height: auto;
            display: inline-block;
            margin: 30px 30px 0 30px;
            -webkit-transform:scale(1);
            -moz-transform:scale(1);
            -ms-transform:scale(1); 
            -o-transform:scale(1);  
            transform:scale(1);
            -webkit-transition:.3s;
            -moz-transition:.3s;
            -ms-transition:.3s;
            -o-transition:.3s;
            transition:.3s;  
            
        }

        img:hover{
            opacity: 0.5;
            -webkit-transform:scale(1.1);
            -moz-transform:scale(1.1);
            -ms-transform:scale(1.1);   
            -o-transform:scale(1.1);    
            transform:scale(1.1);
        } */
@media ( max-width : 600px) {
	#content {
		width: auto;
	}
	#logo {
		width: 100%;
	}
	#category {
		margin: 15% 0 5% 2%;
		height: 50px;
	}
	.image-wrapper {
		display: block;
		justify-content: center;
		align-items: center;
		flex-wrap: nowrap;
	}
	img {
		width: 100%;
		height: auto;
		margin: 0 auto;
		
	}
	.snip1273 img {
	  position: relative;
	  width: 100%;
	  height: 300px;
	  vertical-align: top;
	}
	.snip1273 {
		width: 95%;
		margin: 15px 9px 15px;
		color: #ffffff;
		background-color: #000000;
	}
	.snip1273 figcaption {
		position: absolute;
		font-size: 11px;
		padding: 17px 20px;
	}
	.snip1273 a {
		width: 38px;
		color: #ffffff;
		position: absolute;
		top: 32px;
		left: 300px;
		font-size: 20px;
	}
	
	.snip1273 h3 {
		font-size: 18px;
		margin: 0;
	}
	
	.snip1273 p {
		font-size: medium;
	}
	
	
}
</style>
</head>

<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
	<div style="height: 50px;">
		<header>
			<%@ include file="/WEB-INF/views/header3.jsp"%>
		</header>
	</div>
	<div id="container">

		<div id="logo">
			<h1>파트너</h1>
		</div>

		<div id="content">
			<div id="category">
				<form action="">
					<select id="select_box" onchange="button_click()">
						<option value="전체선택">전체선택</option>
						<option value="장난감">장난감</option>
						<option value="유아용품">유아용품</option>
						<option value="아동복">아동복</option>
					</select>
					<!-- <input type = "button" class = "btn" id = "category_select" onclick = "button_click()" value = "검색" /> -->
					<!-- <script type="text/javascript" src="partner.js"></script> -->
					<div>
					<input type="button" id="partner-join-btn" class="btn-partner" value="가입신청" style="cursor:pointer;"></button>
   					</div>
					<hr align="left" width="96.7%">
				</form>
			</div>
			<div class="partner_chart"></div>

		</div>

	</div>
	<div style="height: 50px;">
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp"%>
		</footer>
	</div>
	 <!-- 파트너 가입신청 모달-->
     <div class="modal" id="partner-modal">
         <div class="modal-content">
             <span class="close-button" id="pclose-button">&times;</span>
             <h1 class="title">파트너 가입신청</h1>
             <h5 class="sentence">아래 사항을 작성하여 보내주시면 파트너 담당자가<br />
                확인하여 연락 드리도록 하겠습니다.</h5>
             <hr>
             <form id="mun2" action="partnerAddProcess.se" method="POST" enctype="multipart/form-data">
                
               <input type="text" name="license_num" placeholder="사업자등록번호" required="required">
               <input type="text" name="name" placeholder="회사명" required="required">
               <input type="tel" name="phone" placeholder="연락처" required="required">
               <input type="email" name="email" placeholder="이메일" required="required">       
               <input type="text" name="homepage" placeholder="홈페이지" required="required">
               <input type="text" name="postal_num" id="mun" placeholder="우편번호" required="required">
               <input type="text" name="address" id="address" placeholder="주소" required="required">
               <input type="text" name="address_detail" id="address_detail" placeholder="상세주소" required="required">
               
               <div>
               <select name="term" id="contract-term" required="required">
                <option value="">계약기간 선택</option>
                <option value="3">3개월</option>
                <option value="6">6개월</option>
                <option value="9">9개월</option>
                <option value="12">12개월</option>
            </select>
            </div>
             <div>
               <select name="category" id="category-term" required="required">
                <option value="">카테고리</option>
                <option value="장난감">장난감</option>
                <option value="유아용품">유아용품</option> 
                <option value="아동복">아동복</option>
            </select>
            </div>
            <input type="text" name="content" placeholder="간단한 소개" required="required">
               <div class="box-file-input"><label><input type="file" name="img" class="file-input" required="required"></label><span class="filename">대표사진을 선택해주세요.</div>
                <div class="button-box">
                    <input type="button" id="cancel" value="취소">
                    <input type="submit" id="submit" value="보내기">
                </div>
             </form>
         </div> 
     </div>

 <script type="text/javascript">
         var modal = document.querySelector("#partner-modal");
         var trigger = document.querySelector("#partner-join-btn");
         var pcloseButton = document.querySelector("#pclose-button");
         var cancelButton = document.querySelector("#cancel");
        console.log(modal);
        
        function toggleModal() {
             modal.classList.toggle("show-modal");
         }
        function windowOnClick(event) {
             if (event.target === modal) {
                 toggleModal();
             }
         }
         trigger.addEventListener("click", toggleModal);
         pcloseButton.addEventListener("click", toggleModal);
         cancel.addEventListener("click", toggleModal);
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