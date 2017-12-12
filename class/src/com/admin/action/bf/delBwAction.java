package com.admin.action.bf;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.adminDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class delBwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String[] checkboxs = request.getParameterValues("bw_del");
		
		adminDAO dao = new adminDAO();
		
		int check = dao.delBw(checkboxs);
		
		
		PrintWriter out = response.getWriter();
		
		System.out.println(check);
		
		if(check == 1) {
			out.print("<script>");
			out.print("alert('삭제 완료.');");
			out.print("</script>");
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./admin_book_want_list.do");
			return forward;
		} else {
			out.print("<script>");
			out.print("alert('삭제 실패. 문의해주십시오.');");
			out.print("</script>");
		}
		
		return null;
	}

}
