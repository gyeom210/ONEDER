	$("document").ready(function(){
//		$(".community_category").text(category);
		var category = $(".community_category").text(); //기본 게시판(자유게시판)
		var pageCount = 5; //한 화면에 나타낼 페이지 수
		var currentPage = 1; //현재 페이지
		var totalData = 0; //총 데이터 수
		var dataPerPage = 5; 
		
		$('#wrapper-dropdown').val("최신순");
		$("#search_form").val("");
		$('.community_search_result_text').empty();
		selectData(category, dataPerPage, pageCount, currentPage);

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
		var currentPage = 1;
		
		selectData(category, currentPage);
	}

		
        //리스트
        function selectData(category, dataPerPage, pageCount, currentPage) {
        	var category = $(".community_category").text(); 
        	var option = $("#wrapper-dropdown option:selected").val(); //필터 값 가져오기
        	var datacount = 0;
        	var pageCount = 5; //한 화면에 나타낼 페이지 수
			
			if(category != "육아사진게시판")
				dataPerPage = 5;
			else
				dataPerPage = 9;
			
        		$.ajax({
   				 url : '/bit_project/getCM.co', 
   	             type : "post", 
   	             data : {"category" : category, "option" : option, "page" : currentPage},
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
       							output += '<div id="community_container_mt">';
       							output += '<div class="underline"></div>';
       							output += '<div class="community_mt_title">';
       							output += '<a class="community_mt_link" href="community_detail.co?board_num=' + item.board_num  + '"></a>';
       							
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
       							output += '<a class="community_mi_writer_user" href="community_user.co?nickname=' + item.nickname + '">'; 
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
   			             totalData = item.cm_count;
   						}); //each
			             paging(totalData, dataPerPage, pageCount, currentPage); //페이징
   						}else { //게시글 존재하지않을때
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
   					},
   	              error : function(data){
   	            	 alert('community list error');
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
   							output += '<a class="community_mi_writer_user href="community_user.co?nickname=' + item.nickname + '">'; 
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
	 					paging_search(totalData, dataPerPage, pageCount, currentPage); //검색 페이징
	 				}
	            		else {
	            			if(category != "육아사진게시판"){
	            				var outputnull = "<div class='community_ncontainer' >";
   							outputnull += "<div>검색 결과가 없습니다.</div>";
   							outputnull += "</div>";
   							$('#community_data').append(outputnull);
	            			}else{
	            				var outputnull = "<div class='community_ncontainer' >";
   							outputnull += "<div>검색 결과가 없습니다.</div>";
   							outputnull += "</div>";
   							$('#community_data_d').append(outputnull);
	            			}
   					}
	            		
   					},
   	              error : function(data){
   	            		alert('community search error');
	            }
	        }); //ajax
		}

      
    	
		 //날짜 format
        function date_format(format) {
        	var year = format.getFullYear();
            var month = format.getMonth()+1;
            var date = format.getDate();
            var hour = format.getHours();
            
            if(month<10) {
            	month = '0' + month;
            }
            var min = format.getMinutes();
            if(min<10) {
               min = '0' + min;
            }
            return year + "." + month + "." + date + " " + hour +":" + min;
         }
		 
	

        /**********************************************************************************************************
         ** 페이징 **
       **********************************************************************************************************/
        function paging(totalData, dataPerPage, pageCount, currentPage) {
        	/* $(".paginate").empty();  */
            var totalPageDevide = totalData / dataPerPage;
            var pageGroupDevide = currentPage / pageCount;

            var totalPage = Math.ceil(totalPageDevide);    // 총 페이지 수 1
            var pageGroup = Math.ceil(pageGroupDevide);    // 페이지 그룹 0
            
            var last = pageGroup * pageCount; //0

            if (last > totalPage) // 0 > 1
                last = totalPage;
            
            var first = last - (pageCount - 1); // 0 - (5 - 1)
            
            if (first <= 0) {
                first = 1; //
            }
            var next = last + 1; // 다음 1
            var prev = first - 1; // 이전 0
            var one = 1; // 맨 처음 
            var lastNo = totalPage; // 맨 끝 1

            var html = "";

            if (prev > 0) {
                html += "<a href=# id='one'>&lt;&lt;&nbsp;&nbsp;</a> ";
                html += "<a href=# id='prev'>&lt;&nbsp;&nbsp;</a> ";

            }
            
            for (var i = first; i <= last; i++) {
                //html += "<a href='#' id=" + i + ">" + i + "</a> ";
                html += "<a href='javascript:selectData(totalData, dataPerPage, pagecount, " + i + ")' id=" + i + ">" + i + "</a> ";
                //html += "<a href='javascript:snsData(0, 6, 10, " + i + ")' id=" + i + ">" + i + "</a> ";
            }

            if(totalPage==0){
            }else {
            	  if (last < totalPage) // 0 < 1
            	        html += "<a href=# id='next'>&gt;&nbsp;&nbsp;</a>";
            	        html += "<a href='javascript:void(0);' id='lastNo'>&gt;&gt;&nbsp;&nbsp;</a> ";

            	        $(".paginate").html(html);    // 페이지 목록 생성
            	        $(".paginate a").removeClass("page_on");

            	        $(".paginate a#" + currentPage).addClass("page_on"); // 현재 페이지 표시	
            }
          

            $(".paginate a").click(function () {
                var $item = $(this);
                var $id = $item.attr("id");
                var selectedPage = $item.text(); // 번호 클릭.

                if ($id == "one") selectedPage = one;
                if ($id == "prev") selectedPage = prev;
                if ($id == "next") selectedPage = next;
                if ($id == "lastNo") selectedPage = lastNo;
                
                selectData(totalData, dataPerPage, pageCount, selectedPage);
                paging(totalData, dataPerPage, pageCount, selectedPage);// 페이징
            });
            
        }
             
	
        
      /**********************************************************************************************************
      ** 검색 페이징 **
      **********************************************************************************************************/
        function paging_search(totalData, dataPerPage, pageCount, currentPage) {
        	alert('검색 출력할 totaldata : '+totalData); //333333
        	/* $(".paginate").empty();  */
            var totalPageDevide = totalData / dataPerPage;
            var pageGroupDevide = currentPage / pageCount;

            var totalPage = Math.ceil(totalPageDevide);    // 총 페이지 수 1
            var pageGroup = Math.ceil(pageGroupDevide);    // 페이지 그룹 0
            
            var last = pageGroup * pageCount; //0

            if (last > totalPage) // 0 > 1
                last = totalPage;
            
            var first = last - (pageCount - 1); // 0 - (5 - 1)
            
            if (first <= 0) {
                first = 1; //
            }
            var next = last + 1; // 다음 1
            var prev = first - 1; // 이전 0
            var one = 1; // 맨 처음 
            var lastNo = totalPage; // 맨 끝 1

            var html = "";

            if (prev > 0) {
                html += "<a href=# id='one'>&lt;&lt;&nbsp;&nbsp;</a> ";
                html += "<a href=# id='prev'>&lt;&nbsp;&nbsp;</a> ";

            }
            
            for (var i = first; i <= last; i++) {
            	alert("페이징 만드는중");
                html += "<a href='javascript:searchData(totalData, dataPerPage, pagecount, " + i + ")' id=" + i + ">" + i + "</a> ";
                
            }

            if(totalPage==0){
            	
            }else {
            	  if (last < totalPage) // 0 < 1
            	        html += "<a href=# id='next'>&gt;&nbsp;&nbsp;</a>";
            	        html += "<a href='javascript:void(0);' id='lastNo'>&gt;&gt;&nbsp;&nbsp;</a> ";

            	        $(".paginate").html(html);    // 페이지 목록 생성
            	        $(".paginate a").removeClass("page_on");

            	        $(".paginate a#" + currentPage).addClass("page_on"); // 현재 페이지 표시	
            }
          

            $(".paginate a").click(function () {
                var $item = $(this);
                var $id = $item.attr("id");
                var selectedPage = $item.text(); // 번호 클릭.

                if ($id == "one") selectedPage = one;
                if ($id == "prev") selectedPage = prev;
                if ($id == "next") selectedPage = next;
                if ($id == "lastNo") selectedPage = lastNo;
                
                alert(selectedPage + "이동 ???");
                searchData(totalData, dataPerPage, pageCount, selectedPage);
                paging_search(totalData, dataPerPage, pageCount, selectedPage);// 페이징
                	
            });
            
        }