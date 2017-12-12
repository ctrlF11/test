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
	function facil_check(number) {
		var addr = "facil_window.do?facil_no=" + number;
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
<%@ include file="../include/header.jsp"%>
	<div id="facil_article">
		<!-- 
		표를 만들어서. 고자를 만든다음에, 뭔소리야 좌석을 선택하고
		선택한 다음에 시간을 선택하게 한 다음 예약을 누르면
		java 페이지로 보내서
		그걸 업데이트하면서
		상태를 0에서 1로 바꾼다
		그 시간이 지나면
		알아서 풀리게 하려면
		어쩐다
		여기로 들어올 때
		기본적으로 날짜 확인을 해서
		그 시간대가 지났으면
		date를 null로 바꾸고 상태를 1에서 0으로 바꾸면 된다.
		실시간으로 되면 좋겠는데
		그건 아직 말 모르겠고
		 근데 졸리다.
			그냥 도서관처럼 뭐시기 뭐시기 뭐시기 음 독서실?
		 -->
		<div>
			<ul><li>원하시는 좌석을 선택해주세요.</li></ul>
		</div> 
		<div id="facil_seatboard">
			<ul>
			<%
				for(int i=1;i<count+1;i++) {
			%>	
				<li id="facil_no" onclick="facil_check(<%= i %>)"><%= i %></li>
				
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