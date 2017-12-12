package com.admin.action.bf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bf.model.bfDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class facilAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		bfDAO dao = new bfDAO();
		
		int count = dao.getFacilCount();
		
		request.setAttribute("COUNT", count);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/bf/facil_rCheck.jsp");
				
		return forward;
	}

}
