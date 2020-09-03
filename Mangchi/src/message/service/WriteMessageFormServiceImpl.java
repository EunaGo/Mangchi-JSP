package message.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberMessageDao;
import message.dao.MessageDao;
import service.Service;

public class WriteMessageFormServiceImpl implements Service {
	
	MemberMessageDao dao;
	MessageDao mdao;

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		int req_idx=Integer.parseInt(req.getParameter("req_idx"));
		int reqWriterIdx=Integer.parseInt(req.getParameter("uid"));
		String receiverId=null;
		
		Connection conn=null;
		
		try {
			conn=ConnectionProvider.getConnection();
			
			dao=MemberMessageDao.getInstance();
			receiverId=dao.selectIdByIdx(conn, reqWriterIdx);
			
			req.setAttribute("reqIdxForNote", req_idx);
			req.setAttribute("receiverIdForNote", receiverId);
			
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
		
		
		return "/WEB-INF/views/message/messageForm.jsp";
				
	}

}
