package edu.spring.team4.domain;

import java.util.Date;

public class Notice {

	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private Date notice_reg_date;
	private String notice_category;
	
	public Notice() {}

	public Notice(int notice_idx, String notice_title, String notice_content, Date notice_reg_date,
			String notice_category) {
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_reg_date = notice_reg_date;
		this.notice_category = notice_category;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_reg_date() {
		return notice_reg_date;
	}

	public void setNotice_reg_date(Date notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}

	public String getNotice_category() {
		return notice_category;
	}

	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}
	


	
}
