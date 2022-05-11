package edu.spring.team4.service;

import edu.spring.team4.domain.User;

public interface UserService {
	
	int registerNewUser(User user);
	boolean isValidId(String user_id);
	boolean isValidNn(String user_nn);
	User checkSignIn(User user);
	User select(int user_code);
	int updateUser(User user);
	int deleteUser(int user_code);

}