package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dao.BoardDao;
import board.model.RequestWriting;
import board.model.RequestWriting2;
import jdbc.ConnectionProvider;
import member.model.Member;
import service.Service;

public class WriteRequestResultServiceImpl implements Service {
	BoardDao dao;
	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		Connection conn = null;
		RequestWriting2 rw = null;
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginInfo");
		int member_idx=member.getIdx();
		try {
			conn = ConnectionProvider.getConnection();
			dao = BoardDao.getInstance();
			int req_idx = dao.getCurrentRequest(conn,member_idx);
			rw= dao.getDetailRequestInfo(conn, req_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		if(rw!=null) {
			request.setAttribute("choiceRequest", rw);
			request.setAttribute("currUserIdx", member_idx);
		}
		return "/WEB-INF/views/board/detailRequest.jsp";
	}

}
