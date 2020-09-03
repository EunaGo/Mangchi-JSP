package board.model;

import java.sql.Date;

public class RequestWriting {

	
	private int req_idx; 		//게시글 번호 
	private String req_writer;		//요청자 인덱스 번수
	private String req_title;	//게시글 제목	
	private int req_helper;		//수행자
	private int req_price;		//가격
	private Date req_regdate;	//등록날자
	private Date req_term;		//렌탈기간
	private String req_loc;		//지역
	private String req_text;	//상세내용
	private double req_latitude;//위도
	private double req_longitud;//경도
	private int req_readcnt;	//조회수
	private int req_status;		//현재상태
	private String req_img;		//사진
	
	public RequestWriting(int req_idx, String req_writer, String req_title, int req_helper, int req_price,
			Date req_regdate, Date req_term, String req_loc, String req_text, double req_latitude, double req_longitud,
			int req_readcnt, int req_status, String req_img) {
		this.req_idx = req_idx;
		this.req_writer = req_writer;
		this.req_title = req_title;
		this.req_helper = req_helper;
		this.req_price = req_price;
		this.req_regdate = req_regdate;
		this.req_term = req_term;
		this.req_loc = req_loc;
		this.req_text = req_text;
		this.req_latitude = req_latitude;
		this.req_longitud = req_longitud;
		this.req_readcnt = req_readcnt;
		this.req_status = req_status;
		this.req_img = req_img;
	}

	public RequestWriting() {
	}

	public int getReq_idx() {
		return req_idx;
	}

	public void setReq_idx(int req_idx) {
		this.req_idx = req_idx;
	}

	public String getReq_writer() {
		return req_writer;
	}

	public void setReq_writer(String req_writer) {
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

	public Date getReq_term() {
		return req_term;
	}

	public void setReq_term(Date req_term) {
		this.req_term = req_term;
	}

	public String getReq_loc() {
		return req_loc.trim();
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

	public double getReq_latitude() {
		return req_latitude;
	}

	public void setReq_latitude(double req_latitude) {
		this.req_latitude = req_latitude;
	}

	public double getReq_longitud() {
		return req_longitud;
	}

	public void setReq_longitud(double req_longitud) {
		this.req_longitud = req_longitud;
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
		
		
		return req_loc;
	}
	
	
	
	

	
	
	
}
