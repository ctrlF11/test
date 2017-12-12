<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서관 안내 수정</title>
</head>
<%
	String idS = (String)session.getAttribute("id");
%>
<script type="text/javascript">	
	function session_check() {
		var check = <%= idS %>;
		var state = <%= session.getAttribute("id_state") %>;
		if(check == null) {
			alert("세션이 만료되었습니다.");
			return location.replace("out_login.do");
		}
		if(state == 0) {
			alert("운영자 아이디가 아닙니다.");
			return location.replace("out_login.do");
		}
	}
</script>
<body onload="session_check()">	
	<div id="main_wrap">
		<%@ include file="../../a_include/admin_header.jsp" %>
		<div class="clear"></div>
		<div id="lib_intro">
		<%@ include file="../../a_include/libs_leftmenubar.jsp" %>
			<div id="lib_intro_b">
				<img alt="그림" src="" align="left" style="width: 330px; height: 400px; float: right; border: 1px solid black;">
				<form method="post" action="admin_lib_intro_Mok.do">
					<ul>
						<li>
							<%
								String value = (String)request.getAttribute("value");
							%>
							<textarea rows="20" cols="77" name="intro"><%= value %></textarea>
						</li>
					</ul>
					<ul>
						<li>
							<input type="submit" value="실행">
							<input type="button" value="취소" onclick="javascript:document.location.href='admin_main.do'">
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</body>
</html>