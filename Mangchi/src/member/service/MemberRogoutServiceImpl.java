package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;

public class MemberRogoutServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		req.getSession().invalidate();
		
		return "/WEB-INF/views/member/logoutChk.jsp";
	}
	
}
