<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 폼</title>
<link rel="stylesheet" type="text/css" href="./css/member.css">
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/member.js"></script>
<script type="text/javascript">
		//아이디 조건 확인.
		$(function(){
			$("#idcheck_btn").mousedown(function(){
				$("#idcheck").hide();
				var userId = $("#member_id").val();
				if($.trim($("#member_id").val()).length < 4)
				{
					var warningTxt ='<font color="red">아이디는 4자 이상이어야 합니다.</font>';
					$("#idcheck").text('');
					$("#idcheck").show();
					$("#idcheck").append(warningTxt);
					$("#member_id").val('').focus();
					return false;
				};
				if($.trim($("#member_id").val()).length > 12)
				{
					var warningTxt ='<font color="red">아이디는 12자 이하여야 합니다.</font>';
					$("#idcheck").text('');
					$("#idcheck").show()
					$("#idcheck").append(warningTxt);
					$("#member_id").val('').focus();
					return false;
				};
				if(!validate_userid(userId))
				{
					var warningTxt ='<font color="red">영문 소문자, 숫자와 _만 이용 가능합니다.</font>';
						$("#idcheck").text('');
					$("#idcheck").show();
					$("#idcheck").append(warningTxt);
					$("#member_id").val('').focus();
					return false;
				};
				//아이디 중복 여부 확인
				$.ajax({
					type: "post",
					url: "./join/join_idcheck.jsp",
					data: {"userId" : userId},
					datatype: "jsp",
					success: function (data) {
						if(data == 1) {
							var warningTxt = '<font color="red">아이디가 중복됩니다.</font>';
							$("#idcheck").text('');
							$("#idcheck").show();
							$("#idcheck").append(warningTxt);
							$("#member_id").val('').focus();
							return false;
						}
						else {
							var warningTxt = '<font color="green">사용 가능한 아이디입니다.</font>';
							$("#idcheck").text('');
							$("#idcheck").show();
							$("#idcheck").append(warningTxt);
							$("#member_pass").val('').focus();
							return false;
						}
					},			
					error: function() { // 비동기 통신 실패.
						alert("data error.");
					}
				}); // ajax end
				return false;
			});
		
			// 아이디 조건 확인.
			function validate_userid(userId) {
				var pattern = new RegExp(/^[a-z][a-z0-9_]+$/);
				return pattern.test(userId);
			};	
		}); // $(function) 끝
	function mailChange(obj) {
		var m = document.getElementById("member_mail2");
		if( obj.value == "direct" ) {
			m.style.display = "inline";
		} else {
			m.style.display = "none";
		}
		if(f.member_mail3.value != ""){
			f.member_mail2.value = f.member_mail3.value;
		}
	}
		
	


</script>
</head>
<body>
<%@ include file="../include/header.jsp"%>
<div class="clear"></div>
<div id="join_article">
	<div id="join_topbar">
		<p style="text-align: center;">머리.</p>
	</div>
	<form name="f" method="post" action="join_ok.do" onsubmit="return mem_check()">
			<table id="join_t">
				<tr>
					<th>회원명</th>
					<td> <input type="text" name="member_name" id="member_name" size="14" /> </td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="member_id" id="member_id" size="14" />
						<input type="button" value="중복 체크" id="idcheck_btn" />
						<br>
						<!-- 경고문이 출력되는 위치 -->
						<span id="idcheck"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td> <input type="password" name="member_pass" id="member_pass" size="14" /> 영문, 숫자 포함 8자 이상, 특수 문자 포함</td>
				</tr>	
				<tr>
					<th>비밀번호 확인</th>
					<td> <input type="password" name="member_pass2" id="member_pass2" size="14" /> </td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" name="birth_year" id="birth_year" size="4">/
						<input type="text" name="birth_month" id="birth_month" size="4">/
						<input type="text" name="birth_day" id="birth_day" size="4">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="member_mail1" id="member_mail1" size="20"> @ 
						<input type="text" name="member_mail2" id="member_mail2" style="display: none;">
						<select name="member_mail3" id="member_mail3" onchange="mailChange(this)">
							<option value="" selected="selected">이메일 선택</option>
							<option value="direct">직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>
						<input type="text" name="member_zip1" id="member_zip1" size="3" readonly onclick="post_search()" />
						<input type="text" name="member_zip2" id="member_zip2" size="3" readonly onclick="post_search()" />
						<input type="button" value="우편번호 찾기" onclick="post_checks()"/>
						<!-- 
						<input type="button" value="우편번호 찾기" onclick="post_check()"/>
						 -->
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="member_addr1" id="member_addr1" size="50" readonly onclick="post_search()" />
					</td>
				</tr>
				<tr>	
					<th>나머지 주소</th>
					<td>
						<input type="text" name="member_addr2" id="member_addr2" size="40" />
					</td>
				</tr>
				<tr>
					<th>비밀번호 힌트</th>
					<td>
						<select name="password_question" id="password_question">
							<option value="" selected="selected">질문을 선택해주세요</option>
							<option value="1">태어난 곳은 어디입니까?</option>
							<option value="2">싫어하는 물건은 무엇입니까?</option>
							<option value="3">인상깊은 문구는 무엇입니까?</option>
							<option value="4">좋아하는 음식은 무엇입니까?</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>비밀번호 대답</th>
					<td>
						<input type="text" name="password_answer" id="password_answer" size="40" />
					</td>
				</tr>
			</table>	
	<div id="join_bottom">
		<input type="submit" style="margin: 25px auto;" value="가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="뒤로" onclick="location.href='join_2.do'" style="margin: 25px auto;">
	</div>
	</form>
</div>
</body>
</html>












