## 팀 프로젝트
> ⁃ 제   목 : 어린이 장난감 구독 사이트 <br>
> ⁃ 기   간 : 2020.01.01 ~ 2020.02.27 <br>
> ⁃ 참여인원 : 6명 <br>

<br>

## 제작기간(2020.01.01 ~ 2020.02.27)
> ⁃ 1주차 ~ 2주차 : 분석 및 기획 <br>
> ⁃ 2주차 ~ 3주차 : DB 설계 및 모델링 <br>
> ⁃ 3주차 ~ 5주차 : 프로젝트 전반적인 UI 구현 <br>
> ⁃ 5주차 ~ 9주차 : 기능 구현 및 통합 테스트 <br>
> ⁃ 9주차 ~ 10주차 : 오류테스트 및 마무리 작업 <br>

<br>

## 사용기술
> ⁃ Front-End : Javascript, HTML5, CSS3, JQuery, Ajax, JSP, BootStrap <br>
> ⁃ Back-End : Java, MyBatis, Oracle, Spring Tool Suite <br>
> ⁃ Open API : Chart.js, Kakao Developers, NAVER Developers, import, JavaMail, SummerNote Editor <br>
> ⁃ Tool : Apache Tomcat 9, Apache Commons, Amazon (RDS, EC2), Eclipse, Git, Github, SourceTree, Slack <br>

<br>
 
## 내용
* 회원가입 시 구글 SMTP를 이용한 인증, Daum 우편번호 API 연결
* 카카오/네이버 API를 이용한 간편 로그인
* 카카오맵 API를 이용한 위치소개
* Import를 이용한 카카오페이 정기결제 예약/취소
* 상품 리스트 무한스크롤
* 상품 리스트 필터를 이용한 여러가지 조건 적용
* 상품 위시리스트/예약/알람
* 상품 상세페이지 문의 및 리뷰
* 캘린더를 이용한 배송/반납일정
* 관리자와의 1:1 채팅
* 커뮤니티 게시판 및 댓글
* 마이페이지 구독정보, 포인트, 활동내역, 회원정보 수정/탈퇴, 개인쉐어
* 관리자 페이지 차트, 회원관리, 결제관리, 개인쉐어상품 수락/거절, 상품 반납처리

<br>

## 역할 및 페이지 구성
### 메인화면
<img width="1440" alt="ONEDER_main" src="https://user-images.githubusercontent.com/57176747/78133563-98a3bb80-7459-11ea-87bb-4b4deaee77d0.png"> <br>

### 게시판
✔︎ [community.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/community.jsp) <br>
![커뮤니티게시판](https://user-images.githubusercontent.com/57176747/78256731-e42a9800-7533-11ea-9dbf-e678bd89f0fe.jpg) <br>
⁃ 글 게시판 / 사진 게시판 두가지의 레이아웃 <br>
⁃ ajax 기술하여 페이징 <br>
⁃ 필터 기능과 검색 기능 구현 <br>
⁃ 글 작성 버튼 클릭시 session 존재 여부 확인 후 없으면 로그인 페이지로 이동 <br>

✔︎ [community_detail.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/community_detail.jsp) <br>
![커뮤니티디테일](https://user-images.githubusercontent.com/57176747/78662309-2163a100-790b-11ea-8962-77d9d0914332.jpg) <br>
⁃ 게시글 상세보기 <br>
⁃ 카카오, 라인, 네이버 API를 사용해 스크랩 기술 <br>
⁃ 댓글 ajax CRUD <br>
⁃ 댓글 더보기 페이징 <br>
⁃ 댓글 날짜 형식 포맷 변경. 당일 댓글 작성 시 시간별로 표시. <br>
⁃ 회원 그룹(일반회원, 비매너회원)에 따라 작성할 수 있는 범위 제한 <br>

✔︎ [community_user.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/community_user.jsp) <br>
![커뮤니티사용자](https://user-images.githubusercontent.com/57176747/78663379-f1b59880-790c-11ea-85a7-02e6ed28a1da.jpg) <br>
⁃ 사용자(같은 email)의 작성 글 모아보기 <br>
⁃ 무한 스크롤 => 구현중 <br>

✔︎ [community_writeForm.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/community_writeForm.jsp) / [community_updateForm.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/community_updateForm.jsp) <br>
![커뮤니티글작성](https://user-images.githubusercontent.com/57176747/78654461-7d282d00-78ff-11ea-9ef6-de051b1f2fc2.jpg) <br>
⁃ summernote 에디터 <br>
⁃ 사진 게시판은 한개 이상의 사진 게시해야 글 작성 가능 <br>
⁃ 게시글 수정 시 카테고리는 변경 불가능 <br>

### 회원가입 및 회원수정
✔︎ [signup.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/signup.jsp) 
/ [mypage_update.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/mypage/mypage_update.jsp) <br>
⁃ 프로필 이미지 drag & drop 기술 . 여러개의 사진 올릴시 경고창 띄움 <br>
⁃ Daum 우편번호 API 사용 <br>

#### ☛ 파일 업로드 방식
![ezgif com-video-to-gif-3](https://user-images.githubusercontent.com/57176747/78970564-8c4bec80-7b44-11ea-82c2-f862d8529a21.gif) <br>
#### ☛ drag & drop 방식
![ezgif com-video-to-gif-4](https://user-images.githubusercontent.com/57176747/78970565-8d7d1980-7b44-11ea-8031-dd164a6b7c1e.gif) <br>

<br>
<br>
[이미지 drag & drop /member.js](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/resources/js/member.js)
<pre>
<code>
 /* 프로필  */
   $(function () {
        $('.profilePreview')
        .on("dragover", dragOver)
        .on("dragleave", dragOver)
        .on("drop", uploadFiles);
        
        $('.browser').hide()
        $('.preview').children().show()

        function isDataURL(s) {
            return !!s.match(isDataURL.regex);
        }
        isDataURL.regex = /^\s*data:([a-z]+\/[a-z]+(;[a-z\-]+\=[a-z\-]+)?)?(;base64)?,[a-z0-9\!\$\&\'\,\(\)\*\+\,\;\=\-\.\_\~\:\@\/\?\%\s]*\s*$/i;
        
        function dragOver(e) {
            e.stopPropagation();
            e.preventDefault();
        }
        
        //file 업로드
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                var preview = $(input).data('preview');
                var _invalid = $(input).parent().parent().find('.invalid-file')

                reader.onload = function(e) {
                    if( isDataURL(e.target.result) )    {
                        _invalid.hide()
                        $('#' + preview).css('background-image', 'url('+e.target.result +')');
                        $('#' + preview).hide();
                        $('#' + preview).fadeIn(650);
                    }
                } //reader.onload
                reader.readAsDataURL(input.files[0]);
                
            } //if
        } //function readURL

        //drag 업로드
        function uploadFiles(e) {
            e.stopPropagation();
            e.preventDefault()
            dragOver(e);
         
           e.dataTransfer = e.originalEvent.dataTransfer;
          var files = e.target.files || e.dataTransfer.files;
          if (files.length > 1) {
              alert('이미지는 한개만 가능합니다');
              return;
          }

            var reader = new FileReader();
            var preview = $(this).data('preview');
            var _invalid = $(this).parent().parent().find('.invalid-file')

            reader.onload = function(e) {
                if( isDataURL(e.target.result) )    {
                    _invalid.hide()
                    $('#' + preview).css('background-image', 'url('+e.target.result +')');
                    $('#' + preview).hide();
                    $('#' + preview).fadeIn(650);
                }
            } //reader.onload
            reader.readAsDataURL(files[0]);
            $("input[type='file']")
            .prop("files", e.originalEvent.dataTransfer.files); //드래그드롭으로 올리는 이미지 input에 넣기
        } //function uploadFiles
        
        //파일 올리기로 올렸을때
        $('.imageUpload').bind('change', function(e) {
            e.preventDefault()
            readURL(this)
        });
    }); //function
</code>
</pre>

[이미지 drag & drop /MemberController.java](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/java/com/spring/member/MemberController.java)
<pre>
<code>
		try {
			 /* default image */
		     if(mf.isEmpty()) {
		    	   membervo.setImg("/bit_project/image/0c57c52f289644ceb799d673566eed91.png"); 
		     } else {
		    	String uploadPath = "/Users/nagyeom/upload/";
		        String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
		        String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		        if (mf.getSize() != 0) {
		        	mf.transferTo(new File(uploadPath + storedFileName));
		        	membervo.setImg("/bit_project/image/" + storedFileName);
		        }  
		     }
</code>
</pre>  
