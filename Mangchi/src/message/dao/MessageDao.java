package message.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import message.model.Message;

public class MessageDao {

	private MessageDao() {}
	private static MessageDao dao=new MessageDao();
	public static MessageDao getInstance() {
		return dao;
	}

	public int sendMessage(Connection conn, Message msg) throws SQLException {

		int resultCnt=0;

		PreparedStatement pstmt=null;

		String sql="INSERT INTO project.message " +
				"(req_idx, msg_writer, msg_receiver, msg_title, msg_text, msg_img) " + 
				" VALUES " + 
				"(?,?,?,?,?,?)";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, msg.getReq_idx());
			pstmt.setInt(2, msg.getMsg_writer());
			pstmt.setString(3, msg.getMsg_receiver());
			pstmt.setString(4, msg.getMsg_title());
			pstmt.setString(5, msg.getMsg_text());
			pstmt.setString(6, msg.getMsg_img());

			resultCnt=pstmt.executeUpdate();

		}finally {

			if(pstmt!=null) {
				pstmt.close();
			}

		}

		return resultCnt;
	}

	public int selectTotalCount(Connection conn, String id) throws SQLException {
		int resultCnt=0;

		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try {
			
			String sql="select count(*) from project.message where msg_receiver=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				resultCnt=rs.getInt(1);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}

			if(pstmt!=null) {
				pstmt.close();
			}

		}
		return resultCnt;
	}

	public List<Message> selectMessageList(Connection conn, int startrow, String id, int MESSAGE_COUNT_PER_PAGE) throws SQLException {

		PreparedStatement pstmt=null;
		ResultSet rs=null;

		List<Message> list=new ArrayList<Message>();

		String sql="select msg.msg_idx, msg.req_idx, mem.member_idx, mem.member_id, msg.msg_receiver, msg.msg_title, msg.msg_text, msg.msg_img, msg.msg_date, msg.msg_readcheck from (project.message msg inner join project.member mem on msg.msg_writer=mem.member_idx) where msg.msg_receiver=? order by msg_date desc limit ?,?"; 

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, MESSAGE_COUNT_PER_PAGE);

			rs=pstmt.executeQuery();

			while(rs.next()) {
				Message msg=new Message(
						rs.getInt("msg.msg_idx"),
						rs.getInt("msg.req_idx"),
						rs.getInt("mem.member_idx"),
						rs.getString("mem.member_id"),
						rs.getString("msg.msg_receiver"),
						rs.getString("msg.msg_title"),
						rs.getString("msg.msg_text"),
						rs.getString("msg.msg_img"),
						rs.getDate("msg.msg_date"),
						rs.getInt("msg.msg_readcheck")
						);

				list.add(msg);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}

			if(pstmt!=null) {
				pstmt.close();
			}
		}

		return list;
	}

	public Message selectMessageFromIdx(Connection conn, int idx) throws SQLException {

		Message msg=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try {
			String sql="select msg.msg_idx, msg.req_idx, mem.member_idx, mem.member_id, msg.msg_receiver, msg.msg_title, msg.msg_text, msg.msg_img, msg.msg_date, msg.msg_readcheck from (project.message msg inner join project.member mem on msg.msg_writer=mem.member_idx) where msg.msg_idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);

			rs=pstmt.executeQuery();

			while(rs.next()) {
				msg=new Message(
						rs.getInt("msg.msg_idx"),
						rs.getInt("msg.req_idx"),
						rs.getInt("mem.member_idx"),
						rs.getString("mem.member_id"),
						rs.getString("msg.msg_receiver"),
						rs.getString("msg.msg_title"),
						rs.getString("msg.msg_text"),
						rs.getString("msg.msg_img"),
						rs.getDate("msg.msg_date"),
						rs.getInt("msg.msg_readcheck")
						);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
		}

		return msg;
	}

	public int changeReadCheckFromIdx(Connection conn, int idx) throws SQLException {
		
		int resultCnt=0;
		
		PreparedStatement pstmt=null;

		try {
			String sql="update project.message set msg_readcheck=? where msg_idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, idx);
			
			resultCnt=pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) {
				pstmt.close();
			}
		}


		return resultCnt;


	}

	public int selectReadCheckByIdx(Connection conn, int idx) throws SQLException {
		
		int readCheck=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
		String sql="select msg_readcheck from project.message where msg_idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			readCheck=rs.getInt(1);
		}
		
		
		} finally {
			if(rs!=null) {
				rs.close();
			}
			
			if(pstmt!=null) {
				pstmt.close();
			}
		}
		return readCheck;
	}

	public int deleteMessage(Connection conn, int idx) throws SQLException {
		int resultCnt=0;
		PreparedStatement pstmt=null;
		
		try {
		String sql="delete from project.message where msg_idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		resultCnt=pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			
		}
		return resultCnt;
	}

	
	
	
	public List<Message> searchReceiveNoteById(Connection conn, int startrow, String id, int MESSAGE_COUNT_PER_PAGE,
			String searchText) throws SQLException {

		PreparedStatement pstmt=null;
		ResultSet rs=null;

		List<Message> list=new ArrayList<Message>();

		//받은 편지함에서 아이디 찾기 => writer의 아이디
		String sql="select msg.msg_idx, msg.req_idx, mem.member_idx, mem.member_id, msg.msg_receiver, msg.msg_title, msg.msg_text, msg.msg_img, msg.msg_date, msg.msg_readcheck from (project.message msg inner join project.member mem on msg.msg_writer=mem.member_idx) where msg.msg_receiver=? and mem.member_id like ? order by msg_date desc limit ?,?"; 

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, "%"+searchText+"%");
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, MESSAGE_COUNT_PER_PAGE);

			rs=pstmt.executeQuery();

			while(rs.next()) {
				Message msg=new Message(
						rs.getInt("msg.msg_idx"),
						rs.getInt("msg.req_idx"),
						rs.getInt("mem.member_idx"),
						rs.getString("mem.member_id"),
						rs.getString("msg.msg_receiver"),
						rs.getString("msg.msg_title"),
						rs.getString("msg.msg_text"),
						rs.getString("msg.msg_img"),
						rs.getDate("msg.msg_date"),
						rs.getInt("msg.msg_readcheck")
						);

				list.add(msg);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}

			if(pstmt!=null) {
				pstmt.close();
			}
		}

		return list;
	}

	public List<Message> searchReceiveNoteByTitle(Connection conn, int startrow, String id, int MESSAGE_COUNT_PER_PAGE,
			String searchText) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		List<Message> list=new ArrayList<Message>();
		//받은 편지함에서 제목 찾기 => writer의 아이디가 멤버 데이터와 일치해야함
		String sql="select msg.msg_idx, msg.req_idx, mem.member_idx, mem.member_id, msg.msg_receiver, msg.msg_title, msg.msg_text, msg.msg_img, msg.msg_date, msg.msg_readcheck from (project.message msg inner join project.member mem on msg.msg_writer=mem.member_idx) where msg.msg_receiver=? and msg.msg_title like ? order by msg_date desc limit ?,?"; 

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, "%"+searchText+"%");
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, MESSAGE_COUNT_PER_PAGE);

			rs=pstmt.executeQuery();

			while(rs.next()) {
				Message msg=new Message(
						rs.getInt("msg.msg_idx"),
						rs.getInt("msg.req_idx"),
						rs.getInt("mem.member_idx"),
						rs.getString("mem.member_id"),
						rs.getString("msg.msg_receiver"),
						rs.getString("msg.msg_title"),
						rs.getString("msg.msg_text"),
						rs.getString("msg.msg_img"),
						rs.getDate("msg.msg_date"),
						rs.getInt("msg.msg_readcheck")
						);

				list.add(msg);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}

			if(pstmt!=null) {
				pstmt.close();
			}
		}

		return list;
	}

	public List<Message> searchReceiveNoteByText(Connection conn, int startrow, String id, int MESSAGE_COUNT_PER_PAGE,
			String searchText) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		List<Message> list=new ArrayList<Message>();
		//받은 편지함에서 내용 찾기 => writer의 아이디가 멤버 데이터와 일치해야함
		String sql="select msg.msg_idx, msg.req_idx, mem.member_idx, mem.member_id, msg.msg_receiver, msg.msg_title, msg.msg_text, msg.msg_img, msg.msg_date, msg.msg_readcheck from (project.message msg inner join project.member mem on msg.msg_writer=mem.member_idx) where msg.msg_receiver=? and msg.msg_text like ? order by msg_date desc limit ?,?"; 

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, "%"+searchText+"%");
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, MESSAGE_COUNT_PER_PAGE);

			rs=pstmt.executeQuery();

			while(rs.next()) {
				Message msg=new Message(
						rs.getInt("msg.msg_idx"),
						rs.getInt("msg.req_idx"),
						rs.getInt("mem.member_idx"),
						rs.getString("mem.member_id"),
						rs.getString("msg.msg_receiver"),
						rs.getString("msg.msg_title"),
						rs.getString("msg.msg_text"),
						rs.getString("msg.msg_img"),
						rs.getDate("msg.msg_date"),
						rs.getInt("msg.msg_readcheck")
						);

				list.add(msg);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}

			if(pstmt!=null) {
				pstmt.close();
			}
		}

		return list;
	}

	public List<Message> searchSendNoteById(Connection conn, int startrow, int MESSAGE_COUNT_PER_PAGE, int idx, 
			String searchText) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		List<Message> list=new ArrayList<Message>();
		//보낸 편지함에서 아이디 검색 => 받은 사람 아이디
		String sql="select msg.msg_idx, msg.req_idx, mem.member_idx, mem.member_id, msg.msg_receiver, msg.msg_title, msg.msg_text, msg.msg_img, msg.msg_date, msg.msg_readcheck from (project.message msg inner join project.member mem on msg.msg_writer=mem.member_idx) where msg.msg_writer=? and msg.msg_receiver like ? order by msg_date desc limit ?,?"; 

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, "%"+searchText+"%");
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, MESSAGE_COUNT_PER_PAGE);

			rs=pstmt.executeQuery();

			while(rs.next()) {
				Message msg=new Message(
						rs.getInt("msg.msg_idx"),
						rs.getInt("msg.req_idx"),
						rs.getInt("mem.member_idx"),
						rs.getString("mem.member_id"),
						rs.getString("msg.msg_receiver"),
						rs.getString("msg.msg_title"),
						rs.getString("msg.msg_text"),
						rs.getString("msg.msg_img"),
						rs.getDate("msg.msg_date"),
						rs.getInt("msg.msg_readcheck")
						);

				list.add(msg);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}

			if(pstmt!=null) {
				pstmt.close();
			}
		}

		return list;
	}

	public List<Message> searchSendNoteByTitle(Connection conn, int startrow, int MESSAGE_COUNT_PER_PAGE, int idx,
			String searchText) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		List<Message> list=new ArrayList<Message>();

		String sql="select msg.msg_idx, msg.req_idx, mem.member_idx, mem.member_id, msg.msg_receiver, msg.msg_title, msg.msg_text, msg.msg_img, msg.msg_date, msg.msg_readcheck from (project.message msg inner join project.member mem on msg.msg_writer=mem.member_idx) where msg.msg_writer=? and msg.msg_title like ? order by msg_date desc limit ?,?"; 

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, "%"+searchText+"%");
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, MESSAGE_COUNT_PER_PAGE);

			rs=pstmt.executeQuery();

			while(rs.next()) {
				Message msg=new Message(
						rs.getInt("msg.msg_idx"),
						rs.getInt("msg.req_idx"),
						rs.getInt("mem.member_idx"),
						rs.getString("mem.member_id"),
						rs.getString("msg.msg_receiver"),
						rs.getString("msg.msg_title"),
						rs.getString("msg.msg_text"),
						rs.getString("msg.msg_img"),
						rs.getDate("msg.msg_date"),
						rs.getInt("msg.msg_readcheck")
						);

				list.add(msg);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}

			if(pstmt!=null) {
				pstmt.close();
			}
		}

		return list;
	}

	public List<Message> searchSendNoteByText(Connection conn, int startrow, int MESSAGE_COUNT_PER_PAGE, int idx, 
			String searchText) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		List<Message> list=new ArrayList<Message>();

		String sql="select msg.msg_idx, msg.req_idx, mem.member_idx, mem.member_id, msg.msg_receiver, msg.msg_title, msg.msg_text, msg.msg_img, msg.msg_date, msg.msg_readcheck from (project.message msg inner join project.member mem on msg.msg_writer=mem.member_idx) where msg.msg_writer=? and msg.msg_text like ? order by msg_date desc limit ?,?"; 

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, "%"+searchText+"%");
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, MESSAGE_COUNT_PER_PAGE);

			rs=pstmt.executeQuery();

			while(rs.next()) {
				Message msg=new Message(
						rs.getInt("msg.msg_idx"),
						rs.getInt("msg.req_idx"),
						rs.getInt("mem.member_idx"),
						rs.getString("mem.member_id"),
						rs.getString("msg.msg_receiver"),
						rs.getString("msg.msg_title"),
						rs.getString("msg.msg_text"),
						rs.getString("msg.msg_img"),
						rs.getDate("msg.msg_date"),
						rs.getInt("msg.msg_readcheck")
						);

				list.add(msg);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}

			if(pstmt!=null) {
				pstmt.close();
			}
		}

		return list;
	}

	public int selectReqIdxByMsgIdx(Connection conn, int idx) throws SQLException {
		int reqIdx=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			String sql="select req_idx from project.message where msg_idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				reqIdx=rs.getInt(1);
			}
			
		} finally {
			if(rs!=null) {
				rs.close();
			}
			
			if(pstmt!=null) {
				pstmt.close();
			}
		}
		
		
		return reqIdx;
	}

	public String selectWriterIdByIdx(Connection conn, int idx) throws SQLException {
		
		String writerId=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			String sql="select mem.member_id from project.message msg inner join project.member mem on msg.msg_writer=mem.member_idx where msg.msg_idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				writerId=rs.getString(1);
			}
			
		}finally {
			if(rs!=null) {
				rs.close();
			}
			
			if(pstmt!=null) {
				pstmt.close();
			}
		}
		
		
		return writerId;
	}

	public List<Message> selectMessageList(Connection conn, int startrow, int idx, int MESSAGE_COUNT_PER_PAGE) throws SQLException {

		PreparedStatement pstmt=null;
		ResultSet rs=null;

		List<Message> list=new ArrayList<Message>();

		String sql="select msg.msg_idx, msg.req_idx, mem.member_idx, mem.member_id, msg.msg_receiver, msg.msg_title, msg.msg_text, msg.msg_img, msg.msg_date, msg.msg_readcheck from (project.message msg inner join project.member mem on msg.msg_writer=mem.member_idx) where msg.msg_writer=? order by msg_date desc limit ?,?"; 

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, MESSAGE_COUNT_PER_PAGE);

			rs=pstmt.executeQuery();

			while(rs.next()) {
				Message msg=new Message(
						rs.getInt("msg.msg_idx"),
						rs.getInt("msg.req_idx"),
						rs.getInt("mem.member_idx"),
						rs.getString("mem.member_id"),
						rs.getString("msg.msg_receiver"),
						rs.getString("msg.msg_title"),
						rs.getString("msg.msg_text"),
						rs.getString("msg.msg_img"),
						rs.getDate("msg.msg_date"),
						rs.getInt("msg.msg_readcheck")
						);

				list.add(msg);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}

			if(pstmt!=null) {
				pstmt.close();
			}
		}

		return list;
	}

	public int selectTotalCount(Connection conn, int idx) throws SQLException {
		int resultCnt=0;

		Statement stmt=null;
		ResultSet rs=null;

		try {
			stmt=conn.createStatement();
			String sql="select count(*) from project.message where msg_writer="+idx;

			rs=stmt.executeQuery(sql);

			if(rs.next()) {
				resultCnt=rs.getInt(1);
			}

		} finally {
			if(rs!=null) {
				rs.close();
			}

			if(stmt!=null) {
				stmt.close();
			}

		}
		return resultCnt;
	}
}
