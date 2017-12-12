package com.join.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.action.Action;
import com.controller.action.ActionForward;
import com.join.model.joinDAO;
import com.join.model.memberVO;

public class joinOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String name = request.getParameter("member_name").trim();
		String id = request.getParameter("member_id").trim();
		String password = request.getParameter("member_pass").trim();
		String email1 = request.getParameter("member_mail1").trim();
		String email2 = request.getParameter("member_mail2").trim();
				
				/*null;
		if(request.getParameter("member_mail2").trim() != null) {
			email2 = request.getParameter("member_mail3").trim();
		} else {
			email2 = "@" + request.getParameter("member_mail2").trim();
		}*/
		
		String birth1 = request.getParameter("birth_year");
		String birth2 = request.getParameter("birth_month");
		String birth3 = request.getParameter("birth_day");
		String zip1 = request.getParameter("member_zip1");
		String zip2 = request.getParameter("member_zip2");
		String addr1 = request.getParameter("member_addr1").trim();
		String addr2 = request.getParameter("member_addr2").trim();
		String password_question = request.getParameter("password_question");
		String password_answer = request.getParameter("password_answer").trim();
		
		memberVO vo = new memberVO();
		
		vo.setName(name);
		vo.setId(id);
		vo.setPassword(password);
		vo.setEmail(email1+'@'+email2);
		
		vo.setBirth1(birth1);
		vo.setBirth2(birth2);
		vo.setBirth3(birth3);
		vo.setZip1(zip1);
		vo.setZip2(zip2);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setPassword_question(password_question);
		vo.setPassword_answer(password_answer);
		
		joinDAO dao = new joinDAO();
		dao.insertMember(vo);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./login.do");
		
		
		
		return forward;
	}

}
