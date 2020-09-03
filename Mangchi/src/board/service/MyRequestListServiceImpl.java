package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dao.BoardDao;
import board.model.RequestList;
import board.model.RequestWriting;
import board.model.RequestWriting2;
import jdbc.ConnectionProvider;
import member.model.Member;
import service.Service;

public class MyRequestListServiceImpl implements Service {
	private BoardDao dao;
	private final int MESSAGE_COUNT_PER_PAGE = 4;
	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse resp) {
		Connection conn = null;
		RequestList view = null;
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginInfo");
		int member_idx = member.getIdx();
		int pageNum =1;
		if(request.getParameter("page")!=null) {
			pageNum = Integer.parseInt(request.getParameter("page"));
		}
		try {
			conn = ConnectionProvider.getConnection();
			dao = BoardDao.getInstance();
			
			List<RequestWriting2> rqList=new ArrayList<RequestWriting2>();
			
			//가입한 전체 회원 수
			int requestTotalCount = dao.selectTotalMyReqCnt(conn,member_idx);
			int startRaw = 0;
			
			if(requestTotalCount >0) {
				startRaw = (pageNum -1) * MESSAGE_COUNT_PER_PAGE;
//				rqList = dao.selectMemberList(conn, startRaw, member_idx, MESSAGE_COUNT_PER_PAGE);
			}else {
				pageNum = 0;
				rqList = Collections.emptyList();
			}
			
			view = new RequestList(
							rqList, 
							requestTotalCount, 
							pageNum,
							MESSAGE_COUNT_PER_PAGE,
							startRaw);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			
		}finally {
			if(conn!= null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		request.setAttribute("myRequestListView", view);
		return "/WEB-INF/views/board/myRequestList.jsp";
	}

}
