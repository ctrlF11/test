<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>통합검색</title>
</head>
<body>
<script type="text/javascript">
	function all_checked() {
		var all = document.getElementById("select_all");
		var b = document.getElementById("select_b");
		var p = document.getElementById("select_p");
		var m = document.getElementById("select_m");
		
		
		
		if(all.checked == true) {
			if(b.checked == true || p.checked == true || m.checked == true) {
				all.checked = false;
			}
		}
		
		if(b.checked == true && p.checked == true && m.checked == true) {
			b.checked = false;
			p.checked = false;
			m.checked = false;
			all.checked = true;
		}
	}
	function check_check() {
		var all = document.getElementById("select_all");
		var b = document.getElementById("select_b");
		var p = document.getElementById("select_p");
		var m = document.getElementById("select_m");
		if(all.checked == false && b.checked == false && p.checked == false && m.checked == false) {
			alert("자료의 종류가 설정되지 않았습니다.");
			return false;
		}
		/* var s = document.getElementById("search_value").value;
		if(s == "") {
			alert("검색할 내용을 입력해주세요.");
			return false;
		} */
	
		
		return true;
	}
</script>
	<%@ include file="../include/header.jsp" %>
	<div class="search_wrap">
	<%@ include file="../include/search_leftmenubar.jsp" %>
		<div class="search_b">
			<div id="search_b_top">
				<ul>
					<li style="list-style: none;">자료 검색</li>
				</ul>
			</div>
			<form method="post" action="search_result.do" name="search_research" onsubmit="return check_check(this)">
				<div id="search_b_MB">	
					<ul style="height: 300px;">
						<li>
							<select name="search_option" id="search_option">
								<option value="book_name" selected="selected">도서명</option>
								<option value="book_writer">작가</option>
								<option value="book_category">분류</option>
							</select>
							<input type="text" size="50" name="search_value" id="search_value">
						</li>
						<li>
							종류&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" value="all" id="select_all" checked="checked" onclick="all_checked()"> 전체 &nbsp;&nbsp;
							<input type="checkbox" value="b" id="select_b" onclick="all_checked()"> 도서 &nbsp;&nbsp;
							<input type="checkbox" value="p" id="select_p" onclick="all_checked()"> 간행물 &nbsp;&nbsp;
							<input type="checkbox" value="m" id="select_m" onclick="all_checked()"> 멀티미디어
						</li>
						<li>
							연도&nbsp;<input type="text" id="select_year1" size="6">&nbsp;-&nbsp;<input type="text" id="select_year2" size="6">
						</li>
						<li>
							<input type="submit" value="검색">
						</li>
					</ul>
				</div>
			</form>
		</div>
	</div>	
</body>
</html>