package com.admin.action.gongji;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.adminDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;


public class gongjiWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
	
		String gongji_title = request.getParameter("gongji_title");
		String gongji_cont = request.getParameter("gongji_cont");
		
		adminDAO dao = new adminDAO();
		
		int check = dao.insertGongji(gongji_title, gongji_cont);
		
		PrintWriter out = response.getWriter();
		if(check == 1) {
			out.print("<script>");
			out.print("alert('작성 실패.');");
			out.print("return history.back();");
			out.print("</script>");
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./admin_gongji_list.do");
		return forward;
	}
}
