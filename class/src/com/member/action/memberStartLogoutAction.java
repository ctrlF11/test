package com.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.gongji.model.gongjiDAO;
import com.gongji.model.gongjiVO;

public class memberStartLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
	
		
		HttpSession session = request.getSession();
		session.invalidate();

		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("location.replace('main.do');");
		out.print("</script>");
		
		return null;
	}
	

}
