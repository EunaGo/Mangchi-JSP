package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.ConnectionProvider;
import request.dao.RequestDao;
import request.model.Request;
import request.model.RequestListView;
import service.Service;

public class RequestListSearchServiceImpl implements Service {

	RequestDao dao;

	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
			Connection conn = null;
			RequestListView searchview = null;
			List<Request> requestList = null;
			
			final int COUNT_PER_PAGE = 3;
		
			try {

				conn = ConnectionProvider.getConnection();

				dao = RequestDao.getInstance();	
				
				String sch = req.getParameter("Search");
				
				if(sch=="") {
					sch="아잉";
				}
				
				req.setAttribute("sch", sch);
				
				int requestTotalCount = dao.selectTotalschCount(conn, sch);

				System.out.println(sch);

				int pageNumber = 1;
				String page = req.getParameter("page");
				
				if (page != null) {
					try {
						pageNumber = Integer.parseInt(page);
					} catch (NumberFormatException e) {
						
					}
				}

				int startRow = 0;
				
				if (requestTotalCount > 0) {

					// ���� ��, ������ ��
					startRow = (pageNumber - 1) * COUNT_PER_PAGE ;
					
					requestList = dao.searchRequest(conn, sch, startRow, COUNT_PER_PAGE);
					// System.out.println("requestList: "+requestList);

				} else {
					pageNumber = 0;
					requestList = Collections.emptyList();
				}

				searchview = new RequestListView(requestTotalCount, pageNumber, requestList, COUNT_PER_PAGE, startRow); 
			

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

			req.setAttribute("searchView", searchview);
			
		
		return "/WEB-INF/views/board/searchList.jsp";
	}

}
