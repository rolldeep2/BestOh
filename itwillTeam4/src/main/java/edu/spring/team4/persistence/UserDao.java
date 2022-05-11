package edu.spring.team4.persistence;

import org.apache.ibatis.annotations.Param;

import edu.spring.team4.domain.User;

public interface UserDao {
	
	int create(User user);
	User checkUserId(String user_id);
	User checkUserNn(String user_nn);
	User read(User user);
	User read(int user_code);
	int update(User user);
	int delete(int user_code);
	int getKey(String user_nn, String user_key);
	int alter_userKey(String user_nn, String user_key);
	String searchId(@Param("user_name")String user_name, @Param("user_phone")String user_phone); // 유저 ID 찾기
	String searchPwdY(@Param("user_id")String user_id);
	int searchPassword(String user_id, String key);
}