package review.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.RequestWriting;
import jdbc.ConnectionProvider;
import member.model.Member;
import review.dao.ReviewDao;
import review.model.Review;
import service.Service;

public class ReviewServiceImpl implements Service {

	
	
	ReviewDao dao;
	
	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		
		int resultCnt =0;
		
		
		
		
		
		Connection conn = null;
		
		HttpSession session=req.getSession();
		Member rv = (Member)session.getAttribute("loginInfo");
		int review_writer=rv.getIdx();

		
		int req_idx=Integer.parseInt(req.getParameter("req_idx")); // 게시글에서쏴줌
		int review_receiver=Integer.parseInt(req.getParameter("review_receiver")); 
		//int review_receiver=3; // test용
		
		
		int review_score=0;
				
		if(req.getParameter("review_score")!=null) {
			review_score = Integer.parseInt(req.getParameter("review_score"));
		}
		String review_text = req.getParameter("review_text");
		
		
		
		try {
			conn = ConnectionProvider.getConnection();
			
			
			
			
			Review review = new Review();
			
			
			review.setReq_idx(req_idx); // 게시글에서 가져옴 
			review.setReview_receiver(review_receiver); // 게시글에서 가져옴
			review.setReview_writer(review_writer); // 글쓴이 로그인세션idx 
			review.setReview_score(review_score); // 폼에서 직접
			review.setReview_text(review_text); // 폼에서 직접 
			
			
			dao = ReviewDao.getInstance();
			

			resultCnt=dao.insertReview(conn,review);
			
			
			System.out.println(resultCnt);
			
			req.setAttribute("result", resultCnt);
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
		
		
		
		
		return "/WEB-INF/views/reviews/review.jsp";
	}

}
