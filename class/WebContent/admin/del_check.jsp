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
	String no = request.getParameter("no");
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
			<ul>
				<li>
					삭제하시겠습니까?
					<br/>
					<input type="button" onclick="javascript:document.location.href='admin_data_del_ok.do?no=<%= no %>'" value="삭제">
					<input type="button" onclick="javascript:history.back()'" value="취소">
				</li>
			</ul>
		</div>
		<div id="data_board_bottom">
		</div>
	</div>
</body>
</html>