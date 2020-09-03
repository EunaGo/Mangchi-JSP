package review.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.ConnectionProvider;
import member.model.Member;
import review.dao.ReviewDao;
import review.model.Review;
import review.model.Reviewjoin;
import service.Service;

public class ReviewListViewServiceImpl implements Service {

	
	ReviewDao dao;
	
	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
	
		
		Connection conn=null;
		HttpSession session=req.getSession();
		Member rv = (Member)session.getAttribute("loginInfo");
		int member_idx=rv.getIdx();
		
		
		
		
		try {
			
			conn=ConnectionProvider.getConnection();
			dao = ReviewDao.getInstance();
			
			
			
			List<Reviewjoin> reviewList = null;
			float score =0;
			List<Reviewjoin> writeList =null;
			
			
			
			
			reviewList = dao.getlist(conn,member_idx);
			score = dao.scoreAvg(conn, member_idx);
			writeList = dao.setlist(conn, member_idx);
			
			
			
			req.setAttribute("reviewList", reviewList);
			req.setAttribute("score", score);
			
			req.setAttribute("writerList", writeList);
			
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
		
		
		
		
		
		
		
		
		
		
		
		
		return "/WEB-INF/views/reviews/reviewListView.jsp";
		
	}

}
