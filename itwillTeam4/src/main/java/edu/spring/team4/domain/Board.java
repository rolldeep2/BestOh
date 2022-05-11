package edu.spring.team4.domain;

import java.util.Date;

public class Board {

	private int bno;
	private String board_title;
	private String board_content;
	private int board_view_cnt;
	private String board_like;
	private String board_meet_idx;
	private Date board_reg_date;
	private String board_tag;
	private String board_book_title;
	private String board_book_authors;
	private String board_book_pub;
	private String board_book_img;
	private String board_userid;
	private int board_reply_cnt;
	private int board_like_cnt;
	private int board_usercode;
	
	public Board() {}
	
	public Board(int bno, String board_title, String board_content, int board_view_cnt, String board_like,
			String board_meet_idx, Date board_reg_date, String board_tag, String board_book_title,
			String board_book_authors, String board_book_pub, String board_book_img, String board_userid,
			int board_reply_cnt, int board_like_cnt, int board_usercode) {
		this.bno = bno;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_view_cnt = board_view_cnt;
		this.board_like = board_like;
		this.board_meet_idx = board_meet_idx;
		this.board_reg_date = board_reg_date;
		this.board_tag = board_tag;
		this.board_book_title = board_book_title;
		this.board_book_authors = board_book_authors;
		this.board_book_pub = board_book_pub;
		this.board_book_img = board_book_img;
		this.board_userid = board_userid;
		this.board_reply_cnt = board_reply_cnt;
		this.board_like_cnt = board_like_cnt;
		this.board_usercode = board_usercode;
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
	 * @return the board_title
	 */
	public String getBoard_title() {
		return board_title;
	}

	/**
	 * @param board_title the board_title to set
	 */
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	/**
	 * @return the board_content
	 */
	public String getBoard_content() {
		return board_content;
	}

	/**
	 * @param board_content the board_content to set
	 */
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	/**
	 * @return the board_view_cnt
	 */
	public int getBoard_view_cnt() {
		return board_view_cnt;
	}

	/**
	 * @param board_view_cnt the board_view_cnt to set
	 */
	public void setBoard_view_cnt(int board_view_cnt) {
		this.board_view_cnt = board_view_cnt;
	}

	/**
	 * @return the board_like
	 */
	public String getBoard_like() {
		return board_like;
	}

	/**
	 * @param board_like the board_like to set
	 */
	public void setBoard_like(String board_like) {
		this.board_like = board_like;
	}

	/**
	 * @return the board_meet_idx
	 */
	public String getBoard_meet_idx() {
		return board_meet_idx;
	}

	/**
	 * @param board_meet_idx the board_meet_idx to set
	 */
	public void setBoard_meet_idx(String board_meet_idx) {
		this.board_meet_idx = board_meet_idx;
	}

	/**
	 * @return the board_reg_date
	 */
	public Date getBoard_reg_date() {
		return board_reg_date;
	}

	/**
	 * @param board_reg_date the board_reg_date to set
	 */
	public void setBoard_reg_date(Date board_reg_date) {
		this.board_reg_date = board_reg_date;
	}

	/**
	 * @return the board_tag
	 */
	public String getBoard_tag() {
		return board_tag;
	}

	/**
	 * @param board_tag the board_tag to set
	 */
	public void setBoard_tag(String board_tag) {
		this.board_tag = board_tag;
	}

	/**
	 * @return the board_book_title
	 */
	public String getBoard_book_title() {
		return board_book_title;
	}

	/**
	 * @param board_book_title the board_book_title to set
	 */
	public void setBoard_book_title(String board_book_title) {
		this.board_book_title = board_book_title;
	}

	/**
	 * @return the board_book_authors
	 */
	public String getBoard_book_authors() {
		return board_book_authors;
	}

	/**
	 * @param board_book_authors the board_book_authors to set
	 */
	public void setBoard_book_authors(String board_book_authors) {
		this.board_book_authors = board_book_authors;
	}

	/**
	 * @return the board_book_pub
	 */
	public String getBoard_book_pub() {
		return board_book_pub;
	}

	/**
	 * @param board_book_pub the board_book_pub to set
	 */
	public void setBoard_book_pub(String board_book_pub) {
		this.board_book_pub = board_book_pub;
	}

	/**
	 * @return the board_book_img
	 */
	public String getBoard_book_img() {
		return board_book_img;
	}

	/**
	 * @param board_book_img the board_book_img to set
	 */
	public void setBoard_book_img(String board_book_img) {
		this.board_book_img = board_book_img;
	}

	/**
	 * @return the board_userid
	 */
	public String getBoard_userid() {
		return board_userid;
	}

	/**
	 * @param board_userid the board_userid to set
	 */
	public void setBoard_userid(String board_userid) {
		this.board_userid = board_userid;
	}

	/**
	 * @return the board_reply_cnt
	 */
	public int getBoard_reply_cnt() {
		return board_reply_cnt;
	}

	/**
	 * @param board_reply_cnt the board_reply_cnt to set
	 */
	public void setBoard_reply_cnt(int board_reply_cnt) {
		this.board_reply_cnt = board_reply_cnt;
	}

	/**
	 * @return the board_like_cnt
	 */
	public int getBoard_like_cnt() {
		return board_like_cnt;
	}

	/**
	 * @param board_like_cnt the board_like_cnt to set
	 */
	public void setBoard_like_cnt(int board_like_cnt) {
		this.board_like_cnt = board_like_cnt;
	}

	public int getBoard_usercode() {
		return board_usercode;
	}

	public void setBoard_usercode(int board_usercode) {
		this.board_usercode = board_usercode;
	}
	
	
}
