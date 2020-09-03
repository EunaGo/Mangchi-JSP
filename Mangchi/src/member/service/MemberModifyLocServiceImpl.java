package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;

public class MemberModifyLocServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		if(idx == 1) {
			
			req.setAttribute("idx", idx);

			return "/WEB-INF/views/member/memberModify.jsp";
		} else if(idx == 2) {
			
			req.setAttribute("idx", idx);

			return "/WEB-INF/views/member/memberModify.jsp";
		} else if(idx == 3) {
			
			req.setAttribute("idx", idx);
			return "/WEB-INF/views/member/memberModify.jsp";
		} else {
			try {
			throw new Exception();
			
			} catch(Exception e){
				System.out.println("잘못된 경로입니다.!");
			}
			return "/WEB-INF/views/index.jsp";
		}
		
	}

}
