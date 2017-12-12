package com.admin.action.bf;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.adminDAO;
import com.admin.model.adminVO;
import com.controller.action.Action;
import com.controller.action.ActionForward;

public class getBwListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		adminDAO dao = new adminDAO();
		int rowsize = 15; // 페이지 개수
		int block = 5; // 밑 리스트 개수
		int page = 0;
		
		int totalRecord = 0;
		int allPage = 0;

		totalRecord = dao.getBwListCount();		
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		
		if(request.getParameter("page") != null) {
			if(isNumber((String)request.getParameter("page")) == true) {
				page = Integer.parseInt(request.getParameter("page"));
			}
		} else { 
			page = allPage;
		}
			
		int start = (page*rowsize) - (rowsize-1);
		int end = (page*rowsize);
		
		int startPage = (((page-1) / block) * block) + 1;
		int endPage = (((page-1) / block) * block) + block;
		
		
		
		if(endPage > allPage) {
			endPage = allPage;
		}
		
		
		List<adminVO> list = dao.getBwList(page, allPage, rowsize, totalRecord);
		
		Collections.reverse(list);
		
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("block", block);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("allPage", allPage);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/bf/bw_list.jsp");
		
		return forward;
	}

	public boolean isNumber(String str) {
		boolean check = false;
		
		try {
			Double.parseDouble(str);
			check = true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return check;
	}
	
}
