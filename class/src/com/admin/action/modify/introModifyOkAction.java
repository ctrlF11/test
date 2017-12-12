package com.admin.action.modify;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.adminDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class introModifyOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String intro = request.getParameter("intro").trim();
		
		adminDAO dao = new adminDAO();
		
		String uri = request.getHeader("referer").substring(28, 29);
		String intro_value = null;
		
		int check = -1;

		if(uri.equals("l")) {
			intro_value = "intro_lib";
		} else if(uri.equals("1")) {
			intro_value = "intro_1f";
		} else if(uri.equals("2")) {
			intro_value = "intro_2f";
		} else if(uri.equals("3")) {
			intro_value = "intro_3f";
		} else if(uri.equals("4")) {
			intro_value = "intro_4f";
		} else if(uri.equals("f")) {
			intro_value = "intro_facil";
		} else if(uri.equals("b")) {
			intro_value = "intro_borrow";
		}
		check = dao.updateIntro(intro_value, intro);
	
		PrintWriter out = response.getWriter();
		if(check == 1) {
			out.print("<script>");
			out.print("alert('업데이트 성공.');");
			out.print("</script>");
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./admin_main.do");
			return forward;
		} else {
			out.print("<script>");
			out.print("alert('업데이트 실패.');");
			out.print("history.back();");
			out.print("</script>");
		}
		
		return null;
	}

}
