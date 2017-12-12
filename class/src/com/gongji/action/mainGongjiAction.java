package com.gongji.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.gongji.model.gongjiDAO;
import com.gongji.model.gongjiVO;

public class mainGongjiAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		gongjiDAO dao = new gongjiDAO();
		
		int rowsize = 100;
		int page = 1;
		
		List<gongjiVO> list = dao.getMainList(page, rowsize);
		
		request.setAttribute("LIST", list);
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		
		String main_check = request.getHeader("referer");
		main_check = main_check.substring(28).trim();

		
		
		HttpSession session = request.getSession();
		
		
		
		int state = 0;
		
		
		if(session.getAttribute("id_state") != null) {
			int id_state = (int)session.getAttribute("id_state");
			System.out.println("id_state : "+id_state);
			state = id_state;
		} else if(main_check.substring(0, 5).equals("admin")) {
			state = 3;
			System.out.println(state);
		} else if(main_check.substring(0, 5).equals("admin") && session.getAttribute("id_state") == null) {
			state = 3;
			System.out.println(state);
		}
		System.out.println(session.getAttribute("id"));
		System.out.println(session.getAttribute("id_state"));
		System.out.println(main_check.substring(0, 5));
		
		
		session.setAttribute("id_state", session.getAttribute("id_state"));
		
		
		
		ActionForward forward = new ActionForward();
		if(state == 0) {
			forward.setRedirect(false);
			forward.setPath("./index2.jsp");
		} else if (state == 1) {
			forward.setRedirect(false);
			forward.setPath("./admin/admin_index.jsp");
		} else if(state == 3){
			forward.setRedirect(false);
			forward.setPath("./index.jsp");
		}
		
		return forward;
	}

}
