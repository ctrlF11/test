package com.search.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.search.model.searchDAO;
import com.search.model.searchVO;


public class selectBookAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String book_name = request.getParameter("book_name");
		
		searchDAO dao = new searchDAO();
		
		List<searchVO> list = dao.getBookInfo(book_name);
		
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./book/book_info.jsp");
		
		return forward;
	}

}
