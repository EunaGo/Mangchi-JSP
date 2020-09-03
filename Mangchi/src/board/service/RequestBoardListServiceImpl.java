package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.model.RequestWriting;
import board.model.RequestWriting2;
import jdbc.ConnectionProvider;
import service.Service;

public class RequestBoardListServiceImpl implements Service {

	BoardDao dao = null;

	// 페이지 당 표현 할 정보 개수

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {

		Connection conn = null;
		List<RequestWriting2> requestWriting = null;
		
		try {

			conn = ConnectionProvider.getConnection();
			dao = BoardDao.getInstance();

			requestWriting = dao.selectRequestList(conn);  
		
			  
		  request.setAttribute("requestWritingList", requestWriting);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		
		return "/WEB-INF/views/board/requestList.jsp";
	}

}
