<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.faq.model.*"%>
<%@ page import="java.util.*"%>


<link rel="stylesheet" type="text/css" href="./css/faq.css">
<%
	request.setCharacterEncoding("UTF-8");
	int rowsize = (Integer)request.getAttribute("rowsize");
	int block = (Integer)request.getAttribute("block");
	int nowPage = (Integer)request.getAttribute("page");
	int start = (Integer)request.getAttribute("start");
	int end = (Integer)request.getAttribute("end");
	int totalRecord = (Integer)request.getAttribute("totalRecord");
	int allPage = (Integer)request.getAttribute("allPage");
	int startPage = (Integer)request.getAttribute("startPage");
	int endPage = (Integer)request.getAttribute("endPage");
	int faqNumber = (Integer)request.getAttribute("faqNumber");
	
	List<faqVO> faqList = (List<faqVO>)request.getAttribute("LIST");
	  // 게시판의 목록을 가져온다.
	  // getfaqList()메소드는 BoardDAO 클래스에 목록을 가져올 수
	  // 있는 내용을 메소드를 작성한다.
	  
	  // 포트폴리오
	  // 개발 과정, 계획, 전문성, 목적성, 완성 과정, 결과, 처음 생각한 대로 됐나?
	  // 
	  // 
%> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../js/faq.js"></script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서관 - FAQ</title>
</head>
<%@ include file="../a_include/admin_header.jsp" %>
<div class="clear"></div>
<div id="faq_articles">
	<%@ include file="../a_include/gongji_leftmenubar.jsp" %>
	<div id="faq_menu">
		<div id="faq_topmenu">
			<ul>
				<li><a href="admin_faq1.do"> 회원 관련 </a></li>
				<li><a href="admin_faq2.do"> 이용 관련 </a></li>
				<li><a href="admin_faq3.do"> 도서 관련 </a></li>
				<li><a href="admin_faq4.do"> 블라 블라 </a></li>
			</ul>
		</div>
		<form>
			<div id="faq_body">
			<%
				if((faqList != null) && (faqList.size()>0 ))
				{
	        %>
					<ul class="faq_board">
						<li class="question" id="Q1"> 
							<p class="Q"><a href="#Q1"> Q. <input type="text" name="faqQ" value="<%= faqList.get(0).getQuestion() %>" > </a> </p>
							<p class="A"><input type="text" name="faqA" value="<%= faqList.get(0).getAnswer() %>" > </p>
						</li>
					<% if(faqList.size()>1) { %>
						<li class="question" id="Q1"> 
							<p class="Q"><a href="#Q1"> Q. <input type="text" name="faqQ" value="<%= faqList.get(1).getQuestion() %>" > </a> </p>
							<p class="A"><input type="text" name="faqA" value="<%= faqList.get(1).getAnswer() %>" > </p>
						</li>					
					<%} if(faqList.size()>2) { %>
						<li class="question" id="Q1"> 
							<p class="Q"><a href="#Q1"> Q. <input type="text" name="faqQ" value="<%= faqList.get(2).getQuestion() %>" > </a> </p>
							<p class="A"><input type="text" name="faqA" value="<%= faqList.get(2).getAnswer() %>" > </p>
						</li>
					<%} if(faqList.size()>3) { %>
						<li class="question" id="Q1"> 
							<p class="Q"><a href="#Q1"> Q. <input type="text" name="faqQ" value="<%= faqList.get(3).getQuestion() %>" > </a> </p>
							<p class="A"><input type="text" name="faqA" value="<%= faqList.get(3).getAnswer() %>" > </p>
						</li>
					<%} if(faqList.size()>4) { %>
						<li class="question" id="Q1"> 
							<p class="Q"><a href="#Q1"> Q. <input type="text" name="faqQ" value="<%= faqList.get(4).getQuestion() %>" > </a> </p>
							<p class="A"><input type="text" name="faqA" value="<%= faqList.get(4).getAnswer() %>" > </p>
						</li>
					<%} if(faqList.size()>5) { %>
						<li class="question" id="Q1"> 
							<p class="Q"><a href="#Q1"> Q. <input type="text" name="faqQ" value="<%= faqList.get(5).getQuestion() %>" > </a> </p>
							<p class="A"><input type="text" name="faqA" value="<%= faqList.get(5).getAnswer() %>" > </p>
						</li>
					<%} if(faqList.size()>6) { %>
						<li class="question" id="Q1"> 
							<p class="Q"><a href="#Q1"> Q. <input type="text" name="faqQ" value="<%= faqList.get(6).getQuestion() %>" > </a> </p>
							<p class="A"><input type="text" name="faqA" value="<%= faqList.get(6).getAnswer() %>" > </p>
						</li>
					<%} if(faqList.size()>7) { %>
						<li class="question" id="Q1"> 
							<p class="Q"><a href="#Q1"> Q. <input type="text" name="faqQ" value="<%= faqList.get(7).getQuestion() %>" > </a> </p>
							<p class="A"><input type="text" name="faqA" value="<%= faqList.get(7).getAnswer() %>" > </p>
						</li>
					<%} %>
					</ul> <!-- faqbody end -->
			<% }
			 else {%>
				<li>
					<p> 목록이 없습니다. </p>
				</li>
			<% }%>
				<li>
					<input type="hidden" name="nowPage" value="<%= nowPage %>">
				</li>
			</div>
		</form>
		<div id="faq_bottom">
			<ul>
				<%
					if(nowPage > block)
					{
						switch(faqNumber)
						{
							case 1:
								%>
								[<a href="admin_faq1.do?page=1">◀◀</a>]
								[<a href="admin_faq1.do?page=<%=startPage-1%>">◀</a>]
								<%	break;
							case 2:
								%>
								[<a href="admin_faq2.do?page=1">◀◀</a>]
								[<a href="admin_faq2.do?page=<%=startPage-1%>">◀</a>]
								<%	break;
							case 3:
								%>
								[<a href="admin_faq3.do?page=1">◀◀</a>]
								[<a href="admin_faq3.do?page=<%=startPage-1%>">◀</a>]
								<%	break;
							case 4:
								%>
								[<a href="admin_faq4.do?page=1">◀◀</a>]
								[<a href="admin_faq4.do?page=<%=startPage-1%>">◀</a>]
								<%	break;
						}%>
					<%}%>
					<%
						for(int i=startPage;i<=endPage;i++) {
							if(i == nowPage)
							{%>
								 <%=i %> 
								
							<%} else { 							
									switch(faqNumber)
									{
									case 1:
										%>
											[<a href="admin_faq1.do?page=<%=i %>"><%=i %></a>]
										<% break;
									case 2:
										%>
											[<a href="admin_faq2.do?page=<%=i %>"><%=i %></a>]
										<% break;
									case 3:
										%>
											[<a href="admin_faq3.do?page=<%=i %>"><%=i %></a>]
										<% break;
									case 4:
										%>
											[<a href="admin_faq4.do?page=<%=i %>"><%=i %></a>]
										<% break;
									}%>
					<%}
					}
					if(endPage > allPage)
					{
						switch(faqNumber)
						{
							case 1:
								%>
								[<a href="admin_faq1.do?page=<%=endPage+1 %>">▶</a>]
								[<a href="admin_faq1.do?page=<%=allPage %>">▶▶</a>]
								<%	break;
							case 2:
								%>
								[<a href="admin_faq2.do?page=<%=endPage+1 %>">▶</a>]
								[<a href="admin_faq2.do?page=<%=allPage %>">▶▶</a>]
								<%	break;
							case 3:
								%>
								[<a href="admin_faq3.do?page=<%=endPage+1 %>">▶</a>]
								[<a href="admin_faq3.do?page=<%=allPage %>">▶▶</a>]
								<%	break;
							case 4:
								%>
								[<a href="admin_faq4.do?page=<%=endPage+1 %>">▶</a>]
								[<a href="admin_faq4.do?page=<%=allPage %>">▶▶</a>]
								<%	break;
						}%>
					<%}%>
		
			</ul>
			<ul style="text-align: left;">
				<li>
					<% switch(faqNumber)
						{
							case 1:
								%>
								<input type="button" onclick="javascript:document.location.href='admin_faqAdd.do?no=1'" value="추가"
								style="float: right; margin-right: 10px;">
								<%	break;
							case 2:
								%>
								<input type="button" onclick="javascript:document.location.href='admin_faqAdd.do?no=2'" value="추가"
								style="float: right; margin-right: 10px;">
								<%	break;
							case 3:
								%>
								<input type="button" onclick="javascript:document.location.href='admin_faqAdd.do?no=3'" value="추가"
								style="float: right; margin-right: 10px;">
								<%	break;
							case 4:
								%>
								<input type="button" onclick="javascript:document.location.href='admin_faqAdd.do?no=4'" value="추가"
								style="float: right; margin-right: 10px;">
								<%	break;
						}%>
					
				</li>
			</ul>
		</div>
	</div>	
</div>
</html>