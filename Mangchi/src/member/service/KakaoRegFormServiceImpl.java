package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;

public class KakaoRegFormServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		String kid = req.getParameter("id");
		req.setAttribute("kid", kid);
		
		return "/WEB-INF/views/member/kakaoReg.jsp";
	}

}
