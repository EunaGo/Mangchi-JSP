package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import service.Service;

public class MemberPwModifyServiceImpl implements Service{

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		Member member = (Member) req.getSession().getAttribute("loginInfo");
		String id = member.getId();
		String pw = req.getParameter("upw");
		
		int resultCnt = 0;
		
		MemberDao dao = null;

		Connection conn = null;
		
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				dao = MemberDao.getInstance();
				
				resultCnt = dao.memberPwModify(conn, id, pw);
				
				req.setAttribute("resultCnt", resultCnt);
				
				conn.commit();
			} catch (SQLException e) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					System.out.println("문제가 생겨 rollback합니다.");
					e1.printStackTrace();
				}
				e.printStackTrace();
			} finally {
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		
		return "/WEB-INF/views/member/modifyChk.jsp";
	}

}
