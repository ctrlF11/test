package com.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 	Action 페이지의 특징.
 	1. servlet 클래스를 작성할 경우 Action 인터페이스를 상속받아서 구현한다.
 	2. execute() 메소드를 재정의(override)하여 servlet 클래스를 작성한다. 
	   이 때 요청에 대한 처리는 request로, 응답에 대한 처리는 response로 함.
	3. return type이 ActionForward 타입으로 view page를 지정할 경우
	   setRedirect()와 setPath()를 이용한다.
 */

public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception	;
	
}
