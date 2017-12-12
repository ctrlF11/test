package com.bf.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bf.model.bfDAO;
import com.bf.model.bfVO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class facilTimeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int facil_no = Integer.parseInt(request.getParameter("facil_no"));
		
	
		
		bfDAO dao = new bfDAO();

		dao.delFacil(facil_no);
		
		List<bfVO> list = dao.getFacil(facil_no);
		
		request.setAttribute("LIST", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./bf/facil_window.jsp");
		
		return forward;
	}
	
	

}
