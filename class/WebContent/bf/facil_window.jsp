 <%@page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.bf.model.bfVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//클릭하면 그 날짜 시간 확인해서 팝업.
	Calendar cal = Calendar.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	int apCheck = cal.get(Calendar.AM_PM);
	String hour = null;
	String minute = Integer.toString(cal.get(Calendar.MINUTE));
	String ampm = null;

	if(apCheck == 0) {
		ampm = "오전";
	} else {
		ampm = "오후";
	}
		if(cal.get(Calendar.HOUR) == 0) {
			hour = "12";
		} else {
			hour = Integer.toString(cal.get(Calendar.HOUR));
		}
	int check = 0;
	int checkHour = cal.get(Calendar.HOUR);
	if(apCheck == 1) {
		checkHour += 12;
	}
	int facil_no = Integer.parseInt(request.getParameter("facil_no"));
	
	int op = 0;
	int seldate = 0;	
	int days = 0;
	if(request.getParameter("op") != null) {
		op = Integer.parseInt(request.getParameter("op"));
	}
	if(request.getParameter("seldate") != null) {
		seldate = Integer.parseInt(request.getParameter("seldate"));
		days = seldate-cal.get(Calendar.DATE);
	}
	if(seldate == cal.get(Calendar.DATE) && checkHour >= 16) {
		check = 1;
	}

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	
	if(strYear != null) {
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);
	}
	
	cal.set(year, month, 1);
	
	int startDay = cal.getMinimum(Calendar.DATE);
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	int start = cal.get(Calendar.DAY_OF_WEEK);
	int lineCheck = 0;
	
	List<bfVO> list = (List<bfVO>)request.getAttribute("LIST");
	
	double list_hour = 0;
	double list_time = 0;
	
	String facil_year = null;
	String facil_month = null;
	String facil_day = null;
	
	if(list.get(0).getFacil_state() != 0) {
		// facil_state = 0이 아니다 = 예약이 있다는 뜻.
		facil_year = list.get(0).getFacil_date().substring(0, 4);
		facil_month = list.get(0).getFacil_date().substring(5, 7);
		facil_day = list.get(0).getFacil_date().substring(8, 10);
		list_hour = list.get(0).getFacil_hour();
		list_time = list.get(0).getFacil_time();
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="./css/bf.css">
<head>
<script type="text/javascript" src="./js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석 예약</title>
</head>
<script type="text/javascript">
	function rZone_off() {
		var n = document.getElementById("reserve_area");
		if(n.style.display == "none" && n.style.display != "inline") {
			n.style.display = "inline";
		} else {
			n.style.display = "none";
		}
	}
	function facil_check() {
		var form = document.f;
		var fchk = null;
		var ftime = form.times.value;
		var fdate = form.days.value;
		for(i=0;i<form.checkboxs.length;i++) {
			if(form.checkboxs[i].checked == true) {
				fchk = form.checkboxs[i].value;
			}
		}
		fchk *= 1;
		ftime *= 1;
		alert(fchk);
		alert(ftime);
		alert(fchk+ftime);
		alert(fdate);
		
		if(fchk+ftime > 9){
			alert("예약 시간이 초과되었습니다.");
			return false;
		}
		
		alert(<%= list_hour+list_time %>);
		
		if(<%= list_hour+list_time %> <= fchk+ftime && <%= list_hour+list_time %> != 0) {
			alert("이미 예약된 시간대입니다.");
			return false;
		}
		alert("확인용");
		window.close();
		form.submit();
	}
	
</script>
<body>
<form name="f" action="facil_submit.do" method="post">
	<div id="fw_body">
		<ul>
			<li style="list-style: none;"> * 날짜 선택 : 최소 2시간 전부터 예약해주셔야 합니다.
					<ul id="calendar"><!-- 일단은 시간? 아니지. 클릭해서 번호 받아오면서, 서버 가서 시간을 받아온 다음에, 여기로 와서 표시. -->
						<li style="list-style: none; margin-top: 20px;">
						<div class="clear"></div>
						<table id="calendar_t" border="1" width="270px" height="270px">
							<tr>
								<th colspan="7" align="center">
								<% if(month>cal.MONTH) {
								%>
								<a href="<c:url value='/facil_window.do' />?
									year=<%= year %>&amp;month=<%= month-1 %>&amp;facil_no=<%= facil_no %>
								" target="_self" style="text-decoration: none;">
									<b>&lt;</b> <!-- 전 달로. -->
								</a>
								<% } else if(cal.YEAR < year && month < cal.MONTH) { %>
								<a href="<c:url value='/facil_window.do' />?
									year=<%= year %>&amp;month=<%= month-1 %>&amp;facil_no=<%= facil_no %>
								" target="_self" style="text-decoration: none;">
									<b>&lt;</b> <!-- 전 달로. -->
								</a>
								<% } else if(cal.YEAR < year && month == 0) { %>
								<a href="<c:url value='/facil_window.do' />?
									year=<%= year-1 %>&amp;month=<%= month+11 %>&amp;facil_no=<%= facil_no %>
								" target="_self" style="text-decoration: none;">
									<b>&lt;</b> <!-- 전 달로. -->
								</a>
								<% }else {%>
									<b>&lt;</b>
								<%} %>
								&nbsp;&nbsp;
								<%= year %>년 <%= month+1 %>월
								&nbsp;&nbsp;
								
								<% if(month<11 && cal.MONTH+1 > month) {
								%>
								<a href="<c:url value='/facil_window.do' />?
									year=<%= year %>&amp;month=<%= month+1 %>&amp;facil_no=<%= facil_no %>
								" target="_self" style="text-decoration: none;">
									<b>&gt;</b> <!-- 앞으로. -->
								</a>
								<% } else if(month == 11 && cal.MONTH-11 == 0) { %>
								<a href="<c:url value='/facil_window.do' />?
									year=<%= year+1 %>&amp;month=<%= month-11 %>&amp;facil_no=<%= facil_no %>
								" target="_self" style="text-decoration: none;">
									<b>&gt;</b> <!-- 앞으로. -->
								</a>
								<% }else {%>
									<b>&gt;</b>
								<%} %>
								
								</th>
							</tr>
							<tr>
								<td align="center" style="color: red;">일</td>
								<td align="center">월</td>
								<td align="center">화</td>
								<td align="center">수</td>
								<td align="center">목</td>
								<td align="center">금</td>
								<td align="center" style="color: blue;">토</td>
							</tr>
							
							<tr>
							<%  
							
								for(int i = 1;i < start;i++) {
									out.println("<td>&nbsp;</td>");
								lineCheck++; }
								for(int i = 1;i <= endDay;i++) {
									String color = "";
									if(lineCheck == 0) {
										color = "red";
									} else if(lineCheck == 6) { 
										color = "blue";
									} else { color = "black"; }
									if(date > i || lineCheck == 0 || lineCheck == 6) {
										out.print("<td class='calDate' align='center' style='background: gray; color: "+color+";'>");									
										out.print(i);
										out.print("</td>");
									} else {
										out.print("<td class='calDate' align='center' style='color: "+color+";'>");
										%>
										<a href="<c:url value='/facil_window.do' />?year=<%=year %>&amp;month=<%= month %>
										&amp;facil_no=<%= facil_no %>&amp;seldate=<%=i %>
										&amp;op=1" target='_self' style="text-decoration: none;">
										<%=i %>
										</a>
										<% 
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
							
							<!--
								onclick 이용해서
								클릭하면
								<div>
								absolute로 고정시킨 녀석 z-index 최고로 해서 맨 위에 띄운 다음
								특정 시간 입력시켜서. 확인되면 .do로 리턴시켜서 저장.
								만약에 ...... 일단 여기로 올 때 예약 시간 여부 확인해서 여기서 색칠해주는게 좋을것 같다.
								30분으로
							 -->					
							
								
							</tr>
						</table>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="clear"></div>
	<c:if test="<%= op == 1 %>">
		<style type="text/css">
			#reserve_area { display: inline; }
		</style>
	</c:if>
	<c:if test="<%= check == 1 %>">
		<style type="text/css">
			#reserve_area { display: none; }
		</style>
	</c:if>
	<c:if test="<%= op != 1 %>">
		<style type="text/css">
			#reserve_area { display: none; }
		</style>
	</c:if>
	<div id="reserve_area">
		<ul id="reserve_aHead" onclick="rZone_off()">
			<li style="list-style: none; margin-right: 40px;" >
				현재 시각 - <%= ampm %> <%= hour %>:<%= minute %>
				
			</li>
		</ul>
		<div class="clear"></div>
		<ul id="reserve_aBody">
			<%
			for(double i=0;i<9;i+=0.5) {
				double time = Integer.parseInt(hour);
				String color = null;
				String oc = "";
				// 오후면 현재 시간 + 12, 30분이 넘으면 +0.5
				
				if(apCheck == 1 && time != 12) {
					time += 12;
				}
				if(Integer.parseInt(minute) >= 30) {
					time += 0.5;
				}
			
				if(time < i+7) {
					color = "#b2d4ff";
					oc = "<input type='checkbox' name='checkboxs' value='" + i + "'>";
				} else {
					color = "gray";							
				}
				if(seldate == date && list_hour <= i && i <= list_hour+list_time) {
					color = "gray";							
					oc = "";
				} else if(seldate > date && list_hour <= i && i <= list_hour+list_time) {
					color = "gray";							
					oc = "";
				} else if(seldate > date) {
					color = "#b2d4ff";
					oc = "<input type='checkbox' name='checkboxs' value='" + i + "'>";
				}
				
				
				if(i % 1 == 0.5) {
					out.print("<li class='aBoard' style='background:"+color+";' onclick=''>");
					out.print("<p class='time'>"+ (int)(i-0.5+9) + "시 30분" + oc + "</p>");
					out.print("</li>");
					} else {
					out.print("<li class='aBoard' style='background:"+color+";'>");
					out.print("<p class='time'>"+ (int)(i+9) + "시" + oc + "</p>");
					out.print("</li>");
				}
			}
				%>
			<li style="list-style: none;">
				<select name="times" id="times">
					<option value="" selected="selected">시간을 선택해주세요.</option>
					<option value="0.5">30분</option>
					<option value="1">1시간</option>
					<option value="1.5">1시간 30분</option>
					<option value="2">2시간</option>
					<option value="2.5">2시간 30분</option>
					<option value="3">3시간</option>
					<option value="3.5">3시간 30분</option>
					<option value="4">4시간</option>
				</select>
			</li>
			<li style="list-style: none;">
				<input type="button" onclick="javascript:facil_check();" value="예약">
			</li>
			<li style="display: none;">
				<input type="text" name="facil_number" value="<%= facil_no %>">
				<input type="text" name="days" value="<%= days %>" >
			</li>
		</ul>
	</div>
</form>
</body>
</html>