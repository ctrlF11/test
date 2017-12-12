package com.admin.action.inquire;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.gongji.model.gongjiDAO;
import com.gongji.model.gongjiVO;
import com.inquire.model.inquireVO;
import com.inquire.model.inquireDAO;

public class inquireContAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		int no = Integer.parseInt(request.getParameter("no"));
		int nop = no+1;
		int nom = no-1;
		inquireDAO dao = new inquireDAO();
		
		dao.inquireHit(no);
		inquireVO vo = dao.getCont(no);
		inquireVO vop = dao.getCont(nop);
		inquireVO vom = dao.getCont(nom);
		
		request.setAttribute("VO", vo);
		request.setAttribute("VOp", vop);
		request.setAttribute("VOm", vom);
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./admin/inquire/inquire_cont.jsp");
		
		return forward;
	}
	
}
