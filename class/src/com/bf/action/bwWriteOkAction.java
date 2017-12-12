package com.bf.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bf.model.bfDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.bf.model.bfDAO;
import com.bf.model.bfVO;

public class bwWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		String bw_title = request.getParameter("bw_title");
		String bw_name = request.getParameter("bw_name");
		String bw_cont = request.getParameter("bw_cont");
		String bw_pass = request.getParameter("bw_pass");
		
		bfDAO dao = new bfDAO();
		
		int check = dao.insertBw(bw_title, bw_name, bw_cont, id, bw_pass);
		
		PrintWriter out =  response.getWriter();
		if(check == 1) {
			out.print("<script>");
			out.print("alert('작성 실패.');");
			out.print("return history.back();");
			out.print("</script>");
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./book_want.do");
		return forward;
	}
}
