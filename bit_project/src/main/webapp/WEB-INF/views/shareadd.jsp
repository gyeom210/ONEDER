<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
   request.setCharacterEncoding("UTF-8");
   int waiting_num = Integer.parseInt(request.getParameter("waiting_num")); 
   String email = request.getParameter("email"); 
   String name = request.getParameter("name"); 
   String product_name = request.getParameter("product_name");
   String amount = request.getParameter("amount"); 
   String consignment_start_date = request.getParameter("consignment_start_date");
   String consignment_end_date = request.getParameter("consignment_end_date");
   String share_content = request.getParameter("share_content"); 
   String share_img1 = request.getParameter("share_img1");
   String share_img2 = request.getParameter("share_img2"); 
   String share_img3 = request.getParameter("share_img3"); 
   String bank = request.getParameter("bank");
   String account = request.getParameter("account"); 
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ProductAdd</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/productadd.css" />">
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.js" charset="UTF-8"></script>
    <script type="text/javascript">
        function prAdd(url) {
            var frm = document.getElementById("product_add_form");
            frm.action = url;
            frm.submit();
            alert('등록완료');
            window.close();
        }
    </script>
</head>

<body>

    <div class="container">
        <form  id="product_add_form" class="product-form" name="product_add_form" method="POST" enctype="multipart/form-data">
            <h3>기본정보</h3>
            <hr>
          
            <div class="product-subject">
                <div class="subject-text">상품명</div>
                <div class="subject-input">
                    <input type="text" name="product_name" placeholder="상품명" value="<%=product_name%>">
                </div>
            </div>
            <div class="product-category">
                <div class="category-text">카테고리</div>
                <div class="category-input">
                    <select name="category_l">
                        <option selected value="실버">실버</option>
                        <option value="골드">골드</option>
                        <option value="플레티넘">플레티넘</option>
                        <option value="개인쉐어">개인쉐어</option>
                    </select>
                    <select name="category_m">
                        <option selected value="04">0~4</option>
                        <option value="57">5~7</option>
                    </select>
                    <select name="category_s">
                        <option selected value="장난감">장난감</option>
                        <option value="나무 장난감">나무 장난감</option>
                        <option value="역할놀이">역할놀이</option>
                        <option value="놀이">놀이</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
            </div>
  			<div>
                <input type="number" name="total_amount" placeholder="총수량" value="<%=amount %>" />
            </div>
            <div>
                <input type="text" name="manufacturer" placeholder="제조사" />
            </div>
            <div>
            <textarea name="product_content" maxlength="100" rows="12" placeholder="상품상세"><%=share_content%></textarea>
            </div>
             <div>
                <input type="hidden" name="waiting_num" value="<%=waiting_num%>"/>
            </div>
            <div>
                <input type="hidden" name="email" value="<%=email%>"/>
            </div>
            <div>
                <input type="hidden" name="name" value="<%=name%>"/>
            </div>
            <div>
                <input type="hidden" name="consignment_start_date" value="<%=consignment_start_date%>"/>
            </div>
            <div>
                <input type="hidden" name="consignment_end_date" value="<%=consignment_end_date%>"/>
            </div>
        
            <div>
                <input type="hidden" name="share_img1" value="<%=share_img1%>"/>
            </div>
            <div>
                <input type="hidden" name="share_img2" value="<%=share_img2%>"/>
            </div>
            <div>
                <input type="hidden" name="share_img3" value="<%=share_img3%>"/>
            </div>
            <div>
                <input type="hidden" name="bank" value="<%=bank%>"/>
            </div>
            <div>
                <input type="hidden" name="account" value="<%=account%>"/>
            </div>
  			
  			
            <div class="btn-product">
                <input type="button" value="[상품등록하기]" onclick="prAdd('shareAddProcess.pr')" >            	
            </div>
        </form>
    </div>
    
   
</body>

</html>