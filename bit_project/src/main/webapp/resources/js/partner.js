$(".hover").mouseleave(function() {
	$(this).removeClass("hover");
});

$(document).on("touchstart", function(){ });
//모바일에서 터치 기능으로 hover사용 하려 할때 사용하는 함수.


$(document).ready(function() { // 제일 아래 selectData() 먼저 실행.

	
	// 목록
	function selectData() {
		
		
		$('.partner_chart').empty();

		$.ajax({
			url : '/bit_project/getChartJSON.pr', // url호출하면 getChartJSON부름.
													// controller의
													// getPeopleJSON에서 str을 받아옴
			type : 'POST',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				//alert(data);
				$.each(data, function(index, item) { // 각각의 데이터는 item에 저장됨.
														// index는 parameter값
														// item은 실제 저장된 값.
					var output = '';
					output +=
					'<figure class="snip1273">' + 
					'<img src="/bit_project/image/'+item.img+'">' +
					'<figcaption>' + 
					'<h3>' + item.name + '</h3>' + 
					'<p>' + item.content + '</p>' + 
					'<a href="' + item.homepage+ + '/" target="_blank" style="text-align:right;">' +
					/*'<p onClick="open(' +homepage +');" style="cursor:pointer;">' +*/
					'GO!' + 
					'</a>' +
					'</figurecaption>' +
					'</figure>';
					console.log("snip1273:" + output);
					$('.partner_chart').append(output);
				});
			},
			error : function(request, status, error) {
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		});
		
		event.preventDefault();
	}
	
	
/*
	function button_click(){
		alert("fuck you(filter)");
		$('#partner_chart').empty();
		
		$.ajax({
			
			url : '/bit_project/getChartJSON.pr', // url호출하면 getChartJSON부름.
													// controller의
													// getPeopleJSON에서 str을 받아옴
			type : 'POST',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				
				$.each(data, function(index, item) { // 각각의 데이터는 item에 저장됨.
														// index는 parameter값
														// item은 실제 저장된 값.
					
					if($("#select option:selected").val() == item.category){
						alert($("#select option:selected").val());
						var output = '';
						output +=
						'<figure class="snip1273">' + 
						'<img src="/bit_project/image/'+item.img+'">' +
						'<figcaption>' + 
						'<h3>' + item.name + '</h3>' + 
						'<p>' + item.content + '</p>' + 
						'<br>' + 
						'<a href="' + item.homepage + '/" target="_blank" style="text-align: right;">' +
						'GO!' + 
						'</a>' +
						'</figurecaption>' +
						'</figure>';
						console.log("snip1273:" + output);
						$('.partner_chart').append(output);
						console.log(item.category);
					}
					
				});
			},
			error : function(request, status, error) {
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		});
		
		event.preventDefault();
		
	}

*/	
	
	
	selectData(); // 위의 selectData()실행
	//button_click();
	
});


function button_click(){
	
	$('.partner_chart').empty();
	
	$.ajax({
		
		url : '/bit_project/getChartJSON_filter.pr', // url호출하면 getChartJSON부름.
												// controller의
												// getPeopleJSON에서 str을 받아옴
		type : 'POST',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data) {
			
			$.each(data, function(index, item) { // 각각의 데이터는 item에 저장됨.
													// index는 parameter값
													// item은 실제 저장된 값.
				/*alert(index);
				alert(item.category);*/
				
				if($("#select_box option:selected").val() == item.category){
					//alert($("#select option:selected").val());
					/*alert("선택됨.");*/
					var output = '';
					output +=
					'<figure class="snip1273">' + 
					'<img src="/bit_project/image/'+item.img+'">' +
					'<figcaption>' + 
					'<h3>' + item.name + '</h3>' + 
					'<p>' + item.content + '</p>' + 
					'<a href="' + item.homepage + '/" target="_blank" style="text-align: right;">' +
					'GO!' + 
					'</a>' +
					'</figurecaption>' +
					'</figure>';
					console.log("snip1273:" + output);
					$('.partner_chart').append(output);
					console.log(item.category);
				} 
				/*else if($("#select_box option:selected").val() == "전체선택"){
					selectData();
					continue;
				}*/
				
			});
			if($("#select_box option:selected").val() == "전체선택"){
				selectData();
			}
		},
		error : function(request, status, error) {
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
	
	event.preventDefault();
	
}


function selectData() {
	
	
	$('.partner_chart').empty();

	$.ajax({
		url : '/bit_project/getChartJSON.pr', // url호출하면 getChartJSON부름.
												// controller의
												// getPeopleJSON에서 str을 받아옴
		type : 'POST',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data) {
			$.each(data, function(index, item) { // 각각의 데이터는 item에 저장됨.
													// index는 parameter값
													// item은 실제 저장된 값.
				var output = '';
				output +=
				'<figure class="snip1273">' + 
				'<img src="/bit_project/image/'+item.img+'">' +
				'<figcaption>' + 
				'<h3>' + item.name + '</h3>' + 
				'<p>' + item.content + '</p>' + 
				'<a href="' + item.homepage + '/" target="_blank" style="text-align: right;">' +
				'GO!' + 
				'</a>' +
				'</figurecaption>' +
				'</figure>';
				console.log("snip1273:" + output);
				$('.partner_chart').append(output);
			});
		},
		error : function(request, status, error) {
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
	
	event.preventDefault();
}

