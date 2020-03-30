<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 폰트어썸 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/mypage/share.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@charset "utf-8";
	@font-face { font-family: 'S-CoreDream-4Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff'); font-weight: normal; font-style: normal; }
	* {font-family: 'S-CoreDream-4Regular';}
   .modal {text-align: center; display: block;margin: 0 auto;font-size: 16px;color: #999;z-index:2;}
     h1.title {font-size: 30px;color: #ea7475;}
     .sentence {text-align: left;padding-left: 22px;margin:2px;font-size: 13px;font-weight: lighter;}
     .subtitle {margin:5px;}
     label {width:300px;display: inline-block; margin-top: 0px; }
     form {margin: 0 auto;width: 600px;}
     .modal > .modal-content > form > input, .modal > .modal-content > form > .button-box > input { width: 300px; height: 27px;background-color: #efefef;border-radius: 5px;border: 1px solid #dedede; padding: 10px;margin-top: 3px;font-size: 0.9em;color: #3a3a3a;margin-bottom: 5px;}
     .modal > .modal-content > form > input:focus{ border: 1px solid #97d6eb;}
     #ncancel {width: 127px; height: 48px;text-align: center;border: none;margin-top: 20px;cursor: pointer;}
     #ncancel:hover{color: #fff;background-color: #ea7475;opacity: 0.9;}
     .modal {position: absolute;left: 0;top: 0;width: 70%;height: 100%;background-color: rgba(0, 0, 0, 0.5);opacity: 0;visibility: hidden;transform: scale(1.1);transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s;}
     .modal-content {position: absolute;width:50% !important; height:70%;top: 40%;left: 60%;transform: translate(-50%, -50%);background-color: white;padding: 1rem 1.5rem;width: 500px;border-radius: 0.5rem;margin:0 auto;}
     .button-box {text-align: center;}
     .cb {float: left;width: 13px;height: 13px;}
     .checkbox {text-align: left;}
     .close-button { float: right; width: 1.5rem;line-height: 1.5rem; text-align: center; cursor: pointer; border-radius: 5px; background-color: lightgray; }
     .close-button:hover {background-color: darkgray;}
     .show-modal { opacity: 1;  visibility: visible;  transform: scale(1.0); transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;  width: 100%;  height: 900px;}
	</style>
</head>
<body>
	<div class="share">
    </div>
    <div class="share_paginate" style="text-align:center;"></div>
    <div class="share_history">
    </div>
    <div class="sharehis_paginate" style="text-align:center;"></div>
    <div class="modal" id="nursery-modal">
         <div class="modal-content">
             <span class="close-button" id="nclose-button" onclick="munmodalexit();">&times;</span> 
             <h1 class="title">마이페이지 쉐어 상세보기</h1>
             <hr>
           <form>
				<label>share_num</label><input type="number" name="share_num" id="mun_share_num" value="" />
				<label>product_num</label><input type="number" name="product_num" id="mun_product_num" value="" />
				<label>product_name</label><input type="text" name="product_name" id="mun_product_name" value="" />
				<label>email</label><input type="text" name="email" id="mun_email" value="" />
				<label>consignment_start_date</label><input type="text" name="consignment_start_date" id="mun_consignment_start_date" value="" />
				<label>consignment_end_date</label><input type="text" name="consignment_end_date" id="mun_consignment_end_date" value="" />
				<label>total_share_count</label><input type="number" name="total_share_count" id="mun_total_share_count" value="" />
				<label>total_accumulated_fund</label><input type="number" name="total_accumulated_fund" id="mun_total_accumulated_fund" value="" />
				<label>accumulated_fund</label><input type="number" name="accumulated_fund" id="mun_accumulated_fund" value="" />
				<label>total_amount</label><input type="number" name="total_amount" id="mun_total_amount" value="" />
				<label>share_amount</label><input type="number" name="share_amount" id="mun_share_amount" value="" />
				<label>current_amount</label><input type="number" name="current_amount" id="mun_current_amount" value="" />
				<label>bank</label><input type="text" name="bank" id="mun_bank" value="" />
				<label>account</label><input type="text" name="account" id="mun_account" value="" />
				<label>name</label><input type="text" name="name" id="mun_name" value="" />
		</form>
         </div> 
     </div>  
    
</body>
</html>