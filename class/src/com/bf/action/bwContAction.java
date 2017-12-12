package com.bf.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bf.model.bfDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.bf.model.bfDAO;
import com.bf.model.bfVO;

public class bwContAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		int no = Integer.parseInt(request.getParameter("no"));
		int page;
		if(isNumber((String)request.getParameter("page")) == true) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}

		
		int nop = no+1;
		int nom = no-1;
		bfDAO dao = new bfDAO();
		
		dao.bookHit(no);
		bfVO vo = dao.getCont(no);
		bfVO vop = dao.getCont(nop);
		bfVO vom = dao.getCont(nom);
		
		request.setAttribute("VO", vo);
		request.setAttribute("VOp", vop);
		request.setAttribute("VOm", vom);
		request.setAttribute("backPage", page);
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./bf/book_cont.jsp");
		
		return forward;
	}
	
	public boolean isNumber(String str) {
		boolean check = false;
		
		try {
			Double.parseDouble(str);
			check = true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return check;
	}
	
}
