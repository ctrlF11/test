<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/menu.css">
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
</script>
<body onload="session_check()">	
	<%@ include file="../a_include/admin_header.jsp" %>
	<div class="clear"></div>
	<div id="article">
		<div id="article_left">
			<div id="main_quick_menu">
				<ul style="width: 306px; height: 306px; border: 1px solid blue;
						padding: 0; margin: 0; font-size: 0px; float: left;">
					<li>
						<img alt="FAQ" src="" onclick="javascript:document.location.href='faq.do'">
					</li>
					<li>
						<img alt="문의" src="" onclick="javascript:document.location.href='inquire.do'">
					</li>
					<li>
						<img alt="도서 신청" src="" onclick="javascript:document.location.href='book_want.do'">
					</li>
					<li>
						<img alt="도서관 소개" src="" onclick="javascript:document.location.href='faq.do'">
					</li>
					<li>
						<img alt="" src="" onclick="javascript:document.location.href='faq.do'">
					</li>
					<li>
						<img alt="" src="" onclick="javascript:document.location.href='faq.do'">
					</li>
					<li>
						<img alt="" src="" onclick="javascript:document.location.href='faq.do'">
					</li>
					<li>
						<img alt="" src="" onclick="javascript:document.location.href='faq.do'">
					</li>
					<li>
						<img alt="" src="" onclick="javascript:document.location.href='faq.do'">
					</li>
				</ul>
				<form method="post" action="search_result.do" onsubmit="return val_check(this)">
					<ul id="main_search">
						<li class="main_search_li">
							통합 검색 : 
							<input type="text" size="20" name="search_value" id="search_value" style="display: inline-block;">
							<input type="submit" value="검색">
						</li>
						<li class="main_search_li">
						</li>
						<li class="main_search_li">
						</li>
					</ul>
				</form>		
			</div>
			
			<div id="article_middle">
				<ul style="margin: 0px; padding: 0px; border: 1px solid black;
					width: 100%; height: 50px;">
					<li style="text-align: center; list-style: none; margin-top: 15px; ">
						인기 대출 도서
					</li>
				</ul>
				<ul class="book_area">
				 
				</ul>
				<ul class="book_area">
				 
				</ul>
				<ul class="book_area">
				 
				</ul>
				<ul class="book_area">
				 
				</ul>
			</div>
			
		</div>
		<div id="gongji_right">
			<div id="gongji_main_board">
				<c:set var="list" value="${LIST }"></c:set>
				<c:if test="${!empty list }">
						<ul style="text-align: center; margin-left: -50px;">
							<li> 공지사항 </li>
						</ul>
					<c:forEach items="${list }" var="i" begin="0" end="5" step="1">
						<ul>
							<li style="width: 50%;"><a href="gongji_cont.do?no=${i.gongji_no }">
								${i.gongji_title }</a></li>
							<li style="width: 25%; margin-right: 0px;">${i.gongji_date }</li>
						</ul>
					</c:forEach>
				</c:if>
			</div>
			<div id="main_calendar">
			<%
				Calendar cal = Calendar.getInstance();
				int apCheck = cal.get(Calendar.AM_PM);
			
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH);
				int date = cal.get(Calendar.DATE);
				cal.set(year, month, 1);
				
				int startDay = cal.getMinimum(Calendar.DATE);
				int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				
				int start = cal.get(Calendar.DAY_OF_WEEK);
				int lineCheck = 0;
			%>
				<table id="main_calendar_t" border="1" width="400px" height="270px" align="right">
					<tr>
						<td width="100px" height="240px" rowspan="7" valign="top"
						 align="center" style="font-size: 20px; font-weight: bold; padding-top: 20px">
							<%= year %>년
							<br>
							<%= month+1 %>월
						</td>
						<td style="color: red;">일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td style="color: blue;">토</td>
					</tr>
					<tr>
						<%  for(int i = 1;i < start;i++) {
								out.println("<td>&nbsp;</td>");
							lineCheck++; }
							for(int i = 1;i <= endDay;i++) {
								String color = "";
								if(lineCheck == 0) {
									color = "red";
								} else if(lineCheck == 6) { 
									color = "blue";
								}
								if(date == i) {
									out.print("<td class='calDate' align='center' style='color: "+color+"; font-weight: bold;'>");									
									out.print(i);
									out.print("</td>");
								} else {
									out.print("<td class='calDate' align='center' style='color: "+color+";'>");
									out.print(i);
									out.print("</td>");
								}
								lineCheck++;
								if(lineCheck == 7) {
									out.println("</tr>");
									if(i <= endDay) {
										out.println("<tr>");
									}
									lineCheck = 0;
								}
							}
							while(lineCheck > 0 && lineCheck < 7) {
								out.println("<td>&nbsp;</td>");
								lineCheck++;
							}
						%>								
						</tr>
					</table>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div id="underbar">
		<a href=""> <img alt="" src=""> </a>
	
	</div>
</body>
</html>