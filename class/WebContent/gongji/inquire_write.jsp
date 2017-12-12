<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 페이지</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gongji.css" />
<script type="text/javascript">
	function checked() {
		var form = document.f;
		var title = form.inquire_title.value;
		var question = form.inquire_question.value;
		var cont = form.inquire_content.value;
		
		if(title == "") {
			alert("제목이 작성되지 않았습니다.");
			return false;
		}
		if(question == "") {
			alert("분류를 선택해주십시오.");
			return false;
		}
		if(cont == "") {
			alert("글이 작성되지 않았습니다.");
			return false;
		}
		
		return true;
	}
</script>
<body>
<%@ include file="../include/header.jsp" %>
<div id="inq_articles">
	<%@ include file="../include/gongji_leftmenubar.jsp" %>
	<div id="gongji_topbar">
		<ul style="height: 101px; margin: auto;">
			<li style="margin-top: 22px; font-size: 50px;">문의사항 작성</li>		
		</ul>
	</div>
	<form name="f" method="post" action="inquire_writeOK.do" onsubmit="return checked();">
		<div id="gongji_board">
			<ul>
				<li style="width: 65%; margin-left: -60px;" >
					제목 : <input type="text" size="30" name="inquire_title" id="inquire_title">
				</li>
				&nbsp;&nbsp;&nbsp;
				<li style="width: 30%">
					분류 : 
					<select name="inquire_question" id="inquire_question">
						<option selected="selected" value="">----</option>
						<option value="1">회원 관련</option>
						<option value="2">이용 관련</option>
						<option value="3">도서 관련</option>
						<option value="4">기타</option>
					</select>
				</li>
				
			</ul>
			<ul>
				<li style="margin-left: -42px; margin-right:0px; width: 665px; height: 482px; text-align: left; padding: 10px;">
					<textarea rows="31" cols="80" name="inquire_content" id="inquire_content"></textarea>
				</li>
			</ul>
		</div>
		<div id="gongji_bottom">
			<ul style="height: 15px;">
				<li>
					<input type="button" onclick="javascript:document.location.href='inquire.do'" value="목록"
					style="float: right; margin-right: 10px;">
				</li>
				<li>
					<input type="submit" value="작성" style="float: left; margin-left: -28px;">
				</li>
			</ul>
		</div>
	</form>
</div>
</body>
</html>
	
	
	
	
	
