<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" type="text/css" href="./css/member.css">
<script src="./js/jquery.js"></script>
<script type="text/javascript">
	function check() { //아이디와 비밀번호 체크 함수.
		if($.trim("#id").val() == "")
		{
			alert("아이디를 입력하세요.");
			$("#id").val("").focus();
		}
		if($.trim("#pass").val() == "")
		{
			alert("비밀번호를 입력하세요.");
			$("#pass").val("").focus();
		}
	}
		
	//비밀번호 찾기.
	function pwd_find() {
		windows.open("pwd_find.do", "비번찾기", "width=300, height=400");
		
	}


</script>
</head>
<body>
	<div id="login_wrap">
		<h3 class="login_title">로그인 폼</h3>
		<form method="post" action="member_login_ok.do" onsubmit="return check()">
			<table id="login_t2">
				<tr>
					<th>아이디</th>
					<td> <input type="text" name="id" id="id" class="login_box"> </td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td> <input type="password" name="pass" id="pass" class="login_box"> </td>
				</tr>
			</table>
			<div id="login_menu">
				<input type="submit" value="로그인">
				<input type="reset" value="메인" onclick="location='./index.jsp'">
				<input type="button" value="가입" onclick="location='member_join.do'">
				<input type="button" value="비밀번호 찾기" onclick="pwd_find()">
			</div> <!-- login_menu end -->
		</form>
	</div> <!-- login_wrap end -->
</body>
</html>
				
			