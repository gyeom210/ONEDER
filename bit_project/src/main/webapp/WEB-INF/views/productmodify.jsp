<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.spring.product.ProductVO" %>
    <% ProductVO prVO = (ProductVO)request.getAttribute("prVO");%>
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
        }
        
        var sel_files = [];
        $(document).ready(function(){
            $(".img_set").on("change", handleImgsFileSelect);
        });

        function handleImgsFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }

                sel_files.push(f);

                var reader = new FileReader();
                reader.onload = function(e) {
                    var img_html = "<img src=\"" + e.target.result + "\" />";
                    $(".imgs_wrap").append(img_html);
                }
                reader.readAsDataURL(f);
            });
        }
        function clsimg() {
        	$(".imgs_wrap").empty();
        	$(".img_set").val("");
            
		}
        
    </script>
</head>

<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
    <div class="container">
        <form  id="product_add_form" class="product-form" name="product_add_form" method="POST" enctype="multipart/form-data">
            <h3>기본정보</h3>
            <hr>
            <div class="product-image">
                <div class="image-text">
                	    상품이미지
                </div>
                <div class="image-wrapper">
                    <input type="file"  class="img_set" name="img_sum" />
                    <input type="file"  class="img_set" name="img_main" />
                    <input type="file"  class="img_set" name="img_detail" />
                    <input type="file" name="main_img" placeholder="상품상세쪽 이미지" />
                    <input type="button" onclick="clsimg();" value="이미지 초기화" />
                    <div class="imgs_wrap">
                    </div>
                    
                    <div class="caution">
                        <p>*상품 이미지는 640x640에 최적화 되어 있습니다.</p>
                        <p>-이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.</p>
                        <p>-큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다.</p>
                        <p>최대 지원 사이즈인 640X640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)</p>
                    </div>
                </div>
            </div>
            <div class="product-subject">
                <div class="subject-text">상품명</div>
                <div class="subject-input">
                    <input type="text" name="product_name" value="<%=prVO.getProduct_name()%>">
                </div>
            </div>
            <div class="product-category">
                <div class="category-text">카테고리</div>
                <div class="category-input">
                    <select name="category_l">
                        <option value="실버">실버</option>
                        <option value="골드">골드</option>
                        <option value="플레티넘">플레티넘</option>
                        <option value="개인쉐어">개인쉐어</option>
                    </select>
                    <select name="category_m">
                        <option value="04">0~4</option>
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
  				<input type="hidden" name="ta" value="<%=prVO.getTotal_amount() %>" />
                <input type="number" name="total_amount" value="<%=prVO.getTotal_amount() %>" />
            </div>
            <div>
                <input type="hidden" name="current_amount" value="<%=prVO.getCurrent_amount() %>" />
            </div>
            <div>
                <input type="text" name="manufacturer" value="<%=prVO.getManufacturer() %>" />
            </div>
            <div>
                <textarea name="product_content" maxlength="100" rows="12" ><%=prVO.getProduct_content() %></textarea>
                <input type="hidden" name="product_num" value="<%=prVO.getProduct_num() %>"  />
            </div>
  			
            <div class="btn-product">
                <input type="button" value="[상품수정하기]" onclick="prAdd('productModify.pr')" >            	
            </div>
        </form>
    </div>
     <script>    
    var c_l = "<%=prVO.getCategory_l()%>";
    var c_m = "<%=prVO.getCategory_m()%>";
    var c_s = "<%=prVO.getCategory_s()%>";
    $('[name="category_l"] option[value='+c_l+']').attr('selected','selected');
    $('[name="category_m"] option[value='+c_m+']').attr('selected','selected');
    $('[name="category_s"] option[value='+c_s+']').attr('selected','selected');
    </script>
    
   
</body>

</html>