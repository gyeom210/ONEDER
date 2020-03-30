<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

</head>

<body>
<%@ include file="/WEB-INF/views/chatframe.jsp" %>
    <form id="product_add_form" method="post" enctype="multipart/form-data" >
        <div>
            <!-- 상품번호 : -->
            <!-- 총점 : 상품리뷰 테이블에 상품명으로 조회해서 전체 평점을 rnum으로 나누어서 값을 넣음-->
            <!-- 날짜 : 폼 전송 시 java 단에서 현재 시간 bean 객체에 넣는 식으로 처리.-->
            <!-- 총수량 : 폼 전송 시 java 단에서 처리-->
            <!-- 
                <input type="hidden" name="product_num" value="시퀀스 쓸거라서 얘는 back-end에서 처리합니다." />                            
                <input type="number" name="gpa" placeholder="상품평점" />                        
                <input type="date" name="regist" placeholder="상품 등록 시간" />
                <input type="number" name="total_amount" placeholder="총수량" />
                -->
            <div>
                <input type="text" name="product_name" placeholder="상품명" />
            </div>

            <div>
                <input type="number" name="rental_amount" placeholder="렌탈수량" />
            </div>
            <div>
                <input type="number" placeholder="개인쉐어수량" />
            </div>
            <div>
                <input type="text" name="manufacturer" placeholder="제조사" />
            </div>
            <div>
                <textarea name="product_content" maxlength="100" rows="12" placeholder="상품상세"></textarea>
            </div>

            <div>
                <select name="category_l">
                    <option selected value="실버">실버</option>
                    <option value="골드">골드</option>
                    <option value="플레티넘">플레티넘</option>
                    <option value="개인쉐어">개인쉐어</option>
                </select>
            </div>
            <div>
                <select name="category_m">
                    <option selected value="04">0~4</option>
                    <option value="57">5~7</option>
                </select>

            </div>
            <div>
                 <select name="category_s">
                        <option selected value="장난감">장난감</option>
                        <option value="나무 장난감">나무 장난감</option>
                        <option value="역할놀이">역할놀이</option>
                        <option value="놀이">놀이</option>
                        <option value="기타">기타</option>
                    </select>

            </div>
            <div>
                <input type="file" name="img_sum" placeholder="슬라이드 1" />
            </div>
            <div>
                <input type="file" name="img_main" placeholder="슬라이드 2" />
            </div>
            <div>
                <input type="file" name="img_detail" placeholder="슬라이드 3" />
            </div>
            <div>
                <input type="file" name="main_img" placeholder="상품상세쪽 이미지" />
            </div>

        </div>

        <div>
            <input type="button" value="[등록]" onclick="prAdd('productAdd.pr')" >
            <a href="javascript:history.go(-1)">[뒤로]</a>
        </div>

    </form>
</body>
<script>
    function prAdd(url) {
		var frm = document.getElementById("product_add_form");
		frm.action = url;
		frm.submit();
	}
</script>
</html>