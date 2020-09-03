package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import jdbc.ConnectionProvider;
import service.Service;

public class DeleteRequestServiceImpl implements Service {
	BoardDao dao;

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		Connection conn=null;
		int req_idx= Integer.parseInt(req.getParameter("req_idx"));
		int result=0;
		try {
			conn=ConnectionProvider.getConnection();
			dao = BoardDao.getInstance();
			result = dao.deleteRequestInfo(conn,req_idx);
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
			req.setAttribute("delresult", result);
		return "/WEB-INF/views/board/deleteReqResult.jsp";
	}

}
