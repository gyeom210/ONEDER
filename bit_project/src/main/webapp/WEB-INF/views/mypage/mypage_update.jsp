<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ page import="com.spring.member.MemberVO"%>
<%@ page import="com.spring.login.LoginVO"%>
<%@ page import="com.spring.login.LoginController"%>
<%

	LoginVO userDetail = (LoginVO) session.getAttribute("userDetail");

	if (userDetail.getInstagram_id() == null) {
		userDetail.setInstagram_id("");
	}
	if (userDetail.getChildren_birth() == null) {
		userDetail.setChildren_birth("");
	}
%>
<!DOCTYPE html>
<html>
<script>
var nick_session = '<%=userDetail.getNickname() %>';
</script>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 폰트어썸 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/update.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/profile.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/fa509a9993.js" crossorigin="anonymous"></script> <!--icon-->
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<title>Insert title here</title>
</head>
<body>
	<div class="member_update">
		<div class="update_form_wrap">
			<form id="update_form" name="update_form"
				enctype="multipart/form-data" method="post">

				<h1>회원수정</h1>
				<div class="member_img">
					<div id="profilefield">
					
						<div class="image-upload"> <!-- 이미지 올릴곳 -->
                       <div class="image-edit">
                           <input type="file" name="filename" id="imageUpload" class="imageUpload" data-preview="imagePreview" accept=".png, .jpg, .jpeg" style="width:100px; height: 300px; border:1px solid;"multiple />
							<label for="imageUpload"><i class="fas fa-chevron-circle-up fa-2x" style="color: #757575"></i></label> 
                           <div class="zz" data-preview="imagePreview" style="width:250px; height:200px;" ></div>
                       </div>
                       		<div class="preview" >
								<div id="imagePreview"
									style="background-image: url('<%=userDetail.getImg()%>');">

								</div>
							</div>

						</div>
					</div>
				</div>
				<table class="update_table" cellspacing="8px">

					<tr>
						<td><p>회원명</p></td>
						<td><b class="na"><%=userDetail.getName()%></b></td>
					</tr>
					<tr>
						<td><p>이메일</p></td>
						<td><b class="na"><input type="hidden" id="email" name="email" class="email"
								value="<%=userDetail.getEmail()%>"><%=userDetail.getEmail()%></b></td>
					</tr>
					<tr>
						<td><p>닉네임</p></td>
						<td><input type="text" id="nickname" class="nickname" name="nickname"
							value="<%=userDetail.getNickname()%>"></td>
						<td><button type="button" value="N" class="button1"
								id="button1" onclick="nnChk_mypage();">중복확인</button></td>
					</tr>
					<tr>
						<td><p>비밀번호</p></td>
						<td><input type="password" name="password" class="password" id="password"
							placeholder="비밀번호를 입력해주세요"></td>
						<td><button type="button" value="N" class="button2"
								id="passwordhidden" onclick="pwChk_mypage();">변경하기</button></td>
					</tr>

					<tr class="tr_password" style="display: none;">
						<td><p>새 비밀번호</p></td>
						<td><input type="password" class="new_password"
							id="new_password" placeholder="새 비밀번호">
							<div class="alert alert-check" id="alert-check"
								style="font-size: 10px; color: red;">비밀번호 8자리 이상</div></td>
						<td><button type="button" value="N" class="button5"
								id="password-check-btn" onclick="password_change();">변경확인</button></td>
					</tr>

					<tr class="tr_password" style="display: none;">
						<td></td>
						<td><input type="password" class="new_password_confirm"
							id="new_password_confirm" placeholder="새 비밀번호 확인">
							<div class="alert alert-true" id="alert-true"
								style="font-size: 10px; color: green;">비밀번호가 일치합니다.</div>
							<div class="alert alert-false" id="alert-false"
								style="font-size: 10px; color: red;">비밀번호가 일치하지 않습니다.</div></td>
					</tr>
					
					<tr>
						<td><p>주소</p></td>
						<td><input type="text" name="postal_num" class="postal_num"
							id="postal_num" value="<%=userDetail.getPostal_num()%>"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" class="address" id="address"
							name="address" value="<%=userDetail.getAddress()%>"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" class="address_detail"
							name="address_detail" id="address_detail"
							value="<%=userDetail.getAddress_detail()%>"></td>
					</tr>
					<tr>
						<td><b class="add">추가정보</b></td>
					</tr>
					<tr>
						<td><p>인스타그램</p></td>
						<td><input type="text" class="instagram_id" id="instagram_id"
							name="instagram_id" value="<%=userDetail.getInstagram_id()%>"></td>
					</tr>
					
					<tr>
						<td><p>자녀 생년월일</p></td>
						<td><input type="text" class="children_birth" name="children_birth"
							id="children_birth" value="<%=userDetail.getChildren_birth()%>"></td>
					</tr>

					<tr>
						<td></td>

						<td class="update_btn"><input type="button" value="회원 정보 수정"
							class="button3"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/member_update.js"></script>
	<script>
		$('#postal_num').click(function() {
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

		function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
				roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn,
				bdMgtSn) {
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

			$('#postal_num').val(zipNo);
			$('#address').val(roadAddrPart1);
			$('#address_detail').val(addrDetail);
		}
	</script>
	<script>
	
	</script>
</body>
</html>