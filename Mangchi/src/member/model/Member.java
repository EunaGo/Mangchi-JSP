package member.model;

import java.sql.Date;
import java.util.List;

import message.model.MessageListView;

public class Member {
	private int idx;
	private String id;
	private String kid;
	private String pw;
	private String nick;
	private Double score;
	private Date regDate;
	private String addr;
	private String photo;
	private double latitude;
	private double longitude;
	
	
	public Member() {}
	
	
	
	public Member(String id, String pw, String nick, String addr, double latitude, double longitude) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.addr = addr;
		this.latitude = latitude;
		this.longitude = longitude;
	}



	public Member(int idx, String id, String pw, String nick, String photo, Date regDate) {
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.regDate = regDate;
		this.photo = photo;
	};
	
	public Member(int idx, String id, String pw, String nick, Double score, Date regDate, String addr,
			String photo) {
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.score = score;
		this.regDate = regDate;
		this.addr = addr;
		this.photo = photo;
	}
	
	

	public Member(int idx, String kid, String nick,Double score, Date regDate, String addr, String photo) {
		this.idx = idx;
		this.kid = kid;
		this.nick = nick;
		this.score = score;
		this.regDate = regDate;
		this.addr = addr;
		this.photo = photo;
	}
	
	

	public Member(int idx, String id, String kid, String pw, String nick, Double score, Date regDate, String addr,
			String photo, double latitude, double longitude) {
		this.idx = idx;
		this.id = id;
		this.kid = kid;
		this.pw = pw;
		this.nick = nick;
		this.score = score;
		this.regDate = regDate;
		this.addr = addr;
		this.photo = photo;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKid() {
		return kid;
	}

	public void setKid(String kid) {
		this.kid = kid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}



	@Override
	public String toString() {
		return "Member [idx=" + idx + ", id=" + id + ", kid=" + kid + ", pw=" + pw + ", nick=" + nick + ", score="
				+ score + ", regDate=" + regDate + ", addr=" + addr + ", photo=" + photo + ", latitude=" + latitude
				+ ", longitude=" + longitude + "]";
	}
	


	
}
