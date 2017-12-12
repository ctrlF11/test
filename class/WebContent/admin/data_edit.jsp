<%@page import="com.admin.model.adminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료 수정</title>
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
	function none_check() {
		var form = document.f;
		var g = f.book_group.value;
		var na = f.book_name.value;
		var w = f.book_writer.value;
		var c = f.book_category.value;
		var nu = f.book_number.value;
		var y = f.book_year.value;
		var i = f.book_image.value;
		
		
		if(g != "" && na != "" && w != "" && c != "" && nu != "" && y != "" && i != "") {
			return true;
		}
			alert("빈 곳이 있습니다.");
			return false;
	}

</script>
<body onload="session_check()">	
	<%@ include file="../a_include/admin_header.jsp" %>
	<div id="admin_all_board">
		<%@ include file="../a_include/data_leftmenubar.jsp" %>
		<div id="data_board">
		<% adminVO vo = (adminVO)request.getAttribute("VO"); %>
			<form name="f" method="post" action="admin_data_edit_ok.do" onsubmit="return none_check()">
				<ul>
					<li>
						<ul style="width: 300px;">
							<li>
								목차 : <input type="text" name="book_group" id="book_group"
								value="<%= vo.getBook_group() %>">
							</li>
							<li>
								도서명 : <input type="text" name="book_name" id="book_name"
								value="<%= vo.getBook_name() %>">
							</li>
							<li>
								저자 : <input type="text" name="book_writer" id="book_writer"
								value="<%= vo.getBook_writer() %>">
							</li>
							<li>
								카테고리 : <input type="text" name="book_category" id="book_category"
								value="<%= vo.getBook_category() %>"> <br/>(도서, 간행물, 전자도서)
							</li>
							<li>
								도서 코드 : <input type="text" name="book_number" id="book_number"
								value="<%= vo.getBook_number() %>">
							</li>
							<li>
								발행 년도 : <input type="text" name="book_year" id="book_year"
								value="<%= vo.getBook_year() %>">
							</li>
							<li>
								이미지 이름 : <input type="text" name="book_image" id="book_image"
								value="<%= vo.getBook_image() %>">
							</li>
							<li>
								<input type="hidden" name="origin_Bnum" id="origin_Bnum" value="<%=vo.getBook_number()%>">
								<input type="submit" value="수정">
								<input type="button" value="취소" onclick="javascript:history.back()">
							</li>
						</ul>
					</li>
				</ul>
			</form>
		</div>
		<div id="data_board_bottom">
		</div>
	</div>

</body>
</html>