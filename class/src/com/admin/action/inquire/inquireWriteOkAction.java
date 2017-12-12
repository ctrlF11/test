package com.admin.action.inquire;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bf.model.bfDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.gongji.model.gongjiDAO;
import com.inquire.model.inquireDAO;

public class inquireWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String inquire_title = request.getParameter("inquire_title");
		String inquire_question = request.getParameter("inquire_question");
		String inquire_content = request.getParameter("inquire_content");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		inquireDAO dao = new inquireDAO();
		
		int check = dao.inquireWrite(inquire_title, id, inquire_question, inquire_content);
		
		PrintWriter out =  response.getWriter();
		if(check == 1) {
			out.print("<script>");
			out.print("alert('작성 실패.');");
			out.print("return history.back();");
			out.print("</script>");
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./inquire.do");
		return forward;
	}

}
