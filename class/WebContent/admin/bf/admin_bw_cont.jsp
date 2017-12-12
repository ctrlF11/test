<%@page import="com.admin.model.adminVO"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gongji.css" />
<body>
<%@ include file="../../a_include/admin_header.jsp" %>
<div class="clear"></div>
<div id="facil_article">
	<div id="reserveMainTop">
		<%
			adminVO vo = (adminVO)request.getAttribute("VO");
			adminVO vop = (adminVO)request.getAttribute("VOp");
			adminVO vom = (adminVO)request.getAttribute("VOm");
			int backPage = (Integer)request.getAttribute("backPage");
			if((double)vo.getBr_no()/15>(double)backPage) {
				backPage += 1;
			}
		
		%>
	</div>
	<div id="reserveMainMiddle">
		<ul>
			<li style="width: 40%"><%= vo.getBr_title() %></li>
			<li style="width: 15%"><%= vo.getBr_writer() %></li>
			<li style="width: 15%"><%= vo.getBr_name() %></li>
			<li style="width: 25%"><%= vo.getBr_date() %></li>
		</ul>
		<ul>
			<li style="margin-left: -42px; margin-right:0px; width: 665px; height: 482px; text-align: left; padding: 10px;">
			<%= vo.getBr_content() %>
			</li>
		</ul>
	</div>
	<div id="reserveMainBottom">
		<ul style="height: 15px;">
			<li>
				<input type="button" onclick="javascript:document.location.href='admin_book_want_list.do?page=<%= backPage %>'" value="목록"
				style="float: right; margin-right: 10px;">
			</li>
		</ul>
		<ul style="text-align: left; margin-left: -20px;">
			<%
				if(String.valueOf(vop.getBr_no()) != null && vop.getBr_no() != 0) {
			%>
			<li>
				△<a href="<c:url value='/admin_bw_cont.do' />?no=<%= vop.getBr_no() %>&amp;page=<%= backPage %>" ><%= vop.getBr_title() %></a>
			</li>
			<%} %>
			<%
				if(String.valueOf(vom.getBr_no()) != null && vom.getBr_no() != 0) {
			%>
			<li>
				▽<a href="<c:url value='/admin_bw_cont.do' />?no=<%= vom.getBr_no() %>&amp;page=<%= backPage %>" ><%= vom.getBr_title() %></a>
			</li>
			<%} %>
		</ul>
		<!-- 만약에 저게 null이 아닐 경우에만 하고 아니면 보이지 말아야 함. 그건 일단 받아오는 곳에서부터 먼저 처리해야 함. -->
	</div>
</div>
	
<div class="clear"></div>	
</body>
</html>
	
	
	
	
	
