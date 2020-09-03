package request.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import member.model.Member;
import request.model.Request;
import request.model.Requesttime;

public class RequestDao {
	
	private RequestDao() { // 다른곳에서 생성 못함
	}

	private static RequestDao dao = new RequestDao();

	public static RequestDao getInstance() {
		return dao;
	}
	
	// 나의 렌탈 게시물
	public List<Request> selectReqHistory(Connection conn, int idx, int startRow, int endRow) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs;
		List<Request> list = new ArrayList();
		int time, day, hour, minute;
		
		try {
			// String sql = "select * from project.request_list where req_writer=? limit ?,?";
			
			String sql = " select req_idx, member_nick, req_title, req_loc, req_price, req_status, req_regdate, req_term "+ 
					" from project.member, project.request_list" + 
					" where member_idx=req_writer and req_writer=? limit ?,? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Request req = new Request();
				req.setReq_idx(rs.getInt("req_idx"));
				req.setMember_nick(rs.getString("member_nick"));
				req.setReq_title(rs.getString("req_title"));
				req.setReq_loc(rs.getString("req_loc"));
				req.setReq_price(rs.getInt("req_price"));
				req.setReq_status(rs.getInt("req_status"));
				req.setReq_regdate(rs.getDate("req_regdate"));
				req.setReq_term(rs.getString("req_term"));
					
				time = Integer.parseInt(req.getReq_term()); 
				time = time/1000;
				System.out.println(time);
				
				day = time/(60*60*24);
				hour = time%(60*60*24)/(60*60);
				minute = time%(60*60*24)%(60*60)/60;
							
				req.setDay(day);
				req.setHour(hour);
				req.setMinute(minute);
				
				list.add(req);
			}

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return list;
	}
	
	// 요청 카운트
	public int selectReqCount(Connection conn, int idx) throws SQLException {

		int resultCnt = 0;

		PreparedStatement pstmt = null;

		ResultSet rs = null;
		
		//System.out.println(">>>>>>> "+idx);
		
		try {
			String sql = "select count(*) from project.request_list where req_writer="+idx;// where req_writer=? " ;
			pstmt = conn.prepareStatement(sql);
			//pstmt.setNString(1, idx+"");
			rs = pstmt.executeQuery(sql);
			
			while (rs.next()) {
				resultCnt = rs.getInt(1);
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
		System.out.println(resultCnt);
		return resultCnt;
	}
	
	// 나의 대여 게시물
		public List<Request> selectRntHistory(Connection conn, int idx, int startRow, int endRow ) throws SQLException {

			PreparedStatement pstmt = null;
			ResultSet rs;
			int time, day, hour, minute;

			List<Request> list = new ArrayList();


			try {
				// String sql = "select * from project.request_list where req_helper=? limit ?,?";
				
				String sql = " select req_idx, member_nick, req_title, req_loc, req_price, req_status, req_regdate, req_term "+ 
						" from project.member, project.request_list" + 
						" where member_idx=req_writer and req_helper=? limit ?,? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					Request req = new Request();
					req.setReq_idx(rs.getInt("req_idx"));
					req.setMember_nick(rs.getString("member_nick"));
					req.setReq_title(rs.getString("req_title"));
					req.setReq_loc(rs.getString("req_loc"));
					req.setReq_price(rs.getInt("req_price"));
					req.setReq_status(rs.getInt("req_status"));
					req.setReq_regdate(rs.getDate("req_regdate"));
					req.setReq_term(rs.getString("req_term"));
					
					time = Integer.parseInt(req.getReq_term()); 
					time = time/1000;
					System.out.println(time);
					
					day = time/(60*60*24);
					hour = time%(60*60*24)/(60*60);
					minute = time%(60*60*24)%(60*60)/60;
								
					req.setDay(day);
					req.setHour(hour);
					req.setMinute(minute);
					

					
					list.add(req);
				}

			} finally {
				if (pstmt != null) {
					pstmt.close();
				}
			}

			return list;
		}
	
	// 대여 카운트
		public int selectRntCount(Connection conn, int idx) throws SQLException {


			int resultCnt = 0;

			PreparedStatement pstmt = null;

			ResultSet rs = null;

			try {
				String sql = "select count(*) from project.request_list where req_helper="+idx;
				pstmt = conn.prepareStatement(sql);
				
				//pstmt.setInt(1, idx);
				
				rs = pstmt.executeQuery(sql);
				if (rs.next()) {
					resultCnt = rs.getInt(1);
				}

			} finally {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			}
			System.out.println(resultCnt);
			return resultCnt;
		}
	

	// 검색
	public List<Request> searchRequest(Connection conn, String sch ,int startRow, int endRow ) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs;
		int time, day, hour, minute;

		List<Request> list = new ArrayList();

		try {

			//String sql = "select * from project.request_list where req_title like '%"+sch+"%' limit ?,?";
			
			String sql = " select req_idx, member_nick, req_title, req_price, req_status, req_regdate, req_term, req_loc " + 
					" from project.member, project.request_list " + 
					" where member_idx=req_writer and req_title like '%"+sch+"%'limit ?,?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Request req = new Request();
				req.setReq_idx(rs.getInt("req_idx"));
				req.setMember_nick(rs.getString("member_nick"));
				req.setReq_title(rs.getString("req_title"));
				req.setReq_loc(rs.getString("req_loc"));
				req.setReq_price(rs.getInt("req_price"));
				req.setReq_status(rs.getInt("req_status"));
				req.setReq_regdate(rs.getDate("req_regdate"));
				req.setReq_term(rs.getString("req_term"));
				
				time = Integer.parseInt(req.getReq_term()); 
				time = time/1000;
				System.out.println(time);
				
				day = time/(60*60*24);
				hour = time%(60*60*24)/(60*60);
				minute = time%(60*60*24)%(60*60)/60;
							
				req.setDay(day);
				req.setHour(hour);
				req.setMinute(minute);
				

				
				list.add(req);
			}

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return list;
	}
	
	public int selectTotalCount(Connection conn) throws SQLException {

		int resultCnt = 0;

		Statement stmt = null;
		ResultSet rs = null;

		try {

			stmt = conn.createStatement();
			String sql = "select count(*) from project.request_list";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				resultCnt = rs.getInt(1);
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		}

		return resultCnt;
	}
	
	public int selectTotalschCount(Connection conn, String sch) throws SQLException {

		int resultCnt = 0;

		Statement stmt = null;
		ResultSet rs = null;

		try {
			
			if(sch==null) {
				return resultCnt;
			}

			stmt = conn.createStatement();
			String sql = "select count(*) from project.request_list where req_title like '%"+sch+"%'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				resultCnt = rs.getInt(1);
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		}

		return resultCnt;
	}


}
