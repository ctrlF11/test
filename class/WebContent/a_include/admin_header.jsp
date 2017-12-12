<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면</title>
<link rel="stylesheet" type="text/css" href="./css/main.css" />
<link rel="stylesheet" type="text/css" href="./css/menu.css" />
<link rel="stylesheet" type="text/css" href="./css/member.css" />
<link rel="stylesheet" type="text/css" href="./css/gongji.css" />
<link rel="stylesheet" type="text/css" href="./css/inquire.css" />
<link rel="stylesheet" type="text/css" href="./css/faq.css" />
<link rel="stylesheet" type="text/css" href="./css/bf.css" />
<link rel="stylesheet" type="text/css" href="./css/libs.css" />
<link rel="stylesheet" type="text/css" href="./css/book.css" />
<script src="./js/jquery.js"></script>
<!-- jQuery 자바스크립트 라이브러리 외부 파일을 읽어온다 -->
<script src="./js/board.js"></script>
<script src="./js/bbs.js"></script>
<script src="./js/gongji.js"></script>
<script src="./js/admin.js"></script>
</head>

<body>	
	<div id="main_wrap">
		<div id="header">
			<div id="headwrap">
				<div class="logo">
					<img alt="메인 화면으로" src="" onclick="javascript:document.location.href='admin_main.do'">
				</div>
				
				<div class="toplinkbar">
					<ul>
						<li>
						<%
							String uid = (String)session.getAttribute("id");
							String sstate = null;
							int state = 5;
							if(String.valueOf(session.getAttribute("id_state")) != "null") {
								sstate = String.valueOf(session.getAttribute("id_state"));
								state = Integer.parseInt(sstate);
							}
							if(uid == null) { // 로그인 되어있지 않을 경우.
						%>
							<a href="login.do"> 로그인 </a>
						<%	} else { %>
							<a href="logout.do"> 로그아웃 </a>
						<% } %>
						</li>
						<li>
							<img src="images/bar.png">
						</li>
						<li>
							<a href="member_join.do"> 회원가입 </a>
						</li>
					</ul>
					
				</div>
			</div>
			<div class="menubar">
				<ul class="menu">
					<li>
						<a href="admin_manage_a.do"> 자료 관리 </a>						
					</li>
					<li> <a href="#"> 안내 항목 수정 </a>
						<ul class="sub02">
							<li> <a href="admin_lib_intro_modify.do"> 도서관 소개 </a> </li>				
							<li><a href="<c:url value='admin_1f_intro_modify.do' />?floor=0
							" target="_self" style="text-decoration: none;"> 층별 안내 </a></li>				
							<li> <a href="admin_facil_intro_modify.do"> 시설 안내 </a> </li>				
							<li> <a href="admin_borrow_intro_modify.do"> 열람/대출/반납 </a> </li>				
						</ul>
					</li>
					<li> <a href="#"> 도서 신청/좌석 예약 현황 </a>
						<ul class="sub03">
							<li> <a href="admin_book_want_list.do"> 희망도서 신청 현황 </a> </li>				
							<li> <a href="admin_facil_reserve_list.do"> 좌석 예약 현황 </a> </li>				
						</ul>
					</li>
					<li> <a href="#">문의사항 종합</a>
						<ul class="sub04">
							<li> <a href="admin_gongji_list.do"> 공지사항 작성 </a> </li>				
							<li> <a href="admin_faq.do"> FAQ 작성/수정 </a> </li>				
							<li> <a href="admin_inquire.do"> 문의 확인 </a> </li>				
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>