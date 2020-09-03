package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import service.Service;

public class MemberRegFormServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("uid");
		String nick = req.getParameter("unick");
		String pw = req.getParameter("upw");
		String addr = req.getParameter("uaddr");
		double lat = Double.parseDouble(req.getParameter("lat"));
		double longi = Double.parseDouble(req.getParameter("longi"));
		int resultCnt = 0;
		Connection conn = null;
		MemberDao dao;
		
		System.out.println(id +", "+ nick+", "+pw+", "+addr+", "+lat+", "+longi);
		
		Member member = new Member(id, pw, nick, addr, lat, longi);
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			dao = MemberDao.getInstance();
			
			resultCnt = dao.insertMember(conn, member);

			conn.commit();
			
			req.setAttribute("member", member);
			
			req.setAttribute("resultCnt", resultCnt);
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
		
		
		return "/WEB-INF/views/member/kakaoChk.jsp";
	}

}
