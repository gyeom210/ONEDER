	function share() {
		
		$.ajax({
			url : '/bit_project/member_share.tz',
			type : 'post',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			/*async : false,*/
			success:function(data){
				$('#output').empty();
				$.each(data, function(index, item){	//각각의 데이터는 item에 저장됨. index는 parameter값 item은 실제 저장된 값.
					var email = "'" + item.email + "'";
					var sib1 = "'" + item.name + "'";
			      	var sib2 = "'"+item.product_name+"'";
                   	var sib3 = "'"+item.amount+"'";
                   	var sib4 = "'"+item.share_content+"'"; 
					
                   	var sib5 = "'"+item.share_img1+"'";
                   	var sib6 = "'"+item.share_img2+"'";
                   	var sib7 = "'"+item.share_img3+"'";
                   	var sib8 = "'"+item.bank+"'";
                   	var sib9 = "'"+item.account+"'";
                   	var sib10 = "'"+item.accumulated_fund+"'";
                   	
					var output = '';
					output += '<tr>';
					output += '<td>' + item.email + '</td>';
					output += '<td>' + item.product_name + '</td>';
					output += '<td>' + item.amount + '</td>';
					var date = new Date(item.consignment_start_date);
		            date = date_to_str(date);
					output += '<td>' + date + '</td>';
					date = date_to_str(new Date(item.consignment_end_date));
					output += '<td>' + date + '</td>';
					output += '<td>' + item.share_content + '</td>';
					
					output += '<td>' + '<button type="button" class="btn btn-sm btn-primary" onclick="shareDetail('+item.waiting_num+','+email+','+sib1+','+sib2+','+sib3+','+sib4+','+sib5+','+sib6+','+sib7+','+sib8+','+sib9+','+item.accumulated_fund+');">상세보기</button>' + '</td>';
					output += '<td><button type="button" class="btn btn-sm btn-primary" onclick="accept('+item.waiting_num+');">수락</button>';
					output += '<button type="button" class="btn btn-sm btn-primary" onclick="deny('+item.waiting_num+');">거절</button></td>';
					
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
	share();
	
	
	
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
	
	function shareDetail(_wnum, _email, _name, _pName, _amount, _content, _img1, _img2, _img3, _bank, _account, _fundtier) {
		//파라미터로 받았고, 팝업창 띄움.
		$('#waiting_num').val(_wnum);
		$('#email').val(_email);
		$('#name').val(_name);
		$('#product_name').val(_pName);
		$('#amount').val(_amount);
		$('#share_content').val(_content);
		$('#share_img1').val(_img1);
		$('#share_img2').val(_img2);
		$('#share_img3').val(_img3);
		$("#detailimg1").attr("src", "/bit_project/image/"+_img1);
		$("#detailimg2").attr("src", "/bit_project/image/"+_img2);
		$("#detailimg3").attr("src", "/bit_project/image/"+_img3);
		$('#bank').val(_bank);
		$('#account').val(_account);
		$('#accumulated_fund').val(_fundtier);
		var modal2 = document.querySelector("#nursery-modal");
		   modal2.classList.toggle("show-modal");
		/*var pop_name = "popupDetail";
		window.open("", pop_name,"width=1200,height=700, scrollbars=no, resizable=no");
		
		 var frmData = document.frmData;
	        frmData.target = pop_name;
	        frmData.action = "/bit_project/shareDetail.pr";
	        frmData.submit();*/
	}

function asdad() {
		var modal2 = document.querySelector("#nursery-modal");
		   modal2.classList.toggle("show-modal");
}
function accept(_wnum) {
	var share_Accept = confirm("쉐어 수락하시겠습니까?");
	if(share_Accept){
		$.ajax({
			url : '/bit_project/shareAcceptOrDeny.tz',
			type : 'post',
			dataType : "json",
			data : {"waiting_num" : _wnum, "chk" : "Accept"},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data){
				console.log('수락완료');
			},
			error:function(){
				alert("ajax통신 실패 !!!");
			}
		});
	}
	share();
}
function deny(_wnum) {
	var share_Deny= confirm("쉐어 거절하시겠습니까?");
	if(share_Deny){
		$.ajax({
			url : '/bit_project/shareAcceptOrDeny.tz',
			type : 'post',
			dataType : "json",
			data : {"waiting_num" : _wnum, "chk" : "Deny"},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data){
				console.log('거절완료');
			},
			error:function(){
				alert("ajax통신 실패 !!!");
			}
		});
	}
	share();
	
}