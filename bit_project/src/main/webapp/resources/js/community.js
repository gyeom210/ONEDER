	$("document").ready(function(){
//		$(".community_category").text(category);
		var category = $(".community_category").text(); //기본 게시판(자유게시판)
		
		$('#wrapper-dropdown').val("최신순");
		$("#search_form").val("");
		$('.community_search_result_text').empty();
		selectData(category);

		//찾기 input 엔터
		$('#search_form').keypress(function(event){
			if (event.which == 13) {
				
			var category = $(".community_category").text(); 
	        var search_Data = $("#search_form").val();
	       
	        searchData(category, search_Data);
			}
		});

	}); //document.ready     
	
	
	//태그 제거
	function removeTag( str ) {
		return str.replace(/(<([^>]+)>)/gi, "");
	}
	
	//필터
	function button_click() {
		var category = $(".community_category").text(); 
		
		selectData(category);
	}

		
        //리스트
        function selectData(category) {
//        	var category = $(".community_category").text(); 
        	var option = $("#wrapper-dropdown option:selected").val(); //필터 값 가져오기
        	var datacount = 0;
        		$.ajax({
   				 url : '/bit_project/getCM.co', 
   	             type : "post", 
   	             data : {"category" : category, "option" : option},
   	             dataType: 'json',
   	             async: false,
   	             success : function(data){  //성공
   	            		$('#community_data').empty();
   	            		$('#community_data_d').empty();
   	                $('.community_category').text(category); //게시판이름 바꾸기
   	                 	datacount = data.length; //게시글 총 개수
   						if(data.length != 0) { //게시글 존재
   	 					 	$.each(data, function(index, item) {
   	 					 	var output = ' ';
   							
   							var reg_date = new Date(item.regist); 
   			                var date = date_format(reg_date);  //날짜 format
			        			                		
   			                if (item.category != "육아사진게시판") { //글게시판
       							output += '<div id="community_container_mt" class="community_container_mt">';
       							output += '<div class="underline"></div>';
       							output += '<div class="community_mt_title">';
       							output += '<a class="community_mt_link" href="community_detail.co?board_num=' + item.board_num  + '">';
       							
       							if(item.img != "null") {
       							output += '<div class="community_mt_img">';
       							output += '<img src="' + item.img + '" class="com_img1">';
       							output += '</div>';
       							}else {
   								output += '<div class="community_mt_img">';
       							output += '</div>';
       							}
       							
       							output += '<h2 class="community_name">' + item.board_name + '</h2>';
       							output += '<p class="community_mt_mt">' + removeTag(item.content) + '</p>';
       							output += '<footer class="community_mt_footer">';
       							output += '<a class="community_mt_footer_user" href="community_user.co?nickname=' + item.nickname + '">';
       							output += '<img src="' + item.profile + '">';
       							output += '<span class="community_mt_footer_users">' +  item.nickname + '</span>';
       							output += '</a>';
       							output += '<span class="community_mt_footer_caption">';
       							output += '<span class="community_mt_footer_time">' + date + '</span>';
       							output += '<span class="community_mt_footer_comments">' + "댓글 " + (item.co_count+item.an_count) + ' </span>';
       							output += '<span class="community_mt_footer_views">' + "조회수 " + item.count + ' </span>';
       							output += '</span>';
       							output += '</footer>';
       							output += '</a>';
       							output += '</div>';
       							output += '</div>';
       							
       							$('#community_data').append(output);
       							
   			                }else { //사진게시판
	                				output += '<div id="community_container_mi">';
       							output += '<div class="community_mi_title">';
       							output += '<a class="community_mi_link" href="community_detail.co?board_num=' + item.board_num  + ' "></a>';
       							output += '<div class="community_mi_img">';
       							output += '<img src="' + item.img + '" class="com_img2">';
       							output += '</div>';
       							output += '<h2 class="community_name">' + item.board_name + '</h2>';
       							output += '<address class="community_mi_writer">';
       							output += '<a class="community_mi_writer_user" href="community_user.co?nickname=' + item.nickname + '">'; //글쓴이 ?? 검색
       							output += '<img src="' + item.profile + '">';
       							output += '<span class="community_mt_footer_users">' + item.nickname + ' </span>';
       							output += '</a>';
       							output += '</address>';
       							output += '<footer class="community_mi_footer">';
       							output += '<span class="community_mi_footer_caption">';
       							output += '<span class="community_mi_footer_time">' + date  + ' </span>';
       							output += '<span class="community_mi_footer_comments">' + "댓글 " + (item.co_count+item.an_count) + ' </span>';
       							output += '<span class="community_mi_footer_views">' + "조회수 " + item.count + ' </span>';
       							output += '</span>';
       							output += '</footer>';
       							output += '</div>';
	                				output += '</div>';
	                				
	                				$('#community_data_d').append(output);
   			                }
   			                
   						}); //each
   						}
   						
   						else { //게시글 존재하지않을때
   							if(category != "육아사진게시판") { //글게시판
   								var outputnull = "<div class='community_ncontainer' >";
   	   							outputnull += "<div>등록된 게시글이 없습니다.</div>";
   	   							outputnull += "</div>";
   	   							$('#community_data').append(outputnull);
   							}else { //사진게시판
   								var outputnull = "<div class='community_ncontainer' >";
   	   							outputnull += "<div>등록된 게시글이 없습니다.</div>";
   	   							outputnull += "</div>";
   	   							$('#community_data_d').append(outputnull);
   							}
   						}
   						if(category != "육아사진게시판"){
	            			page(datacount);
	            		}
	            		else{
	            			page1(datacount);
	            		}
   					},
   	              error : function(data){
   	            	 alert('error');
   	              }//error
   			}); //ajax
   			
	}
        
      //검색
        function searchData(category, search_Data) {
        	var category = $(".community_category").text(); //카테고리
//			var search_Data = $("#search_form").val('');
			var datacount = 0;
	        $.ajax({
	            url : '/bit_project/getCMsearch.co', 
   	            type : "post", 
   	            data : {"search_Data" : search_Data, "category" : category},
   	            dataType: 'json',
   	            async: false,
   	        	cache : false,
	            success : function(data) {
	            		$('#community_data').empty();
	            		$('#community_data_d').empty();
	            		datacount = data.length; //검색 총 데이터 개수
	            		if(data.length != 0) { //게시글 존재
	 					 $.each(data, function(index, item) {
	 						 
	 						$('.community_search_result_text').text("검색 결과 " + item.cmsearch_count + " 건"); //검색 결과 안내
	 						 
	 						var output = ' ';
							var reg_date = new Date(item.regist); 
			                var date = date_format(reg_date);  //날짜 format
			                
			                if (item.category != "육아사진게시판") { //글게시판
			                	
   							output += '<div id="community_container_mt">';
   							output += '<div class="underline"></div>';
   							output += '<div class="community_mt_title">';
   							output += '<a class="community_mt_link" href="community_detail.co?board_num=' + item.board_num  + ' ">';
   							
   							if(item.img != "null") {
       							output += '<div class="community_mt_img">';
       							output += '<img src="' + item.img + '" class="com_img1">';
       							output += '</div>';
       						}else {
   								output += '<div class="community_mt_img">';
       							output += '</div>';
       						}
   							
   							output += '<h2 class="community_name">' + item.board_name + '</h2>';
   							output += '<p class="community_mt_mt">' + removeTag(item.content) + '</p>';
   							output += '<footer class="community_mt_footer">';
   							output += '<a class="community_mt_footer_user" href="community_user.co?nickname=' + item.nickname + ' ">';
   							output += '<img src="' + item.profile + '">';
   							output += '<span class="community_mt_footer_users">' +  item.nickname + ' </span>';
   							output += '</a>';
   							output += '<span class="community_mt_footer_caption">';
   							output += '<span class="community_mt_footer_time">' + date + ' </span>';
   							output += '<span class="community_mt_footer_comments">' + "댓글 " + (item.co_count+item.an_count) + ' </span>';
   							output += '<span class="community_mt_footer_views">' + "조회수 " + item.count + ' </span>';
   							output += '</span>';
   							output += '</footer>';
   							output += '</a>';
   							output += '</div><br>';
   							output += '</div>';
   							
   							$('#community_data').append(output);
			                }else { //사진게시판
			                	
			                	output += '<div id="community_container_mi">';
   							output += '<div class="community_mi_title">';
   							output += '<a class="community_mi_link" href="community_detail.co?board_num=' + item.board_num  + '"></a>';
   							output += '<div class="community_mi_img">';
   							output += '<img src="' + item.img + '" class="com_img2">';
   							output += '</div>';
   							output += '<h2 class="community_name">' + item.board_name + '</h2>';
   							output += '<address class="community_mi_writer">';
   							output += '<a class="community_mi_writer_user href="community_user.co?nickname=' + item.nickname + '">'; //글쓴이 ?? 검색
   							output += '<img src="' + item.profile + '">';
   							output += '<span class="community_mt_footer_users">' + item.nickname + ' </span>';
   							output += '</a>';
   							output += '</address>';
   							output += '<footer class="community_mi_footer">';
   							output += '<span class="community_mi_footer_caption">';
   							output += '<span class="community_mi_footer_time">' + date  + ' </span>';
   							output += '<span class="community_mi_footer_comments">' + "댓글 " + (item.co_count+item.an_count) + ' </span>';
   							output += '<span class="community_mi_footer_views">' + "조회수 " + item.count + ' </span>';
   							output += '</span>';
   							output += '</footer>';
   							output += '</div>';
                				output += '</div>';
                				
                				$('#community_data_d').append(output);
			                	}
   						}); 
			            
	 				}
	            		else {
	            			var outputnull = "<div class='community_ncontainer' >";
   							outputnull += "<div>검색 결과가 없습니다.</div>";
   							outputnull += "</div>";
   							$('#community_data').append(outputnull);
   						}
	            		// 육아사진게시판일때도 검색결과 없는 줄 추가해야함!!
	            		if(category != "육아사진게시판"){
	            			page(datacount);
	            		}
	            		else{
	            			page1(datacount);
	            		}
	            		
   					},
   	              error : function(data){
   	            		alert('검색 실패');
	            }
	        }); //ajax
		}

      
    	
		 //날짜 format
        function date_format(format) {
//        	var year = format.getFullYear();
            var year1 = format.getFullYear().toString();
            var year = year1.substr(2,4);
            var month = format.getMonth()+1;
            var hour = format.getHours();
            var min = format.getMinutes();
            
            if(month<10) {
               month = '0' + month;
            }
            var date = format.getHours();
            if(hour<10) {
               hour = '0' + hour;
            }
            var min = format.getMinutes();
            if(min<10) {
               min = '0' + min;
            }
            return year + "." + month + "." + date + " " + hour +":" + min;
         }
		 
	
    function page(datacount){ 

    	var reSortColors = function($table) {
//    		  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
//    		  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
    	 };
    			
    	 $('div.paginated').each(function() {
    	  var pagesu = 10;  //페이지 번호 갯수
    	  var currentPage = 0;
    	  var numPerPage = 5;  //목록의 수
    	  var $table = $(this);    
    	  
    	  //length로 원래 리스트의 전체길이구함
    	  var numRows = datacount;
    	  //Math.ceil를 이용하여 반올림
    	  var numPages = Math.ceil(numRows / numPerPage);
    	  //리스트가 없으면 종료
    	  if (numPages==0) return;
    	  //pager라는 클래스의 div엘리먼트 작성
    	  var $pager = $('<div align="center" id="remo"><div class="pager"></div></div>');
    	  
    	  var nowp = currentPage;
    	  var endp = nowp+5;
    	  
    	  //페이지를 클릭하면 다시 셋팅
    	  $table.bind('repaginate', function() {
    	  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
    	  
    	   $table.find('div.community_container_mt').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
    	   $("#remo").html("");
    	   
    	   if (numPages > 1) {     // 한페이지 이상이면
    	    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
    	     nowp = 0;     // 1부터 
    	     endp = pagesu;    // 10까지
    	    }else{
    	     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
    	     endp = nowp+pagesu;   // 10까지
    	     pi = 1;
    	    }
    	    
    	    if (numPages < endp) {   // 10페이지가 안되면
    	     endp = numPages;   // 마지막페이지를 갯수 만큼
    	     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
    	    }
    	    if (nowp < 1) {     // 시작이 음수 or 0 이면
    	     nowp = 0;     // 1페이지부터 시작
    	    }
    	   }else{       // 한페이지 이하이면
    	    nowp = 0;      // 한번만 페이징 생성
    	    endp = numPages;
    	   }

    	   // [처음]
    	   $('<br /><span class="page-number" onclick="window.scrollTo(0,0);">[처음]</span>').bind('click', {newPage: page},function(event) {
    	          currentPage = 0;   
    	          $table.trigger('repaginate');  
    	          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
    	      }).appendTo($pager).addClass('clickable');
    	    // [이전]
    	      $('<span class="page-number" onclick="window.scrollTo(0,0);">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
    	          if(currentPage == 0) return; 
    	          currentPage = currentPage-1;
    	    $table.trigger('repaginate'); 
    	    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
    	   }).appendTo($pager).addClass('clickable');
    	    // [1,2,3,4,5,6,7,8]
    	   for (var page = nowp ; page < endp; page++) {
    	    $('<span class="page-number" style="margin-left: 8px;" onclick="window.scrollTo(0,0);"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
    	     currentPage = event.data['newPage'];
    	     $table.trigger('repaginate');
    	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
    	     }).appendTo($pager).addClass('clickable');
    	   } 
    	    // [다음]
    	      $('<span class="page-number" onclick="window.scrollTo(0,0);">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
    	    if(currentPage == numPages-1) return;
    	        currentPage = currentPage+1;
    	    $table.trigger('repaginate'); 
    	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
    	   }).appendTo($pager).addClass('clickable');
    	    // [끝]
    	   $('<span class="page-number" onclick="window.scrollTo(0,0);">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
    	           currentPage = numPages-1;
    	           $table.trigger('repaginate');
    	           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
    	   }).appendTo($pager).addClass('clickable');
    	     
    	     $($(".page-number")[2]).addClass('active');

    	reSortColors($table);
    	  });
    	   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
    	   $pager.appendTo($table);
    	   $table.trigger('repaginate');
    	 });
    	}

    //육아사진게시판 페이징
    function page1(datacount){ 

    	var reSortColors = function($table) {
    	 };
    			
    	 $('div.paginated').each(function() {
    	  var pagesu = 10;  //페이지 번호 갯수
    	  var currentPage = 0;
    	  var numPerPage = 9;  //목록의 수
    	  var $table = $(this);    
    	  
    	  //length로 원래 리스트의 전체길이구함
    	  var numRows = datacount;
    	  //Math.ceil를 이용하여 반올림
    	  var numPages = Math.ceil(numRows / numPerPage); //10 / 9
    	  //리스트가 없으면 종료
    	  if (numPages==0) return;
    	  //pager라는 클래스의 div엘리먼트 작성
    	  var $pager = $('<div align="center" id="remo"><div class="pager"></div></div>');
    	  
    	  var nowp = currentPage; //0
    	  var endp = nowp+5; // 9
    	  
    	  //페이지를 클릭하면 다시 셋팅
    	  $table.bind('repaginate', function() {
    	  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
    	  
    	   $table.find('div#community_container_mi').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
    	   $("#remo").html("");
    	   
    	   if (numPages > 1) {     // 한페이지 이상이면
    	    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
    	     nowp = 0;     // 1부터 
    	     endp = pagesu;    // 10까지
    	    }else{
    	     nowp = currentPage -5;  // 10넘어가면 2부터 찍고
    	     endp = nowp+pagesu;   // 20까지
    	     pi = 1;
    	    }
    	    
    	    if (numPages < endp) {   // 10페이지가 안되면
    	     endp = numPages;   // 마지막페이지를 갯수 만큼
    	     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
    	    }
    	    if (nowp < 1) {     // 시작이 음수 or 0 이면
    	     nowp = 0;     // 1페이지부터 시작
    	    }
    	   }else{       // 한페이지 이하이면
    	    nowp = 0;      // 한번만 페이징 생성
    	    endp = numPages;
    	   }
    	   // [처음]
    	   $('<br /><span class="page-number" onclick="window.scrollTo(0,0);">[처음]</span>').bind('click', {newPage: page},function(event) {
    	          currentPage = 0;   
    	          $table.trigger('repaginate');  
    	          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
    	      }).appendTo($pager).addClass('clickable');
    	    // [이전]
    	      $('<span class="page-number" onclick="window.scrollTo(0,0);">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
    	          if(currentPage == 0) return; 
    	          currentPage = currentPage-1;
    	    $table.trigger('repaginate'); 
    	    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
    	   }).appendTo($pager).addClass('clickable');
    	    // [1,2,3,4,5,6,7,8]
    	   for (var page = nowp ; page < endp; page++) {
    	    $('<span class="page-number" style="margin-left: 8px;" onclick="window.scrollTo(0,0);"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
    	     currentPage = event.data['newPage'];
    	     $table.trigger('repaginate');
    	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
    	     }).appendTo($pager).addClass('clickable');
    	   } 
    	    // [다음]
    	      $('<span class="page-number" onclick="window.scrollTo(0,0);">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
    	    if(currentPage == numPages-1) return;
    	        currentPage = currentPage+1;
    	    $table.trigger('repaginate'); 
    	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
    	   }).appendTo($pager).addClass('clickable');
    	    // [끝]
    	   $('<span class="page-number" onclick="window.scrollTo(0,0);">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
    	           currentPage = numPages-1;
    	           $table.trigger('repaginate');
    	           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
    	   }).appendTo($pager).addClass('clickable');
    	     
    	     $($(".page-number")[2]).addClass('active');
    	     
    	reSortColors($table);
    	  });
    	   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
    	   $pager.appendTo($table);
    	   $table.trigger('repaginate');
    	 });
    	}
