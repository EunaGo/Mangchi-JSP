package review.model;

import java.sql.Date;

public class Reviewjoin {

	
	private int review_idx;
	private int req_idx;
	private int review_receiver;
	private int review_writer;
	private float review_score;
	private String review_text;
	private String review_regdate;
	
	private String req_title;
	private String member_nick;
	
	
	public Reviewjoin() {
		
	}


	public Reviewjoin(int review_idx, int req_idx, int review_receiver, int review_writer, float review_score,
			String review_text, String review_regdate, String req_title, String member_nick) {
		this.review_idx = review_idx;
		this.req_idx = req_idx;
		this.review_receiver = review_receiver;
		this.review_writer = review_writer;
		this.review_score = review_score;
		this.review_text = review_text;
		this.review_regdate = review_regdate;
		this.req_title = req_title;
		this.member_nick = member_nick;
	}


	public int getReview_idx() {
		return review_idx;
	}


	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}


	public int getReq_idx() {
		return req_idx;
	}


	public void setReq_idx(int req_idx) {
		this.req_idx = req_idx;
	}


	public int getReview_receiver() {
		return review_receiver;
	}


	public void setReview_receiver(int review_receiver) {
		this.review_receiver = review_receiver;
	}


	public int getReview_writer() {
		return review_writer;
	}


	public void setReview_writer(int review_writer) {
		this.review_writer = review_writer;
	}


	public float getReview_score() {
		return review_score;
	}


	public void setReview_score(float review_score) {
		this.review_score = review_score;
	}


	public String getReview_text() {
		return review_text;
	}


	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}


	public String getReview_regdate() {
		return review_regdate;
	}


	public void setReview_regdate(String review_regdate) {
		this.review_regdate = review_regdate;
	}


	public String getReq_title() {
		return req_title;
	}


	public void setReq_title(String req_title) {
		this.req_title = req_title;
	}


	public String getMember_nick() {
		return member_nick;
	}


	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}


	@Override
	public String toString() {
		return "Reviewjoin [review_idx=" + review_idx + ", req_idx=" + req_idx + ", review_receiver=" + review_receiver
				+ ", review_writer=" + review_writer + ", review_score=" + review_score + ", review_text=" + review_text
				+ ", review_regdate=" + review_regdate + ", req_title=" + req_title + ", member_nick=" + member_nick
				+ "]";
	}
	
	
	
	
	
	
	
}