package com.admin.action.bookData;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.adminDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class dataDelAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String book_no = request.getParameter("no");

		adminDAO dao = new adminDAO();
				

		int check = dao.deleteBook(book_no);
		
		PrintWriter out = response.getWriter();
		
		if(check == 1) {
			out.print("<script>");
			out.print("alert('삭제 완료.');");
			out.print("</script>");
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./admin_manage_a.do");
			return forward;
		} else {
			out.print("<script>");
			out.print("alert('삭제 실패. 문의해주십시오.');");
			out.print("</script>");
		}
		
		return null;
	}

}
