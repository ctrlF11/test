package com.controller.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





public class FrontController extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		// getRequestURI() : 받은 주소값(uri 창에 나타난 주소)의 "프로젝트명+파일명"을 반환.
		String uri = request.getRequestURI(); // -> /1117 - MVC2/*.do
		// getContextPath() : 현재 프로젝트명을 반환.
		String path = request.getContextPath(); // /1117 - MVC2
		String command = uri.substring(path.length()); // -> /*.do
		ActionForward forward = null;
		Action action = null;
		
		//java.util.Properties 객체 생성.
		Properties prop = new Properties();
		
		FileInputStream fis = new FileInputStream
				("D:\\kit\\val\\class\\src\\com\\controller\\action\\mapping.properties");
	
		//mapping.properties를 읽어들임.
		//입력 바이트 스트림을 properties로 읽어들인다.
		prop.load(fis);
		
		// FileInputStream 개체는 resource를 해제시켜주어야 함.
		fis.close();
		
		// 해당 명령어(/*.do)와 매핑된 클래스 이름을 반환함.
		// mapping.properties에서 *.do=(이 부분을 받아옴.)
		String value = prop.getProperty(command);
		
		// *.do로 들어온 경우.
		// value에 execute가 있는감.
		if(value.substring(0, 7).equals("execute"))
		{
			try {
				// |를 기준으로 구별함.5
				StringTokenizer st = new StringTokenizer(value, "|");
				String url_1 = st.nextToken(); // execute
				String url_2 = st.nextToken(); // 패키지명.클래스명
				Class url = Class.forName(url_2); // com.action.**.**
				action = (Action)url.newInstance(); // 새 객체를 Action 인터페이스 클래스로 생성.
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (InstantiationException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IllegalAccessException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		else { // view page
			forward = new ActionForward();
			forward.setRedirect(false); // *.jsp 페이지로 이동
			forward.setPath(value);
			// 회원가입하려면 *.do로 넘기긴 해야 하는게 곧바로 넘길 필요는 없음.
			// 굳이 action 페이지를 만들어줄 필요는 없음.
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher
							(forward.getPath());
				dispatcher.forward(request, response);
			}
		}	

		// execute 메소드를 실행하는 것이 FrontController의 역할.
		
	}
	
	
}
