package request.model;

import java.sql.Date;

public class Request {
	private int req_idx;
	private int req_writer;
	private String req_title;
	private int req_helper;
	private int req_price;
	private Date req_regdate;
	private int req_returnDate;
	private String req_term;
	private String req_loc;
	private String req_text;
	private String member_latitude;
	private String member_longitude;
	private int req_readcnt;
	private int req_status;
	private String req_img;
	private String member_nick;
	private int day;
	private int hour;
	private int minute;
	
	public Request() {}

	public Request(int req_idx, int req_writer, String req_title, int req_helper, int req_price, Date req_regdate,
			int req_returnDate, String req_term, String req_loc, String req_text, String member_latitude,
			String member_longitude, int req_readcnt, int req_status, String req_img, String member_nick, int day,
			int hour, int minute) {
		super();
		this.req_idx = req_idx;
		this.req_writer = req_writer;
		this.req_title = req_title;
		this.req_helper = req_helper;
		this.req_price = req_price;
		this.req_regdate = req_regdate;
		this.req_returnDate = req_returnDate;
		this.req_term = req_term;
		this.req_loc = req_loc;
		this.req_text = req_text;
		this.member_latitude = member_latitude;
		this.member_longitude = member_longitude;
		this.req_readcnt = req_readcnt;
		this.req_status = req_status;
		this.req_img = req_img;
		this.member_nick = member_nick;
		this.day = day;
		this.hour = hour;
		this.minute = minute;
	}

	public int getReq_idx() {
		return req_idx;
	}

	public void setReq_idx(int req_idx) {
		this.req_idx = req_idx;
	}

	public int getReq_writer() {
		return req_writer;
	}

	public void setReq_writer(int req_writer) {
		this.req_writer = req_writer;
	}

	public String getReq_title() {
		return req_title;
	}

	public void setReq_title(String req_title) {
		this.req_title = req_title;
	}

	public int getReq_helper() {
		return req_helper;
	}

	public void setReq_helper(int req_helper) {
		this.req_helper = req_helper;
	}

	public int getReq_price() {
		return req_price;
	}

	public void setReq_price(int req_price) {
		this.req_price = req_price;
	}

	public Date getReq_regdate() {
		return req_regdate;
	}

	public void setReq_regdate(Date req_regdate) {
		this.req_regdate = req_regdate;
	}

	public int getReq_returnDate() {
		return req_returnDate;
	}

	public void setReq_returnDate(int req_returnDate) {
		this.req_returnDate = req_returnDate;
	}

	public String getReq_term() {
		return req_term;
	}

	public void setReq_term(String req_term) {
		this.req_term = req_term;
	}

	public String getReq_loc() {
		return req_loc;
	}

	public void setReq_loc(String req_loc) {
		this.req_loc = req_loc;
	}

	public String getReq_text() {
		return req_text;
	}

	public void setReq_text(String req_text) {
		this.req_text = req_text;
	}

	public String getMember_latitude() {
		return member_latitude;
	}

	public void setMember_latitude(String member_latitude) {
		this.member_latitude = member_latitude;
	}

	public String getMember_longitude() {
		return member_longitude;
	}

	public void setMember_longitude(String member_longitude) {
		this.member_longitude = member_longitude;
	}

	public int getReq_readcnt() {
		return req_readcnt;
	}

	public void setReq_readcnt(int req_readcnt) {
		this.req_readcnt = req_readcnt;
	}

	public int getReq_status() {
		return req_status;
	}

	public void setReq_status(int req_status) {
		this.req_status = req_status;
	}

	public String getReq_img() {
		return req_img;
	}

	public void setReq_img(String req_img) {
		this.req_img = req_img;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public int getMinute() {
		return minute;
	}

	public void setMinute(int minute) {
		this.minute = minute;
	}

	@Override
	public String toString() {
		return "Request [req_idx=" + req_idx + ", req_writer=" + req_writer + ", req_title=" + req_title
				+ ", req_helper=" + req_helper + ", req_price=" + req_price + ", req_regdate=" + req_regdate
				+ ", req_returnDate=" + req_returnDate + ", req_term=" + req_term + ", req_loc=" + req_loc
				+ ", req_text=" + req_text + ", member_latitude=" + member_latitude + ", member_longitude="
				+ member_longitude + ", req_readcnt=" + req_readcnt + ", req_status=" + req_status + ", req_img="
				+ req_img + ", member_nick=" + member_nick + ", day=" + day + ", hour=" + hour + ", minute=" + minute
				+ "]";
	}

	

}
