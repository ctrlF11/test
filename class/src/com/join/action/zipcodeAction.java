package com.join.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.join.model.joinDAO;

public class zipcodeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String dong = request.getParameter("dong").trim();
		
		joinDAO dao = new joinDAO();
		List zipcodeList = dao.searchZipcode(dong);
		
		request.setAttribute("zipcodeList", zipcodeList);
		request.setAttribute("dong", dong);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./join/join_zipcode.jsp");
		return forward;
	}
}
