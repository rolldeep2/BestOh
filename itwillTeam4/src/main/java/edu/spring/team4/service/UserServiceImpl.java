package edu.spring.team4.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.team4.domain.Board;
import edu.spring.team4.domain.User;
import edu.spring.team4.persistence.UserDao;

@Service 
public class UserServiceImpl implements UserService {
	
	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
	
	
	@Autowired private UserDao userDao;
		
	@Override
	public int registerNewUser(User user) {
		log.info("registerNewUser({}) 호출", user);
		
		return userDao.create(user);
	}

	@Override
	public boolean isValidId(String user_id) {
		log.info("isValidId(user_id={}) 호출", user_id);
		
		User user = userDao.checkUserId(user_id);
		if (user == null) { 
			return true;
		} else { 
			return false;
		}
	}
	
	@Override
	public boolean isValidNn(String user_nn) {
		log.info("isValidNn(user_nn={}) 호출", user_nn);
		
		User user = userDao.checkUserNn(user_nn);
		if (user == null) { 
			return true;
		} else { 
			return false;
		}
	}
	
	@Override
	public User checkSignIn(User user) {
		log.info("checkSignIn({}) 호출", user);
		
		return userDao.read(user);
	}
	
	 @Override
	public User select(int user_code) {
		return userDao.read(user_code);
	}
	
	 @Override
	public int updateUser(User user) {
		return userDao.update(user);
	}
	 
	@Override
	public int deleteUser(int user_code) {
		return userDao.delete(user_code);
	}
	
}