## 팀 프로젝트
> ⁃ 제   목 : 어린이 장난감 구독 사이트 <br>
> ⁃ 기   간 : 2020.01.01 ~ 2020.02.27 <br>
> ⁃ 참여인원 : 6명 <br>

<br>

## 제작기간 
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
* 회원가입 시 구글 SMTP를 이용한 인증, 도로명주소 API 연결
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

### 게시판
✔︎ [community.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/community.jsp) <br>
⁃ 글 게시판 / 사진 게시판 두가지의 레이아웃 <br>
⁃ ajax 기술하여 페이징 <br>
⁃ 필터 기능과 검색 기능 구현 <br>
⁃ 글 작성 시 session 존재 여부 확인 후 없을 시 로그인 페이지로 이동 <br>

✔︎ [community_detail.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/community_detail.jsp) <br>
⁃ 게시글 상세보기 <br>
⁃ 카카오, 라인, 네이버 API를 사용해 스크랩 기술 <br>
⁃ 댓글 ajax <br>
⁃ 댓글 날짜 형식 포맷 변경. 같은 날 작성 시 시간별로 표시. <br>
⁃ 회원 그룹(일반회원, 비매너회원)에 따라 작성할 수 있는 범위 제한 <br>

✔︎ [community_user.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/community_user.jsp) <br>
⁃ 같은 email을 가진 사용자의 작성 글 모아보기 <br>

✔︎ [community_writeForm.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/community_writeForm.jsp) / [community_updateForm.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/community_updateForm.jsp) <br><br>
⁃ summernote 에디터 <br>
⁃ 사진 게시판은 한개 이상의 사진 게시해야 글 작성 가능 <br>
⁃ 게시글 수정 시 카테고리는 변경 불가능 <br>

### 회원가입 및 회원수정
✔︎ [signup.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/signup.jsp) 
/ [mypage_update.jsp](https://github.com/gyeom210/ONEDER/blob/master/bit_project/src/main/webapp/WEB-INF/views/mypage/mypage_update.jsp) <br>
⁃ 프로필 이미지 drag & drop 기술 . 여러개의 사진 올릴시 경고창 띄움 <br>
  
<br>
