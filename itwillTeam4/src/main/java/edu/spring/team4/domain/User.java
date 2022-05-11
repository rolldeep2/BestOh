package edu.spring.team4.domain;

import java.util.Date;

public class User {

	private int user_code;
	private String user_id;
	private String user_pwd;
	private String user_nn;
	private String user_name;
	private Date user_reg_date;
	private String user_phone;
	private String user_meet_idx;
	private int user_admin_check;
	private String user_tag;
	private String user_key;
	
	
	public User() {}


	public User(int user_code, String user_id, String user_pwd, String user_nn, String user_name, Date user_reg_date,
			String user_phone, String user_meet_idx, int user_admin_check, String user_tag, String user_key) {
		this.user_code = user_code;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_nn = user_nn;
		this.user_name = user_name;
		this.user_reg_date = user_reg_date;
		this.user_phone = user_phone;
		this.user_meet_idx = user_meet_idx;
		this.user_admin_check = user_admin_check;
		this.user_tag = user_tag;
		this.user_key = user_key;
	}


	public int getUser_code() {
		return user_code;
	}


	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_pwd() {
		return user_pwd;
	}


	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}


	public String getUser_nn() {
		return user_nn;
	}


	public void setUser_nn(String user_nn) {
		this.user_nn = user_nn;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public Date getUser_reg_date() {
		return user_reg_date;
	}


	public void setUser_reg_date(Date user_reg_date) {
		this.user_reg_date = user_reg_date;
	}


	public String getUser_phone() {
		return user_phone;
	}


	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}


	public String getUser_meet_idx() {
		return user_meet_idx;
	}


	public void setUser_meet_idx(String user_meet_idx) {
		this.user_meet_idx = user_meet_idx;
	}


	public int getUser_admin_check() {
		return user_admin_check;
	}


	public void setUser_admin_check(int user_admin_check) {
		this.user_admin_check = user_admin_check;
	}


	public String getUser_tag() {
		return user_tag;
	}


	public void setUser_tag(String user_tag) {
		this.user_tag = user_tag;
	}
	
	
	
	
	public String getUser_key() {
		return user_key;
	}


	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}


@Override
	public String toString() {
		return String.format("User{user_code=%d, user_id=%s, user_pwd=%s, user_nn=%s, user_name=%s, user_reg_date=%s, user_phone=%s, user_meet_idx=%s,user_admin_check=%d,user_tag=%s", 
			this.user_code,this.user_id,this.user_pwd,this.user_nn,this.user_name,this.user_reg_date,this.user_phone,this.user_meet_idx,this.user_admin_check,this.user_tag);
	}	
	

}
