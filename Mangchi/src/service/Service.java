package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {

	String getViewPage(HttpServletRequest req, HttpServletResponse resp);

	
	
}
