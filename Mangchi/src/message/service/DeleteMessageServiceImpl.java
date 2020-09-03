package message.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import message.dao.MessageDao;
import message.model.Message;
import service.Service;

public class DeleteMessageServiceImpl implements Service {

	MessageDao dao;
	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		int resultCnt=0;
		Message msg=null;
		int idx=Integer.parseInt(req.getParameter("idx"));
		Connection conn=null;
				
		try {
			conn=ConnectionProvider.getConnection();
			dao=MessageDao.getInstance();
			msg=dao.selectMessageFromIdx(conn, idx);
			
			if(msg==null) {
				throw new Exception("삭제할 메시지가 존재하지 않습니다.");
			}
			
			resultCnt=dao.deleteMessage(conn, idx);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
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
		
		
		req.setAttribute("delresult", resultCnt);
		
		return "/WEB-INF/views/message/deleteMessage.jsp";
	}

}
