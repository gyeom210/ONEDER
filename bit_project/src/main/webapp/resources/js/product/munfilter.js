var pNum = 0;
document.getElementById('printNumber').value = 0;
var deviceChk = 0;
var cnt = 1;
var scnt = 1;
$(document).ready(function () {
	document.getElementById('printNumber').value = 0;
	var filter = "win16|win32|win64|mac|macintel";
	if ( navigator.platform ) {
		if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
			deviceChk=2;
			allSearch();
		}
		else { 
			deviceChk=1;
			allSearch();
		}
	}
});

function allSearch() {
//pNum = 0;
//document.getElementById('printNumber').value = 0;
	var chkcnt = 0;
	var fil = new Array();
	
	if(deviceChk==1){
		for(var j=1; j<4;j++){		
			var chkbox = $(".c" + j);
				 for (var i = 0; i < chkbox.length; i++) {
					 if (chkbox[i].checked == true) {
						 chkcnt++;
					      fil[j-1] += chkbox[i].value;
					      fil[j-1] += ",";				      
					 }
				 }
			}
	}else {
		for(var j=1; j<4;j++){		
			var chkbox = $(".m" + j);
				 for (var i = 0; i < chkbox.length; i++) {
					 if (chkbox[i].checked == true) {
						 chkcnt++;
					      fil[j-1] += chkbox[i].value;
					     // fil[j-1] += ",";				      
					 }
				 }
			}
	}
	$.ajax({
		url: '/bit_project/filterSearch.pr',
		type: 'post',
		data:{pno : pNum, category_l : fil[0], category_m : fil[1], category_s : fil[2], "special" : $('#sort').text()}, 
		dataType: "json",
		async:false,
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success: function (data) {
				if(data!=null){
			$.each(data, function (index, item) {
                if(deviceChk==1){
				if(cnt%4==1){
					var op = 
					'<div class="swiper-container'+scnt+'">'+
					'<div class="chart_cont'+scnt+' swiper-wrapper">';
					$('.product_chart').append(op);
				}
				var output = '';
				output += 
				'<div class="swiper-slide">'+
				'<div class="pr_img">';
				output +=
				'<figure>'+
				'<a href="productDetail.pr?num='+item.product_num+'">'+
				'<img src="/bit_project/image/'+item.img_sum+'">'+
				'</a>'+
				'</figure>';
				output +=
				'<div class="rank">'+
				'<strong>'+item.product_num+'</strong>'+
				'</div></div>';
				output +=
				'<div class="infor">';
				output +=
				'<h3><strong>'+item.product_name+'</strong></h3>';
				output +=
				'</div></div></div>';
				$('.chart_cont'+scnt).append(output);
				if(cnt%4==0){
					var output2 = '</div></div></div>';
					$('.product_chart').append(output2);
					var output3 = "";
					output3+='<script>';
					output3+='var swiper'+scnt+' ='+' new Swiper(\'.swiper-container'+scnt+'\', {';				
					output3+='slidesPerView : 4, spaceBetween : 24,';
//					output3+='breakpoints : { 600 : { slidesPerView : 4, spaceBetween : 0}}';
					output3+='});';
					output3+='</script>';
					console.log(output3);
					$('.product_chart').append(output3);
					scnt++;
				}
				cnt++;
            } else{
            	if(cnt%2==1){
					var op = 
					'<div class="swiper-container'+scnt+'">'+
					'<div class="chart_cont'+scnt+' swiper-wrapper">';
					$('.product_chart').append(op);
				}
				var output = '';
				output += 
				'<div class="swiper-slide">'+
				'<div class="pr_img">';
				output +=
				'<figure>'+
				'<a href="productDetail.pr?num='+item.product_num+'">'+
				'<img src="/bit_project/image/'+item.img_sum+'">'+
				'</a>'+
				'</figure>';
				output +=
				'<div class="rank">'+
				'<strong>'+item.product_num+'</strong>'+
				'</div></div>';
				output +=
				'<div class="infor">';
				output +=
				'<h3><strong>'+item.product_name+'</strong></h3>';
				output +=
				'</div></div></div>';
				$('.chart_cont'+scnt).append(output);
				if(cnt%2==0){
					var output2 = '</div></div></div>';
					$('.product_chart').append(output2);
					var output3 = "";
					output3+='<script>';
					output3+='var swiper'+scnt+' ='+' new Swiper(\'.swiper-container'+scnt+'\', {';				
					output3+='slidesPerView : 2, spaceBetween : 0,';
					output3+='breakpoints : { 600 : { slidesPerView : 2, spaceBetween : 0}}';
					output3+='});';
					output3+='</script>';
					console.log(output3);
					$('.product_chart').append(output3);
					scnt++;
				}
				cnt++;
            }
			});
			pNum += 8;
			document.getElementById('printNumber').value = pNum;
			
				}
			},
		error: function () {
			alert("DB에서 가져올 데이터가 없습니다.");
		}
		
	});
	
}		

function fil() {
	if(deviceChk==2){
		  var fil = document.getElementById('mFilter_menu');
		  if (fil.style.display == 'none') {
			$('#mFilter label[for="menu_state"] i').css("right", "0px");
			 fil.style.display = 'block';
			    $('.fildivision').show();
		    /*
		    $('#mFilter').css("width","100%");
		    $('#mFilter label[for="menu_state"] i::before').css("content","\f053");
		    $('#mFilter ul').css("width","100%");
		    $('#mFilter ul li a i').css("border-right","1px solid #2f343e");
			*/
		    
		  } else {
			  $('#menu_state').prop('checked', false);
			  $('#mFilter label[for="menu_state"] i').css("right", "-16px");
			/*  $('#mFilter').css("width","0");
			    $('#mFilter label[for="menu_state"] i::before').css("content","\f054");
			    $('#mFilter ul').css("width","0%");
			    $('#mFilter ul li a i').css("border-right","1px solid #2f343e");
				*/
			  fil.style.display = 'none';
			    $('.fildivision').hide();
			  $('main').css("left", "0px");
		  }
	}
	
	pNum = 0;
	document.getElementById('printNumber').value = 0;
	cnt = 1;
	scnt = 1;
	$('.product_chart').empty();
	
	  allSearch();
	
}

$(window).scroll(function(){
		if($(window).scrollTop() == $(document).height() - $(window).height()){
			allSearch();
		}
})


function fn_searchList() {
   var searchType = $('#select_searchtype option:selected').val();
   var searchWord = $('#searchword').val();

   cnt = 1;
   scnt = 1;
   pNum = 0;
   document.getElementById('printNumber').value = 0;
    $.ajax({
           url: '/bit_project/selectProductList.pr',
            type: 'POST',
            dataType: 'json',
            async:false,
            data: {"search_type" : searchType, "search_word" : searchWord, "pno" : pNum},
            success: function (data) {
                $(".product_chart").empty();
                $.each(data, function (index, item) {

                   if(deviceChk==1){
                   if(cnt%4==1){
                      var op = 
                      '<div class="swiper-container'+scnt+'">'+
                      '<div class="chart_cont'+scnt+' swiper-wrapper">';
                      $('.product_chart').append(op);
                   }
                   var output = '';
                   output += 
                   '<div class="swiper-slide">'+
                   '<div class="pr_img">';
                   output +=
                   '<figure>'+
                   '<a href="productDetail.pr?num='+item.product_num+'">'+
                   '<img src="/bit_project/image/'+item.img_sum+'">'+
                   '</a>'+
                   '</figure>';
                   output +=
                   '<div class="rank">'+
                   '<strong>'+item.product_num+'</strong>'+
                   '</div></div>';
                   output +=
                   '<div class="infor">';
                   output +=
                   '<h3><strong>'+item.product_name+'</strong></h3>';                   
                   output +=
                   '</div></div></div>';
                   $('.chart_cont'+scnt).append(output);
                   if(cnt%4==0){
                      var output2 = '</div>';
                      $('.product_chart').append(output2);
                      var output3 = "";
                      output3+='<script>';
                      output3+='var swiper'+scnt+' ='+' new Swiper(\'.swiper-container'+scnt+'\', {';            
                      output3+='slidesPerView : 4, spaceBetween : 24,';
                      output3+='breakpoints : { 600 : { slidesPerView : 4, spaceBetween : 0}}';
                      output3+='});';
                      output3+='</script>';
                      console.log(output3);
                      $('.product_chart').append(output3);
                      scnt++;
                   }
                   cnt++;
                   
                }else {
                   if(cnt%2==1){
                      var op = 
                      '<div class="swiper-container'+scnt+'">'+
                      '<div class="chart_cont'+scnt+' swiper-wrapper">';
                      $('.product_chart').append(op);
                   }
                   var output = '';
                   output += 
                   '<div class="swiper-slide">'+
                   '<div class="pr_img">';
                   output +=
                   '<figure>'+
                   '<a href="productDetail.pr?num='+item.product_num+'">'+
                   '<img src="/bit_project/image/'+item.img_sum+'">'+
                   '</a>'+
                   '</figure>';
                   output +=
                   '<div class="rank">'+
                   '<strong>'+item.product_num+'</strong>'+
                   '</div></div>';
                   output +=
                   '<div class="infor">';
                   output +=
                   '<h3><strong>'+item.product_name+'</strong></h3>';
               /*    output +=
                   '<div class="infor_btn">';
                   output +=
                   '<a href="productDetail.pr">상세정보</a>';
                   output +=
                   '<a href="#">위시리스트</a>';*/
                   output +=
                   '</div></div></div>';
                   $('.chart_cont'+scnt).append(output);
                   if(cnt%2==0){
                      var output2 = '</div>';
                      $('.product_chart').append(output2);
                      var output3 = "";
                   
                      output3+='<script>';
                      output3+='var swiper'+scnt+' ='+' new Swiper(\'.swiper-container'+scnt+'\', {';            
                      output3+='slidesPerView : 2, spaceBetween : 0,';
                      output3+='breakpoints : { 600 : { slidesPerView : 2, spaceBetween : 24}}';
                      output3+='});';
                      output3+='</script>';
                      console.log(output3);
                      $('.product_chart').append(output3);
                      scnt++;
                   }
                   cnt++;
                   
                }
                   
                })
                document.getElementById('printNumber').value = 8;
              pNum = parseInt(document.getElementById('printNumber').value); //8
            },
           error: function () {
            alert("ajax오류");
         }
        });
}

$('.total_count').click(function() {
	// 필터 초기화 후 allsearch();
})