package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.member.model.memberDAO;
import com.member.model.memberVO;

import oracle.net.aso.i;

public class memberLoginOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		memberDAO dao = new memberDAO();
		int result = dao.userCheck(id, pass);
		
		if(result == 1) {
			memberVO vo = dao.getMember(id);
			String name = vo.getName();
			int id_state = vo.getId_state();
			int state = 0;
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			ActionForward forward = new ActionForward();
			if(vo.getId_state() == 0) {
				state = 0;
				session.setAttribute("id_state", state);
				forward.setRedirect(true);
				forward.setPath("./main.do");
				return forward;
			} else if(vo.getId_state() == 1) {
				state = 1;
				session.setAttribute("id_state", state);
				forward.setRedirect(true);
				forward.setPath("./admin_main.do");
				return forward;
			} else if(vo.getId_state() == 2) {
				out.println("<script>");
				out.println("alert('삭제된 아이디입니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else if(result == 0) { // 비밀번호 오류
			out.println("<script>");
			out.println("alert('비밀번호 오류.')");
			out.println("history.back()");
			out.println("</script>");
		} else if(result ==  -1) { // 아이디 없음
			out.println("<script>");
			out.println("alert('없는 아이디입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return null;
	}

}
