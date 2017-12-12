<%@page import="com.bf.model.bfVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 신청</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bf.css">
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
		
	function submit_check() {
		alert("submit_check");
	
		var value = document.getElementsByName("bw_del");
		var c = 0;
		for(var i=0;i<value.length;i++) {
			if(value[i].checked) {
				c++;
			}
		}
		
		if(c == 0) {
			alert("삭제할 글을 선택하지 않았습니다.");
			return false;
		}
		
		if(c > 0) {
			alert(c + "개의 글을 선택했습니다.");
			var submit = confirm("삭제하시겠습니까?");
			if(submit == true) {
				alert("진입");
				return true;
			}
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



<body onload="session_check()">	
<%@ include file="../../a_include/admin_header.jsp" %>
	<div id="facil_article">
	<form name="f" method="post" action="admin_book_want_del.do" onsubmit="return submit_check()">
		<div id="reserveMainTop">
			<ul>
				<li style="width: 10%;">삭제 여부</li>		
				<li style="width: 15%;">번호</li>		
				<li style="width: 20%;">제목</li>		
				<li style="width: 10%;">작성자</li>		
				<li style="width: 20%;">날짜</li>		
				<li style="width: 15%;">조회수</li>		
			</ul>
		</div>
			<c:set var="list" value="${list }"></c:set>
		<div id="reserveMainMiddle">
			<c:forEach items="${list }" var="i" begin="0" end="14" step="1">
				<ul>
					<li style="width: 10%;"><input type="checkbox" name="bw_del" value="${i.br_no }"></li>		
					<li style="width: 15%;">${i.br_no }</li>
					<li style="width: 20%;"><a href="admin_bw_cont.do?no=${i.br_no }&amp;page=<%=nowPage %>">
						${i.br_title }</a></li>
					<li style="width: 10%;">${i.br_writer }</li>
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
							[<a href="admin_book_want_list.do?page=<%=allPage%>">◀◀</a>]
							[<a href="admin_book_want_list.do?page=<%=endPage+1%>">◀</a>]
						<%}	%>
					<%
						for(int i=endPage;i>=startPage;i--)
						{
							if(i == nowPage)
							{%>
								<b>[<%=i %>]</b>
							<%} else { %>
								[<a href="admin_book_want_list.do?page=<%=i%>"><%=i %></a>]
						<%}
						}%>
					<%	
						if(endPage < allPage)
						{%>
							[<a href="admin_book_want_list.do?page=<%=startPage-1%>">▶</a>]
							[<a href="admin_book_want_list.do?page=1">▶▶</a>]
					<%} %>
			</ul>
			<ul style="text-align: right;">
				<li>
					<input type="submit" value="신청도서 삭제">
				</li>
			</ul>
		</div>
	</form>
	</div>
</body>
</html>