<%@page import="com.inquire.model.inquireVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 페이지</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gongji.css" />
<script type="text/javascript">
	function checked() {
		var form = document.f;
		var cont = form.inquire_content.value;

	
		if(cont == "") {
			alert("글이 작성되지 않았습니다.");
			return false;
		}
		
		return true;
	}
</script>
<body>
<%
	inquireVO value = (inquireVO)request.getAttribute("value");
%>
<%@ include file="../../a_include/admin_header.jsp" %>
<div id="inq_articles">
	<%@ include file="../../a_include/gongji_leftmenubar.jsp" %>
	<div id="gongji_topbar">
		<ul style="height: 101px; margin: auto;">
			<li style="margin-top: 22px; font-size: 50px;">문의사항 답변</li>		
		</ul>
	</div>
	<form name="f" method="post" action="admin_inquire_modifyOk.do" onsubmit="return checked();">
		<div id="gongji_board">
			<ul>
				<li style="width: 65%; margin-left: -60px;" >
					제목 : <input type="text" value="<%= value.getInquire_title() + " - 답변" %>" readonly="readonly" name="inquire_title">
				</li>
				&nbsp;&nbsp;&nbsp;
				<li style="width: 30%">
					분류 : <%= value.getInquire_question() %>
				</li>
			</ul>
			<ul>
				<li style="margin-left: -42px; margin-right:0px; width: 665px; height: 482px; text-align: left; padding: 10px;">
					<textarea rows="27" cols="80" name="inquire_cont" id="inquire_cont"><%= value.getInquire_content() %></textarea>
				</li>
			</ul>
		</div>
		<div id="gongji_bottom">
			<ul style="height: 15px;">
				<li>
					<input type="hidden" value="<%= value.getInquire_no() %>" name="inquire_no">
					<input type="button" onclick="javascript:document.location.href='admin_inquire.do'" value="목록"
					style="float: right; margin-right: 10px;">
				</li>
				<li>
					<input type="submit" value="답변" style="float: left; margin-left: -28px;">
				</li>
			</ul>
		</div>
	</form>
</div>
</body>
</html>
	
	
	
	
	
