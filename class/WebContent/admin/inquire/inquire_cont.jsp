<%@page import="com.inquire.model.inquireVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int nowPage = (Integer)request.getAttribute("page");
	int block = (Integer)request.getAttribute("block");
	int start = (Integer)request.getAttribute("start");
	int end = (Integer)request.getAttribute("end");
	int startPage = (Integer)request.getAttribute("startPage");
	int endPage = (Integer)request.getAttribute("endPage");
	int rowsize = (Integer)request.getAttribute("rowsize");
	int allPage = (Integer)request.getAttribute("allPage");
	List<inquireVO> list = (List<inquireVO>)request.getAttribute("LIST");
	
//	System.out.println(list.get(0).getGongji_title());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 페이지</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gongji.css" />
<body>
<%@ include file="../../a_include/admin_header.jsp" %>
<div class="clear"></div>
<div id="inq_articles">
	<%@ include file="../../a_include/gongji_leftmenubar.jsp" %>
	<div id="gongji_topbar">
		<%
			inquireVO vo = (inquireVO)request.getAttribute("VO");
			inquireVO vop = (inquireVO)request.getAttribute("VOp");
			inquireVO vom = (inquireVO)request.getAttribute("VOm");
		%>
		<ul style="height: 101px; margin: auto;">
			<li style="margin-top: 22px; font-size: 50px;">문의사항</li>		
		</ul>
	</div>
	<div id="gongji_board">
		<ul>
			<li style="width: 70%"><%= vo.getInquire_title() %></li>
			<li style="width: 25%"><%= vo.getInquire_regdate() %></li>
		</ul>
		<ul>
			<li style="margin-left: -42px; margin-right:0px; width: 665px; height: 482px; text-align: left; padding: 10px;">
			<%= vo.getInquire_content() %>
			</li>
		</ul>
	</div>
	<div id="gongji_bottom">
		<ul style="height: 15px;">
			<li>
				<input type="button" onclick="javascript:document.location.href=
				'admin_inquire_modify.do?no=<%= vo.getInquire_no() %>'
				" value="답변" style="float: left; margin-left: -20px;">
				<input type="button" onclick="javascript:document.location.href='admin_inquire.do'" value="목록"
				style="float: right; margin-right: 10px;">
			</li>
		</ul>
		<ul style="text-align: left; margin-left: -20px;">
			<%
				if(String.valueOf(vop.getInquire_no()) != null && vop.getInquire_no() != 0) {
			%>
			<li>
				△<a href="<c:url value='/admin_inquire_cont.do' />?no=<%= vop.getInquire_no() %>" ><%= vop.getInquire_title() %></a>
			</li>
			<%} %>
			<%
				if(String.valueOf(vom.getInquire_no()) != null && vom.getInquire_no() != 0) {
			%>
			<li>
				▽<a href="<c:url value='/admin_inquire_cont.do' />?no=<%= vom.getInquire_no() %>" ><%= vom.getInquire_title() %></a>
			</li>
			<%} %>
		</ul>
		<!-- 만약에 저게 null이 아닐 경우에만 하고 아니면 보이지 말아야 함. 그건 일단 받아오는 곳에서부터 먼저 처리해야 함. -->
	</div>
</div>
</body>
</html>
	
	
	
	
	
