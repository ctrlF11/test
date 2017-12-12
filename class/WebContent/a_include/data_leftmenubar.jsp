<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<!-- css 외부 포함파일을 불러오는 것. css는  디자인 UI 를 작성 -->
<script src="./js/jquery.js"></script>
<!-- jQuery 자바스크립트 라이브러리 외부 파일을 읽어온다 -->
</head>
<script type="text/javascript">
function search_go() {
	
	var sv = document.getElementById("search_value").value;
	if(sv == "") {
		alert("빈 칸입니다.");
		return false;
	}
	
	return true;
	
}
</script>
<body>
	<div id="d_left_menubar">
		<ul>
			<li>
				<a href="<c:url value='admin_manage_a.do'/>">전체 검색</a>
			</li>
			<li>
				<a href="<c:url value='admin_manage_b.do'/>">도서 검색</a>
			</li>
			<li>
				<a href="<c:url value='admin_manage_p.do'/>">간행물 검색</a>
			</li>
			<li>
				<a href="<c:url value='admin_manage_e.do'/>">전자도서 검색</a>
			</li>
		</ul>
		<form method="post" action="admin_manage_s.do" onsubmit="return search_go()">
			<ul>
				<li>
					도서명 : <input type="text" id="search_value" name="search_value">
					<input type="submit" value="검색">
				</li>
			</ul>
		</form>
	</div>
</body>
</html>