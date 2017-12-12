package com.admin.action.gongji;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.adminDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class gongjiDelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String[] checkboxs = request.getParameterValues("gongji_del");
		
		adminDAO dao = new adminDAO();
		
		System.out.println(checkboxs.length);
		
		int check = dao.delGongji(checkboxs);
		
		
		PrintWriter out = response.getWriter();

		
		if(check == 1) {
			out.print("<script>");
			out.print("alert('삭제 완료.');");
			out.print("</script>");
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./admin_gongji_list.do");
			return forward;
		} else {
			out.print("<script>");
			out.print("alert('삭제 실패. 문의해주십시오.');");
			out.print("</script>");
		}
		
		return null;
	}

}
