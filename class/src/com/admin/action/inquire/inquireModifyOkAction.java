package com.admin.action.inquire;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.adminDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;


public class inquireModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
	
		String inquire_title = request.getParameter("inquire_title");
		String inquire_cont = request.getParameter("inquire_cont");
		int inquire_no = Integer.parseInt((String)request.getParameter("inquire_no"));
		
		adminDAO dao = new adminDAO();
		
		System.out.println(inquire_title);
		System.out.println(inquire_cont);
		System.out.println(inquire_no);
		
		int check = dao.updateInquire(inquire_title, inquire_cont, inquire_no);
		
		PrintWriter out = response.getWriter();
		if(check == 1) {
			out.print("<script>");
			out.print("alert('작성 실패.');");
			out.print("return history.back();");
			out.print("</script>");
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./admin_inquire.do");
		return forward;
	}
}
