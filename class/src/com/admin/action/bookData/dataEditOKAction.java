package com.admin.action.bookData;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.adminDAO;
import com.admin.model.adminVO;
import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.gongji.model.gongjiDAO;

public class dataEditOKAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int book_group = Integer.parseInt(request.getParameter("book_group"));
		String book_name = request.getParameter("book_name");
		String book_writer = request.getParameter("book_writer");
		String book_category = null;
		if(request.getParameter("book_category").equals("도서")) {
			book_category = "b";
		} else if(request.getParameter("book_category").equals("간행물")) {
			book_category = "p";
		} else if(request.getParameter("book_category").equals("전자도서")) {
			book_category = "q";
		}
		
		
		String book_number = request.getParameter("book_number");
		int book_year = Integer.parseInt(request.getParameter("book_year"));
		String book_image = request.getParameter("book_image");
		String origin_Bnum = request.getParameter("origin_Bnum"); // hidden
		
		adminVO vo = new adminVO();
		vo.setBook_group(book_group);
		vo.setBook_name(book_name);
		vo.setBook_writer(book_writer);
		vo.setBook_category(book_category);
		vo.setBook_number(book_number);
		vo.setBook_year(book_year);
		vo.setBook_image(book_image);
		
		adminDAO dao = new adminDAO();
		
		
		int check = dao.dataEdit(vo, origin_Bnum);
		PrintWriter out = response.getWriter();
		
		if(check == 1) {
			out.print("<script>");
			out.print("alert('수정 실패.');");
			out.print("return history.back();");
			out.print("</script>");
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./admin_data_edit.do?no="+book_number);
		
		return forward;
	}

	
	
}
