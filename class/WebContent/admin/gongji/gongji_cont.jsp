<%@page import="com.gongji.model.gongjiVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gongji.css" />
<body>
<%@ include file="../../a_include/admin_header.jsp" %>
<div class="clear"></div>
<div id="inq_articles">
	<%@ include file="../../a_include/gongji_leftmenubar.jsp" %>
	<div id="gongji_topbar">
		<%
			gongjiVO vo = (gongjiVO)request.getAttribute("VO");
			gongjiVO vop = (gongjiVO)request.getAttribute("VOp");
			gongjiVO vom = (gongjiVO)request.getAttribute("VOm");
			int backPage = (Integer)request.getAttribute("backPage");
			System.out.println("vo.공지넘버 : "+(double)vo.getGongji_no()/15);
			System.out.println("if 전 backPage : "+backPage);
			if((double)vo.getGongji_no()/15>(double)backPage) {
				backPage += 1;
			}
			System.out.println("vo.공지넘버 : "+(double)vo.getGongji_no()/15);
			System.out.println("if 후 backPage : "+backPage);
		%>
		<ul style="height: 101px; margin: auto;">
			<li style="margin-top: 22px; font-size: 50px;">공지사항</li>		
		</ul>
	</div>
	<div id="gongji_board">
		<ul>
			<li style="width: 70%"><%= vo.getGongji_title() %></li>
			<li style="width: 25%"><%= vo.getGongji_date() %></li>
		</ul>
		<ul>
			<li style="margin-left: -42px; margin-right:0px; width: 665px; height: 482px; text-align: left; padding: 10px;">
			<%= vo.getGongji_content() %>
			</li>
		</ul>
	</div>
	<div id="gongji_bottom">
		<ul style="height: 15px;">
			<li>
				<input type="button" onclick="javascript:document.location.href=
				'admin_gongji_list.do?page=<%= backPage %>'" value="목록"
				style="float: right; margin-right: 10px;">
				<input type="button" onclick="javascript:document.location.href=
				'admin_gongji_modify.do?no=<%= vo.getGongji_no() %>'
				" value="수정" style="float: left; margin-left: -20px;">
			</li>
		</ul>
		<ul style="text-align: left; margin-left: -20px;">
			<%
				if(String.valueOf(vop.getGongji_no()) != null && vop.getGongji_no() != 0) {
			%>
			<li>
				△<a href="<c:url value='/admin_gongji_cont.do' />?no=<%= vop.getGongji_no() %>&amp;page=<%= backPage %>" ><%= vop.getGongji_title() %></a>
			</li>
			<%} %>
			<%
				if(String.valueOf(vom.getGongji_no()) != null && vom.getGongji_no() != 0) {
			%>
			<li>
				▽<a href="<c:url value='/admin_gongji_cont.do' />?no=<%= vom.getGongji_no() %>&amp;page=<%= backPage %>" ><%= vom.getGongji_title() %></a>
			</li>
			<%} %>
		</ul>
		<!-- 만약에 저게 null이 아닐 경우에만 하고 아니면 보이지 말아야 함. 그건 일단 받아오는 곳에서부터 먼저 처리해야 함. -->
	</div>
</div>
	
<div class="clear"></div>	
</body>
</html>
	
	
	
	
	
