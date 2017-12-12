<%@page import="com.inquire.model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"  %>
<link rel="stylesheet" type="text/css" href="./css/inquire.css">
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String)session.getAttribute("id");
	List<inquireVO> inquireList = (List<inquireVO>)request.getAttribute("LIST");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="./css/facil.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시설 이용 예약</title>
</head>

<script type="text/javascript">

function login_check() {
	var id_c = <%= (String)session.getAttribute("id") %>;
	if(id_c == null) {
		alert("로그인하지 않으면 조회할 수 없습니다.");
		location.href = "./login.do";
	}
}	
</script>
<body onload="login_check();">
<div class="clear"></div>
<div id="inq_articles">
	<%@ include file="../include/gongji_leftmenubar.jsp" %>
	<div id="inquire_top">
		<%
			if((inquireList != null) && (inquireList.size()>0)) {
		%>
		<ul>
			<li><%= inquireList.get(0).getInquire_id() %>님의 문의입니다.</li>
		</ul>
		<ul>
			<li style="width: 20%;"> 번호 </li>
			<li style="width: 40%;"> 제목 </li>
	        <li style="width: 15%;"> 등록일 </li>
	        <li style="width: 15%;"> 조회수 </li>
		</ul>
	</div>	
	<div id="inquire_board">
		<%
			for(int i=0;i<inquireList.size();i++) {
			inquireVO inquire = inquireList.get(i);
		%>
			<ul>
				<li style="width: 20%;"><%=inquire.getInquire_no() %></li>
				<li style="width: 40%;"><a href="inquire_cont.do?no=<%=inquire.getInquire_no() %>" onfocus="this.blur()"><%=inquire.getInquire_title() %></a></li>			
				<li style="width: 15%;"><%=inquire.getInquire_regdate().substring(0,10) %></li>
				<li style="width: 15%;"><%=inquire.getInquire_hit() %></li>
			</ul>
			<!--
				아이디를 변수로 받아들여서 자기 문의 내역만 받아오도록 설정. 집 가서.
				그러러면 서버에 아이디 변수를 받아들여야 하는데. 아이디를 넘기려면?
			 -->
			<%}
			} else {
			%>		
			<ul>
				<li>문의한 내역이 없습니다.</li>			
			</ul>
			<% } %>	
		<input type="button" value="문의" onclick="location='inquire_write.do'"  class="inquire_b">
	</div>
</div>

</body>
</html>


