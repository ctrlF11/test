<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String zipcode, addr1, addr2;
	String dong = (String)request.getAttribute("dong");
	List zipcodeList = (ArrayList)request.getAttribute("zipcodeList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호 검색</title>
<script type="text/javascript">
	function selectnow() {
		// select 객체에서 검색된 동을 선택했을 때 change 이벤트가 발생.
		// 현재 문서의 폼 이름의 바꿀 것의 이름.
		// 주소 받아오기.
		var zip = document.postform.post_list.value;
		
		// zip(주소)에서 앞의 3자리, 또 3자리 뜯어와야 함.
		var zip1 = zip.substring(0, 3);
		var zip2 = zip.substring(4, 7);
		// 주소 나머지.
		var addr = zip.substring(7);
		
		// 옆동네 프레임에다 우편번호 처음 3자리, 다음 3자리 넣음.
		opener.document.f.member_zip1.value = zip1;
		opener.document.f.member_zip2.value = zip2;
		opener.document.f.member_addr1.value = addr;
		
		// 우편번호 검색 창 종료.
		window.close();
	}
	function check(form) {
		if(form.dong.value == "")
		{
			alert("동을 입력하시오.");
			form.dong.focus();
			return false;
		}
	}		
		

</script>
<style type="text/css">
	input, select {
		font-family: Dotum;
		font-size: 9pt;
	}
	.style1 {
		color: #466D1B;
		font-weight: bold;
		font-size: 12px;
	}
</style>
</head>
<body onload="postform.dong.focus();" bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
	<form method="post" action="zipcode_ok.do" name="postform" onsubmit="return check(this)">
		<table border="0" width="414" height="100" align="center" cellspacing="0">
			<tr>
				<td bgcolor="#f5ffea" align="center">
					<font color="#466d1b">
						<span class="style1">[거주지의 면, 동을 입력하고 '찾기' 버튼을 누르세요.]</span>
					</font>
				</td>
			</tr>	
			<tr height="30">
				<td> 
					<input type="text" name="dong" size="10">&nbsp;
																							<!-- absmiddle : 무조건 가운데에 위치시켜라. -->
					<input type="button" width="69" height="19" align="absmiddle" value="검색">
				</td>
			</tr>
			<!-- 실제 검색된 우편번호를 부여주는 부분. -->
			<%
				if(dong != null) {
					if(zipcodeList != null)
					{%>
						<tr>
						<td bgcolor="#f5ffea" height="30" align="center" >
							<select name="post_list" onchange="selectnow()">
								<option value="">주소를 선택하세요.</option>
									<%
										for(int i=0;i<zipcodeList.size();i++)
										{
											String data = (String)zipcodeList.get(i);
											StringTokenizer st = new StringTokenizer(data, ",");
											zipcode = st.nextToken();
											addr1 = st.nextToken();
											addr2 = st.nextToken();
											String totalAddr = zipcode+addr1;%>
										<option value="<%= totalAddr%>">[<%=zipcode %>]&nbsp;<%=addr1 %></option>
										<%} %>
									
							</select>
							</td>
						</tr>
							
					<%} else {%>
						<tr>
							<td bgcolor="#f5ffea" height="30" align="center">
							<font color="#466d1b">
								<span class="style1">[검색 결과가 없음.]</span>
							</font>
						</tr>
					
				<%	}
				}
			%>
			<tr>
				<td bgcolor="#508C0F" colspan="3" height="3" > </td>
			</tr>
			
			
		</table>
	</form>
</body>
</html>
	
	
