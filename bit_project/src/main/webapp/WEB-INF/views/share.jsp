<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	if(session.getAttribute("email")==null){
		out.println("<script>");
	    out.println("location.href='login.me'");
	    out.println("</script>");
	} 
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<title>Share</title>
<link rel="stylesheet" href="<c:url value="/resources/css/share.css" />">


</head>
<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
	<div style="height: 50px;">
		<%@ include file="/WEB-INF/views/header3.jsp"%>
	</div>
	<div class="container">
		<div id="subject">
			<h1>Share</h1>
			<hr>
		</div>
		<div class="content">
			<div id="info">
				<div id="share">
					<br>
					<h2>Share</h2>
					<p>쉐어받은 물품은 상품리스트에 올라갑니다.</p>
					<p>렌탈시 수익 발생</p>
					<p>배송비 무료</p>
					<p>상품가치가 없을 경우 반송(반송비 고객부담)</p>
				</div>
			</div>

			<div id="share-form">
				<hr>
				<br>
				<h2>신청서 작성</h2>
				<br>
				<form id="form_share" method="POST" enctype="multipart/form-data">
				<input type="hidden" value="<%=email %>" name="email"/>
					<table id="share-info">
						<tr>
							<td>구독자 성명</td>
							<td colspan="2"><input class="field-text" type="text" name="name"></td>
						</tr>					
						<tr>
							<td>상품명</td>
							<td colspan="2"><input class="field-text" type="text" name="product_name"></td colspan="2">
						</tr>
						<tr>
							<td>간단한 상품설명(구매시기 등)</td>
							<td colspan="2"><input class="field-text" type="text" name="share_content"></td colspan="2">
						</tr>
						
						<tr>
							<td>수량</td>
							<td colspan="2"><input class="field-text" type="text" name="amount"></td colspan="2">
						</tr>
						<tr>
							<td>쉐어기간</td>
							<td colspan="2"><input class="field-text" type="text" name="consignment_end_date" id="datepicker" /></td colspan="2">
						</tr>
							<tr>
							<td>이미지1</td>
							<td colspan="2"><input type="file" name="share_img1"></td colspan="2">
						</tr>
							<tr>
							<td>이미지2</td>
							<td colspan="2"><input type="file" name="share_img2"></td colspan="2">
						</tr>
							<tr>
							<td>이미지3</td>
							<td colspan="2"><input type="file" name="share_img3"></td colspan="2">
						</tr>
						
						<tr>
							<td>계좌번호</td>
							<td><select id="select" name="bank">
									<option value="은행">은행</option>
									<option value="국민">국민</option>
									<option value="우리">우리</option>
									<option value="신한">신한</option>
									<option value="농협">농협</option>
									<option value="IBK">IBK</option>
									<option value="씨티">씨티</option>
							</select> <input class="field-text" type="text" name="account"></td>
						</tr>
						
					</table>
					<br>
					<table id="share-chk" style="font-size: 13px">
						<tr>
							<td>발송 후 단순 변심에 의한 레고의 반송은 불가합니다.</td>
							<td><input type="checkbox" name="chk_info" id="chk_info">예,
								확인하였습니다. <b>(필수)</b></td>
						</tr>
						<tr>
							<td colspan="2">담당자가 확인 후 알림메시지 발송</td>
						</tr>
						<tr>
							<td colspan="2">지정한 쉐어 기간에서 약 1~2달 정도 반납이 지연될 수 있습니다.</td>
						</tr>
					</table>
					<br> <span>
						<button class="btn" id="nextstep">제출</button>
					</span>
					<!-- 
					<input type="hidden" name="to" value="tazo0519@naver.com">
					<input type="hidden" name="from" value="tazo0519@naver.com">
					 -->
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div style="height: 50px;">
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp"%>
		</footer>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/share.js"></script>
 
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
$(document).ready(function() {
    $("#datepicker").datepicker({	  
          showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
          buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 버튼 이미지
          buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
          changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
          changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
          minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
          nextText: '다음 달', // next 아이콘의 툴팁.
          prevText: '이전 달', // prev 아이콘의 툴팁.
          numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
          stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
          yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
          showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. ( ...으로 표시되는부분이다.) 
          currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
          closeText: '닫기',  // 닫기 버튼 패널
          dateFormat: "yy/mm/dd", // 텍스트 필드에 입력되는 날짜 형식.
          showAnim: "slide", //애니메이션을 적용한다.  
          showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
          dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.	 
     });	 
});

</script>
</body>
</html>