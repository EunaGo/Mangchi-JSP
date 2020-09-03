package message.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import message.dao.MessageDao;
import service.Service;

public class CheckReadingNoteServiceImpl implements Service {

	MessageDao dao;
	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		String check="N";
		int idx=Integer.parseInt(req.getParameter("idx"));
		Connection conn=null;
		dao=MessageDao.getInstance();
		
		try {
			conn=ConnectionProvider.getConnection();
			int resultCnt=dao.changeReadCheckFromIdx(conn, idx); //readcheck 값을 1로 수정
			int readCheck=dao.selectReadCheckByIdx(conn, idx);	//readcheck 값을 읽어 옴
			
			if(readCheck==1) {
				check="Y";
			} 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		
		req.setAttribute("checkNote", check);
		return "/WEB-INF/views/message/readCheck.jsp";
	}

}
