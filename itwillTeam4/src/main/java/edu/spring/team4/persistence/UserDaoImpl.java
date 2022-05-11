package edu.spring.team4.persistence;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.team4.domain.User;
import edu.spring.team4.mapper.UserMapper;
import edu.spring.team4.utils.AES256;

@Repository
public class UserDaoImpl implements UserDao {

	private static final Logger log = LoggerFactory.getLogger(UserDaoImpl.class);
	private static final String USER_NAMESPACE = "edu.spring.team4.mapper.UserMapper";
	private AES256 aes256 = new AES256();

	@Autowired
	private UserMapper mapper;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int create(User user) {
		log.info("create({}) 호출", user);
		try {
			user.setUser_pwd(aes256.encrypt(user.getUser_pwd()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.insert(user);
	}

	@Override
	public User checkUserId(String user_id) {
		log.info("checkUserId(user_id={}) 호출", user_id);

		return mapper.selectByUserId(user_id);
	}

	@Override
	public User checkUserNn(String user_nn) {
		log.info("checkUserNn(user_nn={}) 호출", user_nn);
		return mapper.selectByUserNn(user_nn);
	}

	@Override
	public User read(User user) {
		log.info("read({}) 호출", user);
		try {
			user.setUser_pwd(aes256.encrypt(user.getUser_pwd()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		User result = mapper.selectByIdAndPwd(user);
		try {
			result.setUser_pwd(aes256.decrypt(result.getUser_pwd()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public User read(int user_code) {
		User result = mapper.selectByUserCode(user_code);
		try {
			result.setUser_pwd(aes256.decrypt(result.getUser_pwd()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int update(User user) {
		try {
			user.setUser_pwd(aes256.encrypt(user.getUser_pwd()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sqlSession.update(USER_NAMESPACE + ".update", user);
	}

	@Override
	public int delete(int user_code) {
		log.info("delete 호출");
		return sqlSession.delete(USER_NAMESPACE + ".delete", user_code);
	}

	@Override
	public int getKey(String user_nn, String user_key) {
		Map<String, String> params = new HashMap<>();
		params.put("user_nn",user_nn);
		params.put("user_key", user_key);
		return sqlSession.update(USER_NAMESPACE + ".getKey", params);
	}
	
	@Override
	public int alter_userKey(String user_nn, String user_key) {
		Map<String, String> params = new HashMap<>();
		params.put("user_nn",user_nn);
		params.put("user_key", user_key);
		return sqlSession.update(USER_NAMESPACE + ".alter_userkey", params);
	}

	@Override
	public String searchId(String user_name, String user_phone) {
		Map<String, String> params = new HashMap<>();
		params.put("user_name",user_name);
		params.put("user_phone", user_phone);
		return sqlSession.selectOne(USER_NAMESPACE + ".searchId", params);
	}

	@Override
	public int searchPassword(String user_id, String key) {
		Map<String, String> params = new HashMap<>();
		params.put("user_id",user_id);
		params.put("key", key);
		return sqlSession.update(USER_NAMESPACE + ".searchPassword", params);
	}
	
	@Override
	public String searchPwdY(String user_id) {
		return sqlSession.selectOne(USER_NAMESPACE + ".searchPwdY", user_id);
	}

}