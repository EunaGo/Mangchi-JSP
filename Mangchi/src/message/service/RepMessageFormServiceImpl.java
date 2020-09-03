package message.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import message.dao.MessageDao;
import service.Service;

public class RepMessageFormServiceImpl implements Service {

	MessageDao dao;
	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		int req_idx=-1;
		String respondId=null;
		
		int idx=Integer.parseInt(req.getParameter("idx"));
		Connection conn=null;
		
		try {
			conn=ConnectionProvider.getConnection();
			dao=MessageDao.getInstance();
			
			req_idx=dao.selectReqIdxByMsgIdx(conn, idx);
			respondId=dao.selectWriterIdByIdx(conn, idx);
		
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
		
		req.setAttribute("req_idx", req_idx);
		req.setAttribute("toPerson", respondId);
		return "/WEB-INF/views/message/RepMessageForm.jsp";
	}

}
