package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import service.Service;

public class MemberLoginServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		MemberDao dao = MemberDao.getInstance();
		
		String id = req.getParameter("logemail");
		String pw = req.getParameter("logpass");

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			
			conn.setAutoCommit(false);

			int resultCnt = dao.loginCheck(conn, id, pw);
			
			System.out.println("성공값 : " + resultCnt);
			
			
			if (resultCnt>0) {
				
				Member loginInfo = dao.selectByMember(conn, id);
				System.out.println("맴버 객체 : " + loginInfo);
				HttpSession session = req.getSession();
				session.setAttribute("loginInfo", loginInfo);
				req.setAttribute("resultCnt", resultCnt);
				
				return "/WEB-INF/views/member/loginChkChk.jsp";
			} else if(resultCnt == 0) {
				
				req.setAttribute("resultCnt", resultCnt);
				
				return "/WEB-INF/views/member/loginChkChk.jsp";
			}
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return "/WEB-INF/views/index.jsp";
	}

}
