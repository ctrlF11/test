<%@page import="com.admin.model.adminVO"%>
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
	List<adminVO> list = (List<adminVO>)request.getAttribute("LIST");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료 관리</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css">
</head>
<%
	String idS = (String)session.getAttribute("id");
	String link_check = (String)request.getAttribute("line");
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
</script>
<body onload="session_check()">	
	<%@ include file="../a_include/admin_header.jsp" %>
	<div id="admin_all_board">
		<%@ include file="../a_include/data_leftmenubar.jsp" %>
		<div id="data_board">
			<%
				if((list != null) && (list.size()>0)) {
					for(int i=0;i<list.size();i++) {
						
					
			%>
					<ul>
						<li>
							<ul>
								<li><%=i+1 %>. <a href='<c:url value="/book_info.do" />
								?book_name=<%=list.get(i).getBook_name() %>' target="_self"
								style="text-decoration: none;"><%=list.get(i).getBook_name() %></a></li><br/>
								<li>작가 : <%=list.get(i).getBook_writer() %></li><br/>
								<li>발행 년도 : <%=list.get(i).getBook_year()%> </li><br/>
								<li>카테고리 : <%=list.get(i).getBook_category()%></li>
							</ul>
							<ul>
								<li>
									<%= list.get(i).getBook_image() %>
									<img alt="책 표지" src="images/<%= list.get(i).getBook_image() %>.png"
									style="float: right;">
								</li>
							</ul>
							<ul>
								<li>
									<a href="admin_data_edit.do?no=<%=list.get(i).getBook_number() %>">수정</a>
								</li>
								<li>
									<a href="admin_data_del.do?no=<%=list.get(i).getBook_number() %>">삭제</a>
								</li>
							</ul>
						</li>
					</ul>
			<%
					}
				} else { %>
				<ul><li>검색된 내용이 없습니다.</li></ul>
			<%} %>
		</div>
		<div id="data_board_bottom">
			<ul style="text-align: center;">
				<%
					if(nowPage > block)
					{%>
						[<a href="admin_manage_<%= link_check %>.do?page=1">◀◀</a>]
						[<a href="admin_manage_<%= link_check %>.do?page=<%=startPage-1%>">◀</a>]
					<%}	%>
				<%
					for(int i=startPage;i<=endPage;i++)
					{
						
						if(i == nowPage)
						{%>
							<b>[<%=i %>]</b>
						<%} else { %>
							[<a href="admin_manage_<%= link_check %>.do?page=<%=i%>"><%=i %></a>]
					<%}
					}%>
				<%	
					if(endPage < allPage)
					{%>
						[<a href="admin_manage_<%= link_check %>.do?page=<%=endPage+1%>">▶</a>]
						[<a href="admin_manage_<%= link_check %>.do?page=<%=allPage%>">▶▶</a>]
				<%} %>
			</ul>	
		</div>
	</div>
</body>
</html>