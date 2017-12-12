package com.controller.action;
/*
	ActionForward
	1. Action 인터페이스에서 리턴타입으로 사용되는 클래스.
	2. isRedirect() 메소드
	   - jsp 페이지(false)
	   - *.do 페이지(true)
	3. Path() 메소드 : 파일 경로명 지정 속성.
 */
public class ActionForward {
	
	private boolean isRedirect = false;
	private String path = null;
	
	public boolean isRedirect()
	{
		return isRedirect;
	}
 
	public String getPath() {
		return path;
	}

	public void setRedirect(boolean b) {
		isRedirect = b;
	}
	
	public void setPath(String string) {
		path = string;
	}
	

}
