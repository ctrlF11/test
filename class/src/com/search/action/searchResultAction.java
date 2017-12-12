package com.search.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.search.model.searchDAO;
import com.search.model.searchVO;

public class searchResultAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String search_option = null; // 도서/작가/분류
		String select = null;
		String search_value = null; // 검색할 것들
		
		if(request.getParameter("search_option") != null) {
			search_option = request.getParameter("search_option");
		} else if (request.getParameter("search_option") == null) {
			search_option = "book_name";
		}
		
		if(request.getParameter("search_value") != null) {
			search_value = request.getParameter("search_value");
		}
		int select_year1 = 0; // 년도(짧은 쪽)
		int select_year2 = 3000; // 년도(긴 쪽)
		
		if(request.getParameter("select_year1") != null) {
			select_year1 = Integer.parseInt(request.getParameter("select_year1"));
		}
		if(request.getParameter("select_year2") != null) {
			select_year2 = Integer.parseInt(request.getParameter("select_year2"));
		}
		if(select_year1 > select_year2) {
			int index = select_year1;
			select_year1 = select_year2;
			select_year2 = index;
		}
		
		
		
		searchDAO dao = new searchDAO();
		
		List<searchVO> list = dao.searchBook(search_option, search_value, select_year1, select_year2);

		request.setAttribute("list", list);
		request.setAttribute("search_value", search_value);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./book/search_result.jsp");
		
		return forward;
	}

}
