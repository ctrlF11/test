package com.admin.action.bf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bf.model.bfDAO;
import com.bf.model.bfVO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class facilTimeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int facil_no = Integer.parseInt(request.getParameter("facil_no"));
		int seldate = 1;
		
		if(request.getParameter("seldate") != null) {
			seldate = Integer.parseInt(request.getParameter("seldate"));
		}
	
		
		bfDAO dao = new bfDAO();

		dao.delFacil(facil_no);
		List<bfVO> list = null;
		if(seldate == 1) {
			list = dao.getFacil(facil_no);
		} else {
			list = dao.getFacilA(facil_no, seldate);
		}
		
		
		request.setAttribute("LIST", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/bf/facil_rWindow.jsp");
		
		return forward;
	}
	
	

}
