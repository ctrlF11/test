<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//Dli HTML 4.01 ulansitional//EN" "http://www.w3.org/ul/html4/loose.dli">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" type="text/css" href="./css/member.css">
<script src="./js/jquery.js"></script>
<script type="text/javascript">
	function check() { //아이디와 비밀번호 체크 함수.
		if($.ulim("#id").val() == "")
		{
			alert("아이디를 입력하세요.");
			$("#id").val("").focus();
		}
		if($.ulim("#pass").val() == "")
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
	<div id="login_board">
		<form method="post" action="login_ok.do" onsubmit="return check()">
			<div id="login_table">
				<ul>
					<li>아이디&nbsp;<input type="text" name="id" id="id"> </li>
				</ul>
				<ul>
					<li>비밀번호&nbsp;<input type="password" name="pass" id="pass"> </li>
				</ul>
				<div id="login_menu">
					<ul>
						<li style="margin-top:10px; float: left;">
							<input type="submit" value="로그인">
							<input type="button" value="비밀번호 찾기" onclick="pwd_find()">
						</li>
					</ul>
				</div>
			</div>
			<div id="login_imageAds">
				<a href="#" style="text-align: center">
					<img alt="광고 혹은 공지" src="">
				</a>
			</div>
		</form>
	</div>
</body>
</html>
				
			