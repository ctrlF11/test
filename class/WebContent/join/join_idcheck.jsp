<%@page import="com.join.model.joinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("userId");
	
	// DB 연동을 위한 객체 생성.
	joinDAO dao = new joinDAO();
	
	// 중복 아이디 체크 메소드 호출
	int result = dao.checkMemberId(id);
	// result = 1이면 중복, 아니면 사용가능.
			
	out.println(result);
%>