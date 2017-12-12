<%@page import="com.bf.model.bfVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 신청</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bf.css" />
<script type="text/javascript">
	function write_check() {
		var form = document.f;
		var bw_t = form.bw_title.value;
		var bw_n = form.bw_name.value;
		var bw_p = form.bw_pass.value;
		var bw_c = form.bw_cont.value;
	
		if(bw_t == "") {
			alert("제목을 작성해주세요.");	
			return false;
		}
		if(bw_n == "") {
			alert("도서명을 작성해주세요.");						
			return false;
		}
		if(bw_p == "") {
			alert("암호를 작성해주세요.");									
			return false;
		}
		if(bw_c == "") {
			alert("글을 작성해주세요.");									
			return false;
		}
		return true;
	}
</script>
<body>
<%@ include file="../include/header.jsp" %>
<div class="clear"></div>
<div id="facil_article">
	<div id="reserveMainTop">

	</div>
	<form name="f" method="post" action="book_writeOK.do" onsubmit="return write_check(this);">
		<div id="reserveMainMiddle" style="height: 700px;">
			<ul>
				<li style="width: 20%;">
					제목
				</li>			
				<li style="width: 40%;">
					도서 제목
				</li>			
				<li style="width: 20%;">
					글 암호
				</li>			
			</ul>
			<ul>
				<li style="width: 20%;">
					<input type="text" name="bw_title">
				</li>
				<li style="width: 40%;">
					<input type="text" name="bw_name">
				</li>
				<li style="width: 20%;">
					<input type="text" name="bw_pass">
				</li>
			</ul>
			<ul>
				<li style="margin-left: -42px; margin-right:0px; width: 665px; height: 500px; text-align: left; padding: 10px;">
					<textarea rows="30" cols="80" name="bw_cont"></textarea>
				</li>
			</ul>
		</div>
		<div id="reserveMainBottom">
			<ul style="height: 15px;">
				<li>
					<input type="submit" value="확인" style="float: left;">
					<input type="button" onclick="javascript:document.location.href='book_want.do'" value="목록"
					style="float: right; margin-right: 10px;">
				</li>
			</ul>
		</div>
	</form>
</div>
	
<div class="clear"></div>	
</body>
</html>
	
	
	
	
	
