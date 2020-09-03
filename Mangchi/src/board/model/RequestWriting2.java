package board.model;

//import java.sql.Date;

import java.util.Date;

public class RequestWriting2 {
	private int req_idx;
	private int req_writer;
	private String writer_nick;
	private String req_title;
	private int req_helper;
	private String helper_nick;
	private int req_price;
	private String req_regdate;
	private String req_term;
	private String req_returnDate;
	private String req_loc;
	private String req_text;
	private double req_latitude;
	private double req_longitude;
	private int req_readcnt;
	private int req_status;
	private String req_img;
	private double distance;
	
	public RequestWriting2(
						int req_idx, 
						int req_writer,
						String writer_nick,
						String req_title, 
						int req_helper, 
						int req_price,
						String req_regdate, 
						String req_term,
						String req_returnDate,
						String req_loc, 
						String req_text, 
						double req_latitude, 
						double req_longitude,
						int req_readcnt, 
						int req_status, String req_img) {
		this.req_idx = req_idx;
		this.req_writer = req_writer;
		this.writer_nick = writer_nick;
		this.req_title = req_title;
		this.req_helper = req_helper;
		this.req_price = req_price;
		this.req_regdate = req_regdate;
		this.req_term = req_term;
		this.req_returnDate = req_returnDate;
		this.req_loc = req_loc;
		this.req_text = req_text;
		this.req_latitude = req_latitude;
		this.req_longitude = req_longitude;
		this.req_readcnt = req_readcnt;
		this.req_status = req_status;
		this.req_img = req_img;
	}

	public RequestWriting2() {}

	
	
	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public String getReq_returnDate() {
		return req_returnDate;
	}

	public void setReq_returnDate(String req_returnDate) {
		this.req_returnDate = req_returnDate;
	}

	public String getHelper_nick() {
		return helper_nick;
	}

	public void setHelper_nick(String helper_nick) {
		this.helper_nick = helper_nick;
	}

	public String getWriter_nick() {
		return writer_nick;
	}

	public void setWriter_nick(String writer_nick) {
		this.writer_nick = writer_nick;
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

	public String getReq_regdate() {
		return req_regdate;
	}

	public void setReq_regdate(String req_regdate) {
		this.req_regdate = req_regdate;
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
		this.req_text = req_text.replaceAll("\n", " ");
	}

	public double getReq_latitude() {
		return req_latitude;
	}

	public void setReq_latitude(double req_latitude) {
		this.req_latitude = req_latitude;
	}

	public double getReq_longitude() {
		return req_longitude;
	}

	public void setReq_longitude(double req_longitude) {
		this.req_longitude = req_longitude;
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

	@Override
	public String toString() {
		return "RequestWriting [req_idx=" + req_idx + ", req_writer=" + req_writer + ", writer_nick=" + writer_nick
				+ ", req_title=" + req_title + ", req_helper=" + req_helper + ", req_price=" + req_price
				+ ", req_regdate=" + req_regdate + ", req_term=" + req_term + ", req_loc=" + req_loc + ", req_text="
				+ req_text + ", req_latitude=" + req_latitude + ", req_longitude=" + req_longitude + ", req_readcnt="
				+ req_readcnt + ", req_status=" + req_status + ", req_img=" + req_img + "]";
	}

	
//	public java.util.Date toDate(){
//		return new java.util.Date(this.req_term.getTime());
//	}
}
