package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.model.RequestWriting2;
import jdbc.ConnectionProvider;
import member.model.Member;
import service.Service;

public class DetailRequestInfoImpl implements Service {
	BoardDao dao;
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		Connection conn = null;
		RequestWriting2 rw = null;
		List<Member> list=null;
		int loginIdx=-1;
		if(req.getSession().getAttribute("loginInfo")!=null) {
			Member loginMember = (Member)req.getSession().getAttribute("loginInfo");
			loginIdx=loginMember.getIdx();
		}		
		int req_idx = Integer.parseInt(req.getParameter("req_idx"));
		System.out.println("euna: "+req_idx);
		try {
			conn = ConnectionProvider.getConnection();
			dao=BoardDao.getInstance();
			rw= dao.getDetailRequestInfo(conn,req_idx);
			
			if(rw.getReq_returnDate()!=null && rw.getReq_returnDate().trim().length()>0) {
				//날짜변환
				long a =Long.parseLong(rw.getReq_returnDate());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				Date returnDate= new Date(a);
				rw.setReq_returnDate(sdf.format(returnDate));
			}
			long term = Long.parseLong(rw.getReq_term());

			//로그인한 사용자가 글쓴이 일 때
			if(rw.getReq_writer()==loginIdx) {
				list = dao.getRequestHelpers(conn,loginIdx,req_idx);
			//로그인사용자가 글쓴이가 아니거나 비로그인 상태일때
			}else if(loginIdx==-1||rw.getReq_writer()!=loginIdx){
				list = dao.getRequestHelpers(conn,rw.getReq_writer(),req_idx);								
			}
		} catch (SQLException e) {
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
		if(rw!=null) {
			//현재 접속한 유저의 인덱스 (비로그인일시 -1)
			req.setAttribute("currUserIdx", loginIdx);
			//클릭한 게시물정보객체
			req.setAttribute("choiceRequest", rw);
			//글쓴이에게 쪽지를 보낸사람들
			req.setAttribute("requestHelpers", list);
		}
		return "/WEB-INF/views/board/detailRequest.jsp";
	}

}
