package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import jdbc.ConnectionProvider;
import service.Service;

public class WriteFormServiceImpl implements Service {

	BoardDao dao;
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		//dao 가서 req_idx 다음값 가져오기
//		Connection conn = null;
//		//다음 req_idx
//		int nextidx = -1;
//		try {
//			conn= ConnectionProvider.getConnection();
//			dao = BoardDao.getInstance();
//			nextidx = dao.getNextIdx(conn);
//			
//			req.setAttribute("nextidx", nextidx);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		return "/WEB-INF/views/board/requestWriteForm.jsp";
	}

}
