<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <title>메인 화면</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/menu.css">
</head>
<script type="text/javascript">
	function log_out() {
		if(event.clientY<0) {
			session.invalidate();
		}
	}
</script>
<body onunload="log_out()">	
	<div id="main_wrap">
		<%@ include file="../include/header.jsp" %>
		<div class="clear"></div>
		<div id="article">
			<div id="gongji_right">
				<div id="gongji_main_board">
					<c:set var="list" value="${LIST }"></c:set>
					
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="i" begin="0" end="4" step="1">
							<fmt:parseDate var="priDate" value="${i.gongji_date }" pattern="yyy-MM-dd HH:mm:ss"></fmt:parseDate>
							<fmt:formatDate var="date" value="${priDate }" pattern="yyyy-MM-dd"/>
							<ul>
								<li style="width: 10%;">${i.gongji_no }</li>
								<li style="width: 20%;"><a href="gongji_cont.do?no=${i.gongji_no }">
									${i.gongji_title }</a></li>
								<li style="width: 25%;">${date }</li>
								<li style="width: 10%; margin-left: 30px;]">${i.gongji_hit }</li>
							</ul>
						</c:forEach>
					</c:if>
				</div>
				<div id="calendar">
				
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div id="underbar">
			<a href=""> <img alt="" src=""> </a>
		
		</div>
	</div>
			

</body>
</html>