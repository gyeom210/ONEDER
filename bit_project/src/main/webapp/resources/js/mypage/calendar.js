

document.addEventListener('DOMContentLoaded', function(){
    var today = new Date(),
        year = today.getFullYear(),
        month = today.getMonth(),
        monthTag =["01","02","03","04","05","06","07","08","09","10","11","12"],
        day = today.getDate(),
        days = document.getElementById('calendar').getElementsByTagName('td'),
        selectedDay,
        setDate,
        daysLen = days.length;

    function Calendar(selector, options) {
        this.options = options;
        this.draw();
    }
    
    Calendar.prototype.draw  = function() {
        this.getCookie('selected_day');
        this.getOptions();
        this.drawDays();
        var that = this,
            reset = document.getElementById('reset'),
            pre = document.getElementsByClassName('pre-button'),
            next = document.getElementsByClassName('next-button');
            
            pre[0].addEventListener('click', function(){that.preMonth(); });
            next[0].addEventListener('click', function(){that.nextMonth(); });
            reset.addEventListener('click', function(){that.reset(); });
        while(daysLen--) {
            days[daysLen].addEventListener('click', function(){that.clickDay(this); });
        }
    };
    
    Calendar.prototype.drawHeader = function(e) {
        var headDay = document.getElementsByClassName('head-day'),
            headMonth = document.getElementsByClassName('head-month');

            e?headDay[0].innerHTML = e : headDay[0].innerHTML = day;
            headMonth[0].innerHTML = year + " - " + monthTag[month];        
     };
    
    Calendar.prototype.drawDays = function() {
        var startDay = new Date(year, month, 1).getDay(),

            nDays = new Date(year, month + 1, 0).getDate(),  //이번달 총 일수
    
            n = startDay;  //시작일
        //days[1], days[8], days[15], days[22], days[29], days[36]...(매주 월요일)
        //days[4], days[11], days[18], days[25], days[32]...(매주 목요일)
        
        for(var k = 0; k <42; k++) {
            days[k].innerHTML = '';
            days[k].id = '';
            days[k].className = '';
        }
        
        for(var i  = 1; i <= nDays ; i++) {      
        	if(del != "0" && i == 1 && (month+1 == Number(aMonth1)+1)) {    
    			days[4].id = "delivery";	
    		}     	
        	//반납신청일 체크
        	if(aDay1 != "0") {
        		if(i == aDay1 && (month + 1 == aMonth1)) {
                	days[n].id = "pickup";       
                	if(n >= 0 && n < 4) {
                		days[4].id = "delivery";
                	} else if(n >= 4 && n < 11) {               		
                		days[11].id = "delivery";
                	} else if( n >= 11 && n < 18) {
                		days[18].id = "delivery";
                	} else if( n >= 18 && n < 25) {
                		days[25].id = "delivery";
                	} else if( n >= 25 && n < 32) {
                		if(days[32].innerHTMl !== "" ) {
                			days[32].id = "delivery";
                		} else {
                			del = "1";
                		}
                	} else if( n >= 32) {
                		del = "1";
                	}
                }	
        	} 
        	
            days[n].innerHTML = i;
            n++;
        }
             
        //결제일 체크
        if(days[1].innerHTML === "") {
        	days[29].id = "payday";
        	if(aDay1 == "0") {
        		days[32].id = "delivery";
        	}
        } else {
        	days[22].id = "payday";
        	if(aDay1 == "0") {
        		days[26].id = "delivery";
        	}
        }
        
        for(var j = 0; j < 42; j++) {
            if(days[j].innerHTML === ""){
                
                days[j].id = "disabled";
                
            }else if(j === day + startDay - 1){
                if((this.options && (month === setDate.getMonth()) && (year === setDate.getFullYear())) || (!this.options && (month === today.getMonth())&&(year===today.getFullYear()))){
                    this.drawHeader(day);
                    days[j].id = "today";           
                }
            }
            if(selectedDay){
                if((j === selectedDay.getDate() + startDay - 1)&&(month === selectedDay.getMonth())&&(year === selectedDay.getFullYear())){
                days[j].className = "selected";
                this.drawHeader(selectedDay.getDate());
                }
            }
        }
    };
    
    Calendar.prototype.clickDay = function(o) {
        var selected = document.getElementsByClassName("selected"),
            len = selected.length;
        if(len !== 0){
            selected[0].className = "";
        }
        o.className = "selected";
        selectedDay = new Date(year, month, o.innerHTML);
        this.drawHeader(o.innerHTML);
        this.setCookie('selected_day', 1);
        
    };
    
    Calendar.prototype.preMonth = function() {
        if(month < 1){ 
            month = 11;
            year = year - 1; 
        }else{
            month = month - 1;
        }
        this.drawHeader(1);
        this.drawDays();
    };
    
    Calendar.prototype.nextMonth = function() {
        if(month >= 11){
            month = 0;
            year =  year + 1; 
        }else{
            month = month + 1;
        }
        this.drawHeader(1);
        this.drawDays();
    };
    
    Calendar.prototype.getOptions = function() {
        if(this.options){
            var sets = this.options.split('-');
                setDate = new Date(sets[0], sets[1]-1, sets[2]);
                day = setDate.getDate();
                year = setDate.getFullYear();
                month = setDate.getMonth();
        }
    };
    
    Calendar.prototype.reset = function() {
        month = today.getMonth();
        year = today.getFullYear();
        day = today.getDate();
        this.options = undefined;
        this.drawDays();
    };
    
      
    Calendar.prototype.setCookie = function(name, expiredays){
        if(expiredays) {
            var date = new Date();
            date.setTime(date.getTime() + (expiredays*24*60*60*1000));
            var expires = "; expires=" +date.toGMTString();
        }else{
            var expires = "";
        }
        document.cookie = name + "=" + selectedDay + expires + "; path=/";
    };
    
    Calendar.prototype.getCookie = function(name) {
        if(document.cookie.length){
            var arrCookie  = document.cookie.split(';'),
                nameEQ = name + "=";
            for(var i = 0, cLen = arrCookie.length; i < cLen; i++) {
                var c = arrCookie[i];
                while (c.charAt(0)==' ') {
                    c = c.substring(1,c.length);
                    
                }
                if (c.indexOf(nameEQ) === 0) {
                    selectedDay =  new Date(c.substring(nameEQ.length, c.length));
                }
            }
        }
    };
    var calendar = new Calendar();
    
        
}, false);