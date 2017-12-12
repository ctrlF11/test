<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면</title>
<link rel="stylesheet" type="text/css" href="./css/libs.css" />
<!-- css 외부 포함파일을 불러오는 것. css는  디자인 UI 를 작성 -->
<script src="./js/jquery.js"></script>
<!-- jQuery 자바스크립트 라이브러리 외부 파일을 읽어온다 -->
</head>
<body>
<%
	int floor = 1;
	if(request.getParameter("floor") != null) {
		floor = 0;
	}
%>

	<div id="l_left_menubar">
		<ul>
			<li> <a href="admin_lib_intro_modify.do"> 도서관 소개 수정 </a> </li>				
			<c:if test="<%= floor == 0 %>">
				<style type="text/css">
					#intro_bar {display: inline;}
				</style>
			</c:if>
			<c:if test="<%= floor == 1 %>">
				<style type="text/css">
					#intro_bar {display: none;}
				</style>
			</c:if>
			<li>
				<a href="<c:url value='admin_1f_intro_modify.do' />?floor=0
							" target="_self" style="text-decoration: none;"> 층별 안내 수정</a>
				<ul id="intro_bar" style="margin: 0; padding: 0;">
					<li><a href="<c:url value='admin_1f_intro_modify.do' />?floor=0
							" target="_self" style="text-decoration: none;"> 1층 안내 수정 </a></li>
					<li><a href="<c:url value='admin_2f_intro_modify.do' />?floor=0
							" target="_self" style="text-decoration: none;"> 2층 안내 수정 </a></li>
					<li><a href="<c:url value='admin_3f_intro_modify.do' />?floor=0
							" target="_self" style="text-decoration: none;"> 3층 안내 수정 </a></li>
					<li><a href="<c:url value='admin_4f_intro_modify.do' />?floor=0
							" target="_self" style="text-decoration: none;"> 4층 안내 수정 </a></li>
				</ul>
			</li>				
			<li> <a href="admin_facil_intro_modify.do"> 시설 안내 </a> </li>				
			<li> <a href="admin_borrow_intro_modify.do"> 열람/대출/반납 </a> </li>
		</ul>
	</div>
</body>
</html>