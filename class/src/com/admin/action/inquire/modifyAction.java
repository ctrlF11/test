package com.admin.action.inquire;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.inquire.model.inquireDAO;
import com.inquire.model.inquireVO;

public class modifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		inquireDAO dao = new inquireDAO();
		int no = Integer.parseInt((String)request.getParameter("no"));
		
		inquireVO value = dao.getCont(no);
		
		request.setAttribute("value", value);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/inquire/inquire_modify.jsp");
		
		return forward;
	}

}
