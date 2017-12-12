<%@page import="com.gongji.model.gongjiVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 신청</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bf.css" />
<script type="text/javascript">
	function write_check() {
		var form = document.f;
		var bw_t = form.gongji_title.value;
		var bw_c = form.gongji_cont.value;
	
		if(bw_t == "") {
			alert("제목을 작성해주세요.");	
			return false;
		}
		if(bw_c == "") {
			alert("글을 작성해주세요.");									
			return false;
		}
		return true;
	}
</script>
<body>
<%
	gongjiVO value = (gongjiVO)request.getAttribute("value");
%>
<%@ include file="../../a_include/admin_header.jsp" %>
<div class="clear"></div>
<div id="inq_articles">
	<%@ include file="../../a_include/gongji_leftmenubar.jsp" %>
	<form name="f" method="post" action="admin_gongji_modifyOk.do" onsubmit="return write_check(this);">
	<div id="gongji_topbar">
			<ul>
				<li style="width: 70%; float: left;">
					제목
				</li>
							
			</ul>
			<ul>
				<li style="width: 70%; float: left;">
					<input type="text" name="gongji_title" size="30" value="<%= value.getGongji_title() %>">
				</li>
			</ul>
		</div>
		<div id="gongji_board" style="height: 700px;">
			<ul style="border: none;">
				<li style="margin-left: -42px; margin-right:0px; width: 665px;
				height: 500px; text-align: left; padding: 10px; border: none;">
					<textarea rows="32" cols="80" name="gongji_cont"><%= value.getGongji_content() %></textarea>
				</li>
			</ul>
		</div>
		<div id="gongji_bottom">
			<ul style="height: 15px;">
				<li>
					<input type="hidden" value="<%= value.getGongji_no() %>" name="gongji_no">
					<input type="submit" value="확인" style="float: left;">
					<input type="button" onclick="javascript:document.location.href='admin_gongji_list.do'" value="목록"
					style="float: right; margin-right: 10px;">
				</li>
			</ul>
		</div>
	</form>
</div>
	
<div class="clear"></div>	
</body>
</html>
	
	
	
	
	
