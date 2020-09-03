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

public class KakaoLoginServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		MemberDao dao = MemberDao.getInstance();

		String id = req.getParameter("kid");

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();

			conn.setAutoCommit(false);

				Member loginInfo = dao.selectByKakaoMember(conn, id);
				System.out.println("맴버 객체 : " + loginInfo);
				HttpSession session = req.getSession();
				session.setAttribute("loginInfo", loginInfo);

			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return "/WEB-INF/views/index.jsp";
	}

}
