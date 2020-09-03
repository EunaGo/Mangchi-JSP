package member.service;

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
import service.Service;

public class MemberMyPageFormServiceImpl implements Service {

	
	ReviewDao dao;
	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		Connection conn=null;
		HttpSession session=req.getSession();
		Member rv = (Member)session.getAttribute("loginInfo");
		int member_idx=rv.getIdx();
		String membernick=rv.getNick();
		String memberaddr=rv.getAddr();
		
		try {
			
			conn=ConnectionProvider.getConnection();
			dao = ReviewDao.getInstance();
			
			
			
		
			float score =0;
		
			
			
			
			
			
			score = dao.scoreAvg(conn, member_idx);
		
			
			
			
			req.setAttribute("score", score);
			req.setAttribute("membernick",membernick);
			req.setAttribute("memberaddr",memberaddr);

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
		
		
		
		
		
		
		
		
		
		return "/WEB-INF/views/member/mypage.jsp";
	}

}
