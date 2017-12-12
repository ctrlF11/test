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
	
		var value = document.getElementsByName("gongji_del");
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
				return true;
			} else {
				return false;
			}
		}
		
	}
</script>
<body>
<%@ include file="../../a_include/admin_header.jsp" %>
<div class="clear"></div>
<div id="gongji_article">
	<%@ include file="../../a_include/gongji_leftmenubar.jsp" %>
	<div id="gongji_topbar" style="height: 51px;">
		<!-- 글번호 제목 작성자 날짜 조회수 -->
		<ul>
			<li style="width: 15%;">삭제 여부</li>
			<li style="width: 10%;">번호</li>		
			<li style="width: 20%;">제목</li>		
			<li style="width: 10%;">작성자</li>		
			<li style="width: 20%;">날짜</li>		
			<li style="width: 15%;">조회수</li>		
		</ul>
	</div>
	<form name="f" method="post" action="admin_gongji_del.do" onsubmit="return submit_check()">
		<div id="gongji_board">
		<c:set var="list" value="${LIST }"></c:set>
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="i" begin="0" end="14" step="1">
				<ul>
					<li style="width: 15%;"><input type="checkbox" name="gongji_del" value="${i.gongji_no }"></li>
					<li style="width: 10%;">${i.gongji_no }</li>
					<li style="width: 20%;"><a href="admin_gongji_cont.do?no=${i.gongji_no }&amp;page=<%=nowPage %>">
						${i.gongji_title }</a></li>
					<li style="width: 10%;">${i.gongji_writer }</li>
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
							[<a href="admin_gongji_list.do?page=<%=allPage%>">◀◀</a>]
							[<a href="admin_gongji_list.do?page=<%=endPage+1%>">◀</a>]
						<%}	%>
					<%
						for(int i=endPage;i>=startPage;i--)
						{
							if(i == nowPage)
							{%>
								<b>[<%=i %>]</b>
							<%} else { %>
								[<a href="admin_gongji_list.do?page=<%=i%>"><%=i %></a>]
						<%}
						}%>
					<%	
						if(nowPage > block)
						{%>
							[<a href="admin_gongji_list.do?page=<%=startPage-1%>">▶</a>]
							[<a href="admin_gongji_list.do?page=1">▶▶</a>]
					<%} %>
			</ul>
			<ul style="text-align: right;">
				<li>
					<input type="button" value="공지사항 작성" style="float: left;""
					onclick="javascript:document.location.href='admin_gongji_write.do'">
					<input type="submit" value="공지사항 삭제">
				</li>
			</ul>
		
		</div>	
		</form>
					
</div>

	
<div class="clear"></div>	
</body>
</html>
	
	
	
	
	
