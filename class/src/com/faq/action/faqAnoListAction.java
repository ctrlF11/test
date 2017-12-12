package com.faq.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.faq.model.faqVO;
import com.faq.model.faqDAO;

import oracle.net.aso.f;

public class faqAnoListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		faqDAO dao = new faqDAO();
		int rowsize = 8;
		int block = 4;
		int page = 0;
		int faqNumber = 4;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		else {
			page = 1;
		}
		
		int start = (page*rowsize) - (rowsize-1);
		int end = (page*rowsize);
		
		int totalRecord = 0;
		int allPage = 0;
		
		int startPage = (((page-1) / block) * block) + 1;
		int endPage = (((page-1) / block) * block) + block;
		
		totalRecord = dao.getAnoListCount();
		allPage = (int)Math.ceil(totalRecord/(double)rowsize);
		
		if(endPage > allPage) {
			endPage = allPage;
		}

		List<faqVO> list = dao.getAnoFaqList(page, rowsize);
		
		request.setAttribute("LIST", list);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("page", page);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("faqNumber", faqNumber);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./gongji/faq.jsp");
		
		return forward;
	}
	

}