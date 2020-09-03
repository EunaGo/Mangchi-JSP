package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.model.RequestWriting2;
import jdbc.ConnectionProvider;
import member.model.Member;

public class Hollys implements Service {
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		BoardDao dao=BoardDao.getInstance();
		List<RequestWriting2> list = new ArrayList<RequestWriting2>();
		Member member = (Member)req.getSession().getAttribute("loginInfo");
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			list = dao.getHollys(conn);
			System.out.println(list.size());
			for(int i=0;i<list.size();i++) {
				double distance = caldistance(
								member.getLatitude(), 
								member.getLongitude(), 
								list.get(i).getReq_latitude(), 
								list.get(i).getReq_longitude(), 
								"kilometer");
				list.get(i).setDistance(distance);
				System.out.println("맴버위도: "+member.getLatitude());
				System.out.println("맴버경도: "+member.getLongitude());
				System.out.println("글 위도: "+list.get(i).getReq_latitude());
				System.out.println("글 경도: "+list.get(i).getReq_longitude());
			}
			req.setAttribute("hollysList", list);
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
		
		return "/WEB-INF/views/member/hollys.jsp";
	}
	
	private double caldistance(double lat1, double lon1, double lat2, double lon2, String unit) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit.equals("kilometer")) {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        } 
 
        return (dist);
    }
     
 
    // This function converts decimal degrees to radians
    private double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }

}
