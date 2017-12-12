<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>도서관 안내</title>
</head>
<body>
	<div id="main_wrap">
		<%@ include file="../include/header.jsp" %>
		<div class="clear"></div>
		<div id="lib_intro">
		<%@ include file="../include/libs_leftmenubar.jsp" %>
			<div id="lib_intro_b">
				<div id="floor_board">
					<img alt="약도" src="" align="middle" style="width: 600px; height: 400px; border: 1px solid black;">
					<% String ret = (String)request.getAttribute("ret"); %>
					<%=ret %>
				</div>
			</div>
		</div>
	</div>
</body>
</html>