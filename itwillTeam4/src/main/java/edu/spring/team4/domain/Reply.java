package edu.spring.team4.domain;

import java.util.Date;

public class Reply {

	private int rno;
	private String rtext;
	private String user_id;
	private Date reply_reg_date;
	private String reply_like;
	private int reply_like_cnt;
	private int bno;
	private int user_code;

	public Reply() {
		super();
	}

	public Reply(int rno, String rtext, String user_id, Date reply_reg_date, String reply_like, int reply_like_cnt,
			int bno, int user_code) {
		super();
		this.rno = rno;
		this.rtext = rtext;
		this.user_id = user_id;
		this.reply_reg_date = reply_reg_date;
		this.reply_like = reply_like;
		this.reply_like_cnt = reply_like_cnt;
		this.bno = bno;
		this.user_code = user_code;
	}

	/**
	 * @return the rno
	 */
	public int getRno() {
		return rno;
	}

	/**
	 * @param rno the rno to set
	 */
	public void setRno(int rno) {
		this.rno = rno;
	}

	/**
	 * @return the rtext
	 */
	public String getRtext() {
		return rtext;
	}

	/**
	 * @param rtext the rtext to set
	 */
	public void setRtext(String rtext) {
		this.rtext = rtext;
	}

	/**
	 * @return the user_id
	 */
	public String getUser_id() {
		return user_id;
	}

	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	/**
	 * @return the reply_reg_date
	 */
	public Date getReply_reg_date() {
		return reply_reg_date;
	}

	/**
	 * @param reply_reg_date the reply_reg_date to set
	 */
	public void setReply_reg_date(Date reply_reg_date) {
		this.reply_reg_date = reply_reg_date;
	}

	/**
	 * @return the reply_like
	 */
	public String getReply_like() {
		return reply_like;
	}

	/**
	 * @param reply_like the reply_like to set
	 */
	public void setReply_like(String reply_like) {
		this.reply_like = reply_like;
	}

	/**
	 * @return the reply_like_cnt
	 */
	public int getReply_like_cnt() {
		return reply_like_cnt;
	}

	/**
	 * @param reply_like_cnt the reply_like_cnt to set
	 */
	public void setReply_like_cnt(int reply_like_cnt) {
		this.reply_like_cnt = reply_like_cnt;
	}

	/**
	 * @return the bno
	 */
	public int getBno() {
		return bno;
	}

	/**
	 * @param bno the bno to set
	 */
	public void setBno(int bno) {
		this.bno = bno;
	}

	/**
	 * @return the user_code
	 */
	public int getUser_code() {
		return user_code;
	}

	/**
	 * @param user_code the user_code to set
	 */
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", rtext=" + rtext + ", user_id=" + user_id + ", reply_reg_date=" + reply_reg_date
				+ ", reply_like=" + reply_like + ", reply_like_cnt=" + reply_like_cnt + ", bno=" + bno + ", user_code="
				+ user_code + "]";
	}


}
