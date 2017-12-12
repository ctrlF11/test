<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 로그인된 사용자의 세션정보를 만료시킴.
	session.invalidate(); // 모든 세션 속성을 만료시킴.

%>
<script>
	alert("로그아웃 되었습니다.");
	location.replace('main.do');
</script>