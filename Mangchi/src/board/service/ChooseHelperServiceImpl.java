package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import jdbc.ConnectionProvider;
import member.model.Member;
import service.Service;

public class ChooseHelperServiceImpl implements Service {
	BoardDao dao;
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		int req_idx = Integer.parseInt(req.getParameter("req_idx"));
		int helper = Integer.parseInt(req.getParameter("req_helper"));
		int complete = Integer.parseInt(req.getParameter("complete"));
		
		
		Connection conn = null;
		int result =0;
		
		
		try {
			
			conn = ConnectionProvider.getConnection();
			dao=BoardDao.getInstance();
			//렌탈 중이거나 렌탈 대기일때
			if(complete==0) {
				String req_term = req.getParameter("req_term");
				long term = Long.parseLong(req_term);
				//반납 날짜 구하기
				long now = new Date().getTime();
				long returnDate = now+term;
				String req_returnDate = ""+returnDate;
				result = dao.chooseHelperStatus(conn,req_idx,helper,req_returnDate);				
			//렌탈 완료일때
			}else{
				result = dao.completeHelpStatus(conn,req_idx,helper);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
			
		req.setAttribute("updateResult", result);
//		req.setAttribute("requestHelpers", list);
		return "/WEB-INF/views/board/updateStatusResult.jsp";
	}

}
