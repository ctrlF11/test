<%@page import="com.bf.model.bfVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 신청</title>
<link rel="stylesheet" type="text/css" href="./css/bf.css">
</head>
<script type="text/javascript">
	function login_check() {
		var id_c = <%= (String)session.getAttribute("id") %>;
		if(id_c == null) {
			alert("로그인하지 않으면 글을 작성할 수 없습니다.");
			document.location.href = "./login.do";
		}
	
	}	
</script>

<%
	int nowPage = (Integer)request.getAttribute("page");
	int block = (Integer)request.getAttribute("block");
	int start = (Integer)request.getAttribute("start");
	int end = (Integer)request.getAttribute("end");
	int startPage = (Integer)request.getAttribute("startPage");
	int endPage = (Integer)request.getAttribute("endPage");
	int rowsize = (Integer)request.getAttribute("rowsize");
	int allPage = (Integer)request.getAttribute("allPage");
	List<bfVO> list = (List<bfVO>)request.getAttribute("LIST");
%>


<body onload="login_check();">
<%@ include file="../include/header.jsp" %>
	<div id="facil_article">
		<div id="reserveMainTop">
			<ul>
				<li style="width: 15%;">번호</li>		
				<li style="width: 20%;">제목</li>		
				<li style="width: 20%;">작성자</li>		
				<li style="width: 20%;">날짜</li>		
				<li style="width: 15%;">조회수</li>		
			</ul>
		</div>
			<c:set var="list" value="${list }"></c:set>
		<div id="reserveMainMiddle">
			<c:forEach items="${list }" var="i" begin="0" end="14" step="1">
				<ul>
					<li style="width: 15%;">${i.br_no }</li>
					<li style="width: 20%;"><a href="bw_cont.do?no=${i.br_no }&amp;page=<%=nowPage %>">
						${i.br_title }</a></li>
					<li style="width: 20%;">${i.br_writer }</li>
					<li style="width: 20%;">${i.br_date }</li>
					<li style="width: 15%;">${i.br_hit }</li>
				</ul>
			</c:forEach>
		</div>
		<div id="reserveMainBottom">
			<ul style="text-align: center;">
					<%
						if(nowPage > block)
						{%>
							[<a href="book_want.do?page=<%=allPage%>">◀◀</a>]
							[<a href="book_want.do?page=<%=endPage+1%>">◀</a>]
						<%}	%>
					<%
						for(int i=endPage;i>=startPage;i--)
						{
							if(i == nowPage)
							{%>
								<b>[<%=i %>]</b>
							<%} else { %>
								[<a href="book_want.do?page=<%=i%>"><%=i %></a>]
						<%}
						}%>
					<%	
						if(endPage < allPage)
						{%>
							[<a href="book_want.do?page=<%=startPage-1%>">▶</a>]
							[<a href="book_want.do?page=1">▶▶</a>]
					<%} %>
			</ul>
			<ul style="text-align: right;">
				<li>
					<input type="button" onclick="javascript:document.location.href='./bw_write.do'" value="희망도서 신청">
				</li>
			</ul>
		</div>
	</div>
</body>
</html>