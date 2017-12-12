<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 결과</title>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="search_wrap">
	<%@ include file="../include/search_leftmenubar.jsp" %>
		<div class="search_b">
			<c:set var="list" value="${list }"></c:set>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="i" varStatus="status">
					<ul>
						<li>${status.count }. <a href='<c:url value="/book_info.do" />
						?book_name=${i.book_name }' target="_self"
						style="text-decoration: none;">${i.book_name }</a></li>
						<li>작가 : ${i.book_writer }</li>
						<li>발행 년도 : ${i.book_year }</li>
					</ul>
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<ul><li>검색된 내용이 없습니다.</li></ul>
			</c:if>
		</div>
	</div>
</body>
</html>