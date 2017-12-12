package com.libIn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.libIn.model.libInDAO;

public class floorIntroAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String main_check = request.getRequestURL().toString();
		main_check = main_check.substring(28).trim();
		int int_check = Integer.parseInt(main_check.substring(0, 1));
		System.out.println(main_check);
		libInDAO dao = new libInDAO();
		String ret = null;
		switch (int_check) {
			case 1: ret = dao.get1fCon(); break;
			case 2:	ret = dao.get2fCon(); break;
			case 3:	ret = dao.get3fCon(); break;
			case 4:	ret = dao.get4fCon(); break;
			default: break;
		}
	
		request.setAttribute("ret", ret);
		ActionForward forward = new ActionForward();
		switch (int_check) {
			case 1: forward.setRedirect(false); forward.setPath("./libs/1f_intro.jsp"); return forward;
			case 2: forward.setRedirect(false); forward.setPath("./libs/2f_intro.jsp"); return forward;
			case 3: forward.setRedirect(false); forward.setPath("./libs/3f_intro.jsp"); return forward;
			case 4: forward.setRedirect(false); forward.setPath("./libs/4f_intro.jsp"); return forward;
			default: break;
		}
		
	
		
		
		
		
		
		return null;
	}
	

}
