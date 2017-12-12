<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.bf.model.bfVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="./css/bf.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시설 이용 예약</title>
</head>
<script type="text/javascript">
	function facil_rCheck(number) {
		var addr = "admin_facil_rWindow.do?facil_no=" + number;
		window.open(addr, "좌석 예약", "width=550, height=800");
	}
	function login_check() {
		var id_c = <%= (String)session.getAttribute("id") %>;
		if(id_c == null) {
			alert("로그인하지 않으면 예약할 수 없습니다.");
			location.href = "./login.do";
		}
	}	
</script>
<body onload="login_check();">
<%
	int count = (Integer)request.getAttribute("COUNT");
%>
<%@ include file="../../a_include/admin_header.jsp"%>
	<div id="facil_article">
	
		<div>
			<ul><li>예약 현황을 확인하실 좌석을 선택해주세요.</li></ul>
		</div> 
		<div id="facil_seatboard">
			<ul>
			<%
				for(int i=1;i<count+1;i++) {
			%>	
				<li id="facil_no" onclick="facil_rCheck(<%= i %>)"><%= i %></li>
				
			<%				
				if(i%18 == 0) {
					%>
						<br><br><br><br>
						<br><br><br><br>
						<br><br><br><br>
					<%
				}
			
				}
			%>
			</ul>
			
		</div>
	</div>
</body>
</html>