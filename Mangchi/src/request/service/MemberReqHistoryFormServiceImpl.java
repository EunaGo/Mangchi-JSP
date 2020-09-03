package request.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.model.RequestWriting2;
import jdbc.ConnectionProvider;
import member.model.Member;
import request.dao.RequestDao;
import request.model.Request;
import request.model.RequestListView;
import request.model.Requesttime;
import service.Service;

public class MemberReqHistoryFormServiceImpl implements Service {

	RequestDao dao;

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		Connection conn = null;
		RequestListView listview = null;
		List<Request> requestList = null;
		List<Requesttime> requestTime = null;
		final int COUNT_PER_PAGE = 3;

		try {

			conn = ConnectionProvider.getConnection();

			dao = RequestDao.getInstance();	
			
			Member loginInfo = (Member)req.getSession().getAttribute("loginInfo");	
			System.out.println(loginInfo);
			int idx = loginInfo.getIdx();
			System.out.println("로그인한 사람 : "+idx);
			
			int requestTotalCount = dao.selectReqCount(conn, idx);
			
			int pageNumber = 1;
			String page = req.getParameter("page");
			
			if (page != null) {
				try {
					pageNumber = Integer.parseInt(page);
				} catch (NumberFormatException e) {
					System.out.println("���� Ÿ���� ���ڿ��� ���޵��� �ʾ� ���� �߻�");
				}
			}

			int startRow = 0;
			
			if (requestTotalCount > 0) {

				// ���� ��, ������ ��
				startRow = (pageNumber - 1) * COUNT_PER_PAGE ;
				
				requestList = dao.selectReqHistory(conn, idx, startRow, COUNT_PER_PAGE);
				System.out.println("requestList: "+requestList);

			} else {
				pageNumber = 0;
				requestList = Collections.emptyList();
			}

			listview = new RequestListView(requestTotalCount, pageNumber, requestList, COUNT_PER_PAGE, startRow); 

			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}


		req.setAttribute("listView", listview);
		
		return "/WEB-INF/views/member/reqhistory.jsp";
	}

}
