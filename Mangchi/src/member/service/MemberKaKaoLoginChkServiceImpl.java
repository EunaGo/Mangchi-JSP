package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import service.Service;

public class MemberKaKaoLoginChkServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		String kid = req.getParameter("id");
		String nick = req.getParameter("nick");
		String photo = req.getParameter("photo");
		int resultCnt = 0;

		MemberDao dao = null;

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			dao = MemberDao.getInstance();

			// 아이디 존재유무 체크
			resultCnt = dao.idCheck(conn, kid);

			// 아이디가 없을시 회원가입
			if (resultCnt == 0) {
				
				resultCnt = dao.kakaoRegMember(conn, kid, nick, photo);
				
				System.out.println("아이디가없을시 회원가입값: " + resultCnt);
				req.setAttribute("resultCnt", resultCnt);
				// 아이디가 존재 할시 addr 체크
			} else if (resultCnt == 1) {
				int addrCnt = dao.addrCheck(conn, kid);
				
				System.out.println("회원일시 주소유무값: " + addrCnt);
				// 주소 유무에 따른 결과값
				if (resultCnt == 1 && addrCnt == 0) {
					req.setAttribute("resultCnt", resultCnt);
				} else if (resultCnt == 1 && addrCnt == 1){
					resultCnt = 2;
					req.setAttribute("resultCnt", resultCnt);
				}
			}

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

		return "/WEB-INF/views/member/loginChk.jsp";
	}

}
