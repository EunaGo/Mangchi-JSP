package review.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.RequestWriting;
import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import review.dao.ReviewDao;
import service.Service;

public class ReviewFormServiceImpl implements Service {

   @Override
   public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
   
      
      ReviewDao dao;
      
      Connection conn=null;
      
      int a = Integer.parseInt(req.getParameter("req_helper"));
      //String a = "11";
      int b = Integer.parseInt(req.getParameter("req_idx"));
      //int b = 9;
      
      
   try {
         
         conn=ConnectionProvider.getConnection();
         dao = ReviewDao.getInstance();
         
         
         
         Member helperInfo = dao.selecthlperMember(conn, a);
         
         
         RequestWriting requestInfo = dao.selectRequest(conn,b);
         
         
         
         System.out.println("헬퍼 객체 : " + helperInfo);
         System.out.println("게시글 idx 객체 :" + requestInfo);
         
         
         
         req.setAttribute("nick", helperInfo);
         req.setAttribute("req", requestInfo);
         
         
         
         
   } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
   }finally {
      
      
   }
      
      
      return "/WEB-INF/views/reviews/reviewForm.jsp";
      
   }

}