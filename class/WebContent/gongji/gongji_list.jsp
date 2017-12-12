<%@page import="com.gongji.model.gongjiVO"%>
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
	List<gongjiVO> list = (List<gongjiVO>)request.getAttribute("LIST");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gongji.css" />
<body>
<%@ include file="../include/header.jsp" %>
<div class="clear"></div>
<div id="gongji_article">
	<%@ include file="../include/gongji_leftmenubar.jsp" %>
	<div id="gongji_topbar" style="height: 51px;">
		<!-- 글번호 제목 작성자 날짜 조회수 -->
		<ul>
			<li style="width: 15%;">번호</li>		
			<li style="width: 20%;">제목</li>		
			<li style="width: 20%;">작성자</li>		
			<li style="width: 20%;">날짜</li>		
			<li style="width: 15%;">조회수</li>		
		</ul>
	</div>
	<div id="gongji_board">
	<c:set var="list" value="${LIST }"></c:set>
	<c:if test="${!empty list }">
		<c:forEach items="${list }" var="i" begin="0" end="14" step="1">

			<ul>
				<li style="width: 15%;">${i.gongji_no }</li>
				<li style="width: 20%;"><a href="gongji_cont.do?no=${i.gongji_no }&amp;page=<%=nowPage %>">
					${i.gongji_title }</a></li>
				<li style="width: 20%;">${i.gongji_writer }</li>
				<li style="width: 20%;">${i.gongji_date }</li>
				<li style="width: 15%;">${i.gongji_hit }</li>
			</ul>
		</c:forEach>
	</c:if>
	<c:if test="${empty list }">
		<ul><li>검색된 내용이 없습니다.</li></ul>
	</c:if>
	</div>
	<div id="gongji_bottom">
		<ul style="text-align: center;">
				<%
					if(endPage < allPage)
					{%>
						[<a href="gongji_list.do?page=<%=allPage%>">◀◀</a>]
						[<a href="gongji_list.do?page=<%=endPage+1%>">◀</a>]
					<%}	%>
				<%
					for(int i=endPage;i>=startPage;i--)
					{
						if(i == nowPage)
						{%>
							<b>[<%=i %>]</b>
						<%} else { %>
							[<a href="gongji_list.do?page=<%=i%>"><%=i %></a>]
					<%}
					}%>
				<%	
					if(nowPage > block)
					{%>
						[<a href="gongji_list.do?page=<%=startPage-1%>">▶</a>]
						[<a href="gongji_list.do?page=1">▶▶</a>]
				<%} %>
		</ul>
	</div>	
</div>

	
<div class="clear"></div>	
</body>
</html>
	
	
	
	
	
