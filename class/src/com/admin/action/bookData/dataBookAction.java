package com.admin.action.bookData;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.adminDAO;
import com.admin.model.adminVO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class dataBookAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 책, 전자자료, 등을 삽입/삭제/수정
		int rowsize = 8;
		int block = 5;
		int page = 0;
	
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else { 
			page = 1;
		}
		
		int start = (page*rowsize) - (rowsize-1);
		int end = (page*rowsize);
		
		int startPage = (((page-1) / block) * block) + 1;
		int endPage = (((page-1) / block) * block) + block;
		
		int totalRecord = 0;
		int allPage = 0;
		adminDAO dao = new adminDAO();

		totalRecord = dao.getListCount("b");
		
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		if(endPage > allPage) {
			endPage = allPage;
		}
		
		
		
		
		List<adminVO> list = dao.getBookData(page, rowsize);
		
		request.setAttribute("line", "b");
		request.setAttribute("LIST", list);
		request.setAttribute("page", page);
		request.setAttribute("block", block);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("allPage", allPage);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/admin_manage.jsp");
		return forward;
	}
}
