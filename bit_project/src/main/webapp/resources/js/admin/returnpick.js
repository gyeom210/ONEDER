	function returnpick() {
		
		$.ajax({
			url : '/bit_project/admin_pickuplist.tz',
			type : 'post',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			/*async : false,*/
			success:function(data){
				$('#output').empty();
				$.each(data, function(index, item){	
					var sib0 = "'" + item.state + "'";
					var sib1 = "'" + item.delivery_date + "'";
			      	var sib2 = "'"+item.return_application+"'";
			      	var delivery_date = new Date(item.delivery_date);
			      	var return_application = new Date(item.return_application);
			      	delivery_date = date_to_str(delivery_date);
		            return_application = date_to_str(return_application);
					var output = '';
					output += '<tr>';
					output += '<td>' + item.state_num + '</td>';
					output += '<td>' + item.subscribe_num + '</td>';
					output += '<td>' + item.product_num + '</td>';
					output += '<td>' + item.state + '</td>';
					output += '<td>' + delivery_date + '</td>';
					output += '<td>' + return_application + '</td>';
					output += '<td><button type="button" class="btn btn-sm btn-primary" onclick="accept('+item.state_num+');">완료</button>';
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
	returnpick();
	
	
	
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
	

	
function accept(_sNum) {
	var pick_Accept = confirm("반납완료 처리 하시겠습니까?");
	if(pick_Accept){
		$.ajax({
			url : '/bit_project/pickAccept.tz',
			type : 'post',
			dataType : "json",
			data : {"state_num" : _sNum},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data){
				console.log('반납완료');
			},
			error:function(){
				alert("ajax통신 실패 !!!");
			}
		});
	}
	returnpick();
}