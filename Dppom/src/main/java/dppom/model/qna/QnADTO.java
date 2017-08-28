package dppom.model.qna;

import java.sql.Date;

public class QnADTO 
{
	private int idx;
	private String id;
	private String pass;
	private String title;
	private String content;
	private String email;
	private java.sql.Date regi_date;
	private String page_title;
	private String reply_flag;
	private String reply;
	private java.sql.Date reply_date;
	
	public QnADTO(int idx, String id, String pass, String title, String content, String email, Date regi_date,
			String page_title, String reply_flag, String reply, java.sql.Date reply_date) {
		super();
		this.idx = idx;
		this.id = id;
		this.pass = pass;
		this.title = title;
		this.content = content;
		this.email = email;
		this.regi_date = regi_date;
		this.page_title = page_title;
		this.reply_flag = reply_flag;
		this.reply = reply;
		this.reply_date = reply_date;
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
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public java.sql.Date getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(java.sql.Date regi_date) {
		this.regi_date = regi_date;
	}
	public String getPage_title() {
		return page_title;
	}
	public void setPage_title(String page_title) {
		this.page_title = page_title;
	}
	public String getReply_flag() {
		return reply_flag;
	}
	public void setReply_flag(String reply_flag) {
		this.reply_flag = reply_flag;
	}
	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
	public java.sql.Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(java.sql.Date reply_date) {
		this.reply_date = reply_date;
	}
}
