package com.admin.action.bookData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.adminDAO;
import com.admin.model.adminVO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class dataEditAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String no = request.getParameter("no");
		
		adminDAO dao = new adminDAO();
		adminVO vo = dao.getCont(no);
		
		request.setAttribute("VO", vo);
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./admin/data_edit.jsp");
		
		return forward;
	}

}
