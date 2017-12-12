package com.bf.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bf.model.bfDAO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class facilSubmitAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		double f_hour = Float.parseFloat(request.getParameter("checkboxs"));
		double times = Float.parseFloat(request.getParameter("times"));
		int f_number = Integer.parseInt(request.getParameter("facil_number"));
		int f_dayUp = Integer.parseInt(request.getParameter("days"));
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		System.out.println(f_dayUp);
		
		bfDAO dao = new bfDAO();
		int testing = dao.insertFacilTime(f_hour, times, f_number, f_dayUp, user_id);
		
		//1이 성공
		ActionForward forward = new ActionForward();


		if(testing == 1) {
			out.print("<script>");
			out.print("alert('예약 완료.')");
			out.print("</script>");
			forward.setRedirect(true);
			forward.setPath("./facil_reserve.do");
		} else {
			out.print("<script>");
			out.print("alert('예약 실패.')");
			out.print("</script>");
			forward.setRedirect(true);
			forward.setPath("./facil_reserve.do");
		}
		
		return forward;
	}

}
