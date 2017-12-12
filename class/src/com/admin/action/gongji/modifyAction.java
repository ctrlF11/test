package com.admin.action.gongji;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.gongji.model.gongjiDAO;
import com.gongji.model.gongjiVO;

public class modifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		gongjiDAO dao = new gongjiDAO();
		int no = Integer.parseInt((String)request.getParameter("no"));
		
		gongjiVO value = dao.getCont(no);
		
		request.setAttribute("value", value);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/gongji/gongji_modify.jsp");
		
		return forward;
	}

}
