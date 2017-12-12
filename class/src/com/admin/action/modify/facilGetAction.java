package com.admin.action.modify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.adminDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class facilGetAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		adminDAO dao = new adminDAO();
		String intro = "intro_facil";
		
		String value = dao.getIntro(intro);
		
		request.setAttribute("value", value);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/intro/facil_intro_modify.jsp");
		
		return forward;
	}

}
