<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서관 안내</title>
</head>
<body>
	<div id="main_wrap">
		<%@ include file="../include/header.jsp" %>
		<div class="clear"></div>
		<div id="lib_intro">
		<%@ include file="../include/libs_leftmenubar.jsp" %>
			<div id="lib_intro_b">
				<img alt="그림" src="" align="left" style="width: 330px; height: 400px; float: right; border: 1px solid black;">
				<ul>
					<li>
						<% String ret = (String)request.getAttribute("ret"); %>
						<%=ret %>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>