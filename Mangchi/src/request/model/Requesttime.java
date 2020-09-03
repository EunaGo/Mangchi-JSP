package request.model;

import java.sql.Date;

public class Requesttime {
	private int day;
	private int hour;
	private int minute;
	
	public Requesttime(int day, int hour, int minute) {
		super();
		this.day = day;
		this.hour = hour;
		this.minute = minute;
	}
	
	public Requesttime() {
		super();
		// TODO Auto-generated constructor stub
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
		return "Requesttime [day=" + day + ", hour=" + hour + ", minute=" + minute + "]";
	}
	
	

}
