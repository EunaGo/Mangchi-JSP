package message.model;

import java.sql.Date;

public class Message {
	
	private int msg_idx;
	private int req_idx;
	private int msg_writer;
	
	private String msg_writerId;
	
	private String msg_receiver;
	private String msg_title;
	private String msg_text;
	private String msg_img;
	private Date msg_date;
	private int readcheck;
		
	public Message() {}

	public Message(int msg_idx, int req_idx, int msg_writer, String msg_receiver, String msg_title, String msg_text,
			String msg_img, Date msg_date, int readcheck) {
		this.msg_idx = msg_idx;
		this.req_idx = req_idx;
		this.msg_writer = msg_writer;
		this.msg_receiver = msg_receiver;
		this.msg_title = msg_title;
		this.msg_text = msg_text;
		this.msg_img = msg_img;
		this.msg_date = msg_date;
		this.readcheck = readcheck;
	}

	public Message(int msg_idx, int req_idx, int msg_writer, String msg_writerId, String msg_receiver, String msg_title,
			String msg_text, String msg_img, Date msg_date, int readcheck) {
		this.msg_idx = msg_idx;
		this.req_idx = req_idx;
		this.msg_writer=msg_writer;
		this.msg_writerId = msg_writerId;
		this.msg_receiver = msg_receiver;
		this.msg_title = msg_title;
		this.msg_text = msg_text;
		this.msg_img = msg_img;
		this.msg_date = msg_date;
		this.readcheck = readcheck;
	}

	public int getMsg_idx() {
		return msg_idx;
	}

	public void setMsg_idx(int msg_idx) {
		this.msg_idx = msg_idx;
	}

	public int getReq_idx() {
		return req_idx;
	}

	public void setReq_idx(int req_idx) {
		this.req_idx = req_idx;
	}

	public int getMsg_writer() {
		return msg_writer;
	}

	public void setMsg_writer(int msg_writer) {
		this.msg_writer = msg_writer;
	}

	public String getMsg_writerId() {
		return msg_writerId;
	}

	public void setMsg_writerId(String msg_writerId) {
		this.msg_writerId = msg_writerId;
	}

	public String getMsg_receiver() {
		return msg_receiver;
	}

	public void setMsg_receiver(String msg_receiver) {
		this.msg_receiver = msg_receiver;
	}

	public String getMsg_title() {
		return msg_title;
	}

	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}

	public String getMsg_text() {
		return msg_text;
	}

	public void setMsg_text(String msg_text) {
		this.msg_text = msg_text;
	}

	public String getMsg_img() {
		return msg_img;
	}

	public void setMsg_img(String msg_img) {
		this.msg_img = msg_img;
	}

	public Date getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}

	public int getReadcheck() {
		return readcheck;
	}

	public void setReadcheck(int readcheck) {
		this.readcheck = readcheck;
	}

	@Override
	public String toString() {
		return "Message [msg_idx=" + msg_idx + ", req_idx=" + req_idx + ", msg_writer=" + msg_writer + ", msg_writerId="
				+ msg_writerId + ", msg_receiver=" + msg_receiver + ", msg_title=" + msg_title + ", msg_text="
				+ msg_text + ", msg_img=" + msg_img + ", msg_date=" + msg_date + ", readcheck=" + readcheck + "]";
	}

	

	
	
	
}
