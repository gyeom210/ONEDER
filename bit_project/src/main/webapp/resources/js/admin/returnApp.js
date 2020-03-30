$(document).ready(function() {
	product_return();
});

function product_return() {
		$.ajax({
			url : '/bit_project/admin_return.tz',
			type : 'post',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data){
				$('#output').empty();
				$.each(data, function(index, item){	//각각의 데이터는 item에 저장됨. index는 parameter값 item은 실제 저장된 값.
					var output = '';
					output += '<tr>';
					output += '<td>' + item.state_num + '</td>';
					output += '<td>' + item.subscribe_num + '</td>';
					output += '<td>' + item.product_num + '</td>';
					var date1 = new Date(item.delivery_date);
		            date1 = date_to_str(date1);
                   	output += '<td>' + item.state + '</td>';
					output += '<td>' + date1 + '</td>';
					output += '<td>' + item.return_application + '</td>';
					output += '</td>';
					output += '</tr>';
					
					console.log("output:"+output);
					$('#output').append(output);
					
				});

			},
			error:function(){
				alert("ajax통신 실패 !!!");
			}
		});
}
	function date_to_str(format)
    {
        var year = format.getFullYear();
        var month = format.getMonth() + 1;
        if(month<10) month = '0' + month;
        var date = format.getDate();
        if(date<10) date = '0' + date;
        var hour = format.getHours();
        if(hour<10) hour = '0' + hour;
        var min = format.getMinutes();
        if(min<10) min = '0' + min;
        var sec = format.getSeconds();
        if(sec<10) sec = '0' + sec;
        
        return year + "-" + month + "-" + date + " " + hour + ":" + min;
        
    }
$(document).on("click","#blanket",function(){
	$.ajax({
		url : '/bit_project/admin_batch.tz',
		type : 'post',
		async : false,
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		
	});
	product_return();
	history.go(0);
})



