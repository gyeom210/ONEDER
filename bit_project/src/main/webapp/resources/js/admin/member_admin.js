

	$('#board_history').click(function() {
		var history = $('.history_drop');
		if (history.is(":visible")) {
			$('.board_history_btn > b').text('+');
			history.slideUp();
		} else {
			$('.board_history_btn > b').text('-');
			history.slideDown();
		}
	});
	

	
	function date_to_str1(format)
    {
		 
        var year = format.getFullYear(); 
        var month = format.getMonth() + 1;
        if(month<10) month = '0' + month;
        var date = format.getDate();
        if(date<10) date = '0' + date;
        var hour = format.getHours();
        if(hour<10) hour = '0' + hour;
       
        return year + "-" + month + "-" + date;
        
    } 
	
	
	