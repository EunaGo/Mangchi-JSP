package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import member.model.Member;

public class MemberMessageDao {
	
	private MemberMessageDao() {};
	private static MemberMessageDao dao=new MemberMessageDao();
	public static MemberMessageDao getInstance() {
		return dao;
	}
	public boolean existId(Connection conn, String id) throws SQLException {
		boolean result=false;
		List<Member> list=new ArrayList<>();

		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from project.member";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		
		while(rs.next()) {
			Member member=new Member(
					rs.getInt("member_idx"), 
					rs.getString("member_id"), 
					rs.getString("member_pw"), 
					rs.getString("member_nick"),
					rs.getString("member_img"),
					rs.getDate("member_regdate")
					);
			list.add(member);
		}
		
		for(int i=0; i<list.size(); i++) {
			if(id.equals(list.get(i).getId())) {
				result=true;
			}
		}
		} finally {
			if(rs!=null) {
				rs.close();
			}
			if(stmt!=null) {
				stmt.close();
			}
			
		}
		return result;
	}

	public String selectIdByIdx(Connection conn, int idx) throws SQLException {
		String id=null;
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			String sql="select member_id from project.member where member_idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);		
					
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				id=rs.getString(1);
			}
		} finally {
			if(rs!=null) {
				rs.close();
			}
			
			if(pstmt!=null) {
				pstmt.close();
			}
		}
		return id;
	}


	
	
	
}
