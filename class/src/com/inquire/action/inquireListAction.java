package com.inquire.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.inquire.model.inquireVO;
import com.inquire.model.inquireDAO;

public class inquireListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String user_id = (String)request.getSession().getAttribute("id");
	
		
		inquireDAO dao = new inquireDAO();
		
		List<inquireVO> list = dao.getInquireList(user_id);
		
		
		request.setAttribute("LIST", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./gongji/inquire.jsp");
		
		return forward;
	}
}