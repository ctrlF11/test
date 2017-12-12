<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="./css/member.css">
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/member.js"></script>
<script type="text/javascript">
	function chk(){
		var req = document.form.req.checked;
		var num = 0;
		if(req == true){
			num = 1;
		}
		if(num == 1){
			document.form.submit();
		}else{
			alert("개인정보 약관에 동의하셔야 합니다.");
		}
	}
	
</script>


<div class="clear"></div>
<form action="join_2.do" name="form" method="post">
	<div id="join_article">
		<div id="join_topbar">
			<p style="text-align: center;">약관 동의.</p>
		</div>
		<div id="join_middle">
			<div class="terms">
				<textarea rows="30" cols="91">
					약관.
				</textarea>
			</div>
			<ul>
				<label><input type="checkbox" name="req" style="margin-left: 100px;">&nbsp;약관 동의</label>
			</ul>
		</div>
		<table id="join_bottom">
			<tr>
				<td align="center" valign="top">
					<img alt="계속" src="images/dongYee.png" onclick="chk()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img alt="뒤로" src="images/cancel.png" onclick="location.href='join_1.do'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</div>
</form>













