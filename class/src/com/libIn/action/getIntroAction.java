package com.libIn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.libIn.model.libInDAO;

public class getIntroAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String main_check = request.getRequestURL().toString();
		main_check = main_check.substring(28).trim();
		String sub_check = main_check.substring(0, 1);
		System.out.println(main_check.substring(0, 1));
		System.out.println(sub_check);
		libInDAO dao = new libInDAO();
		String ret = null;
		if(sub_check.equals("l")) {
			ret = dao.getLibCon();			
		} else if(sub_check.equals("f")) {
			ret = dao.getFacilCon();
		} else if(sub_check.equals("b")) {
			ret = dao.getBorrowCon();
		}
		
		request.setAttribute("ret", ret);
		
		ActionForward forward = new ActionForward();
		
		if(sub_check.equals("l")) {
			forward.setRedirect(false);
			forward.setPath("./libs/lib_intro.jsp");
			return forward;
		} else if(sub_check.equals("f")) {
			forward.setRedirect(false);
			forward.setPath("./libs/facil_intro.jsp");
			return forward;
		} else if(sub_check.equals("b")) {
			forward.setRedirect(false);
			forward.setPath("./libs/borrow_intro.jsp");
			return forward;
		}
		
		return null;
	}

}
