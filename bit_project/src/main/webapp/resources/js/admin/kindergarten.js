/* db에 member 정보 저장돼있는것 불러와서 뿌려주는 ajax */
var state_param = null;
   //밑에 테이블
   function del1(param_name) {
	  	 var input = confirm("거절 하시겠습니까?");
		 if(input){
	  	
	  	 $.ajax({
	  	        url: '/bit_project/cpdelete.se',
	  	        type:"post",  
	  	        dataType : "json",
	  	        data : {"name" : param_name},
	  	       
	  	        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	  	        
		  	        success: function(result){	  	        	
		  	            if (result.res=="OK") {
		  	                alert("거절 완료.");
		  	              $.ajax({

		  	  	    	  url : '/bit_project/kindergarten_admin.se',
		  	  		         type : "post",
		  	  		         dataType : "json",
		  	  		         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		  	  		         async: false,
		  	  		         success:function(data){
		  	  		        	 $('#output1').empty();
		  	  		            $.each(data, function(index, item){   //각각의 데이터는 item에 저장됨. index는 parameter값 item은 실제 저장된 값.
		  	  		            	if(item.state == 'Y') {
		  	  		            		
		  	  		            		
		  	  		            		  var license_num = "'" + item.license_num + "'"; 
		  	      	            		  var name = "'" + item.name + "'";
		  	      	            		  var phone = "'" + item.phone + "'";
		  	      	            		  var email = "'" + item.email + "'";
		  	      	            		  var homepage = "'" + item.homepage + "'";
		  	      	            		  var postal_num = "'" + item.postal_num + "'";
		  	      	            		  var address = "'" + item.address + "'";
		  	      	            		  var address_detail = "'" + item.address_detail + "'";
		  	      	            		  var term = "'" + item.term + "'";
		  	      	            		  var accept_date= "'" +item.accept_date + "'";
		  	      	            		  
		  	  		            		  var output = '';

		  	  		                     
		  	  		                      output += '<tr>';

		  	  		                      output += '<td>' +item.name +'</td>';
		  	  		                      output += '<td>' + '<input type="hidden" value='+ item.license_num +'><span>'+item.license_num+'</span></td>';
		  	  		                      output += '<td>' + '<input type="hidden" value='+ item.homepage +'><span>'+item.homepage+'</span></td>';
		  	  		                      output += '<td>' + '<input type="hidden" value='+ item.phone +'><span>'+item.phone+'</span></td>';
		  	  		                     
		  	  		                  var date = new Date(item.accept_date);
		    	                     	date = date_to_str(date, item.term);
		  	  		  			         output += '<td>' + '<input type="hidden" value='+ date +'><span>'+ date +'</span></td>';
		  	  		   	                
		  	  		   	               
		  	  		                      output += '<td><button type="button" class="btn btn-sm cpndetail" onclick="detail1('+item.license_num+', '+name+','+phone+','+email+','+homepage+','+phone+','+item.postal_num+','+address+','+address_detail+','+term+', '+accept_date+');">정보</button>&nbsp;<button type="button" class="btn btn-sm cpsave" style="display:none;">저장<button type="button" class="btn btn-sm btnmodify">수정</button>&nbsp;<button type="button" class="btn btn-sm btnDel1"onclick="del(' + name + ');">삭제</button></td>';
		  	  		                      
		  	  		                      output += '</tr>';
		  	  		               
		  	  		             
		  	  		            	}
		  	  		            	
		  	  		               console.log("output:"+output);
		  	  		               $('#output1').append(output);
		  	  		            });
		  	  		         },
		  	  		         error:function(){
		  	  		            alert("ajax통신 실패 !!!");
		  	  		            check2 = false;
		  	  		         }

		  	  		      });
		  	      	 	if(check2 == true) {
		  	      			$('#foo-table2').DataTable({
		  	      				language: lang_kor
		  	      			});
		  	      		}	
		  	      	
		  	            } else{
		  	                alert("거절 실패.");
		  	            }
		  	      },
			         error : function(){
			            alert("ajax통신 실패 !!!");
			      }
	  	 	});
		 }
	  
	   }
   
   function add(param_name) {
	      var input = confirm("수락 하시겠습니까?");
	 	 if(input){
	      
	     
	      $.ajax({

	         url : '/bit_project/companyadd.se',   
	         type : "post",
	         dataType : "json",
	         data : {
	            name : param_name,
	            state : state_param
	         },
	         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	         success : function(retVal){
	            if (retVal.res == "OK") {
	               alert("어린이집 수락 완료.");
	               $.ajax({
	                 	 
	                   url : '/bit_project/kindergarten_admin.se',
	                   type : "post",
	                   dataType : "json",
	                   contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	                   async: false,
	                   success:function(data){
	                  	 
	                  	 $('#output').empty();
	                       $.each(data, function(index, item){   //각각의 데이터는 item에 저장됨. index는 parameter값 item은 실제 저장된 값.
	                        if(item.state == null) {
	                          var name = "'" + item.name + "'"; 
	                          var output = '';
	                          output += '<tr>';
	                          output += '<td>' + item.name + '</td>';
	                          output += '<td>' + item.phone + '</td>';
	                          output += '<td>' + item.term +"개월"+ '</td>';
	                           
	                          output += '<td><button type="button" class="btn btn-sm btnadd" onclick="add(' + name + ');">수락</button>&nbsp;<button type="button" class="btn btn-sm btnDel"onclick="del(' + name + ');">거절</button></td>';
	                          
	                          output += '</tr>';
	                          
	                        }
	                     
	                          console.log("output:"+output);
	                          $('#output').append(output);
	                       });
	                       
	                     },
	                    error:function(){
	                       alert("ajax통신 실패 !!!");
	                       check = false;
	                    }

	                 });
	           	 if(check == true) {
	          			$('#foo-table').DataTable({
	          				language: lang_kor
	          			});
	          		}	
	           	
	            } else { // 실패했다면
	               alert("어린이집 수락 실패.");
	            }
	         },
	         error : function(){
	            alert("ajax통신 실패 !!!");
	         }

	      });
	 	 }
	 	 location.href="";
	 	}
	   
   
   function date_to_str(format, term)
   {
       var year = format.getFullYear(); 
       var month = format.getMonth() + 1;
       if(month<10) month = '0' + month;
       var date = format.getDate();
       if(date<10) date = '0' + date;
       var hour = format.getHours();
       if(hour<10) hour = '0' + hour;
       
       var month2 = Number(month); 
       var term2 = Number(term); 
       
       return year + "-" + month + "-" + date + " ~ "+ year + "-" + (month2+term2) + "-" + date ;
       
       
   }
   
   
	   function del(param_name) {
	  	  	 var input = confirm("거절 하시겠습니까?");
	  		 if(input){
	  	  	
	  	  	 $.ajax({
	  	  	        url: '/bit_project/cpdelete.se',
	  	  	        type:"post",  
	  	  	        dataType : "json",
	  	  	        data : {"name" : param_name},
	  	  	        
	  	  	        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	  	  	        
	  		  	        success: function(result){	  	        	
	  		  	            if (result.res=="OK") {
	  		  	                alert("거절 완료.");
	  		  	            $.ajax({
	  		  	          	 
	  		  	            url : '/bit_project/kindergarten_admin.se',
	  		  	            type : "post",
	  		  	            dataType : "json",
	  		  	            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	  		  	            async: false,
	  		  	            success:function(data){
	  		  	           	 
	  		  	           	 $('#output').empty();
	  		  	                $.each(data, function(index, item){   //각각의 데이터는 item에 저장됨. index는 parameter값 item은 실제 저장된 값.
	  		  	                 if(item.state == null) {
	  		  	                   var name = "'" + item.name + "'"; 
	  		  	                   var output = '';
	  		  	                   output += '<tr>';
	  		  	                   output += '<td>' + item.name + '</td>';
	  		  	                   output += '<td>' + item.phone + '</td>';
	  		  	                   output += '<td>' + item.term +"개월"+ '</td>';
	  		  	                    
	  		  	                   output += '<td><button type="button" class="btn btn-sm btnadd" onclick="add(' + name + ');">수락</button>&nbsp;<button type="button" class="btn btn-sm btnDel"onclick="del(' + name + ');">거절</button></td>';
	  		  	                   
	  		  	                   output += '</tr>';
	  		  	                   
	  		  	                 }
	  		  	              
	  		  	                   console.log("output:"+output);
	  		  	                   $('#output').append(output);
	  		  	                });
	  		  	                
	  		  	              },
	  		  	             error:function(){
	  		  	                alert("ajax통신 실패 !!!");
	  		  	                check = false;
	  		  	             }

	  		  	          });
	  		  	    	 if(check == true) {
	  		  	   			$('#foo-table').DataTable({
	  		  	   				language: lang_kor
	  		  	   			});
	  		  	   		}	
	  		  	    	
	  		  	            } else{
	  		  	                alert("거절 실패.");
	  		  	            }
	  		  	      },
	  			         error : function(){
	  			            alert("ajax통신 실패 !!!");
	  			            
	  			      }
	  	     });
	  		 }
	  	   }
	
	   
	   
	   $(document).on("click",".btnmodify",function(){ 
		     $(this).parent().parent().children('td').children('input[type=hidden]').prop("type", "text");
		     alert($(this).parent().parent().children('td').children('span').html(""));
		     $(this).parent().children('.cpsave').css("display", "inline-block");
		     $(this).css("display", "none"); 
		  	 });
		  
		  	
		  	$(document).on("click",".cpsave",function(){ 
		  		
		  		 $(this).parent().parent().children('td').children('input[type=text]').prop("type", "hidden"); 
				 $(this).parent().children('.btnmodify').css("display", "inline-block");
				 $(this).css("display", "none");
				 
				

		  		var name = $(this).parent().parent().children().eq(0).text();
		  		var license_num = $(this).parent().parent().children().eq(1).children('input').val();
		  		var homepage =$(this).parent().parent().children().eq(2).children('input').val();
		  		var phone =$(this).parent().parent().children().eq(3).children('input').val();
		  		var term =$(this).parent().parent().children().eq(4).children('input').val();
		  		
		  		
		  		
		  		var save = $('.cpsave'); // 저장할 버튼을 변수에 선언	
		  		
		  		
		  			$.ajax({
		  				url: '/bit_project/cpsave.se', // 서버에 전달할 파일명
		  				dataType: 'text',
		  				type: 'post',
		  				data: {
		  					
		  					"name" :name,
		                    "license_num":license_num,
		                    "homepage":homepage,
		                    "phone":phone,
		                    "term":term 
		  				},
		  			  success : function(save){
		  	               //alert("야호");
		  	            
		  	         },
		  	         error : function(){
		  	      
		  	            alert("ajax통신 실패 !!!");
		  	         }
		  			});
		  			$(this).parent().parent().children().eq(1).children('span').html($(this).parent().parent().children().eq(1).children('input').val());
		  			$(this).parent().parent().children().eq(2).children('span').html($(this).parent().parent().children().eq(2).children('input').val());
		  			$(this).parent().parent().children().eq(3).children('span').html($(this).parent().parent().children().eq(3).children('input').val());
		  			$(this).parent().parent().children().eq(4).children('span').html($(this).parent().parent().children().eq(4).children('input').val());
		  		})
		  	
		    