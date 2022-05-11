package edu.spring.team4.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.spring.team4.domain.User;

@Mapper
public interface UserMapper {

	
	String SIGN_UP = 
			"INSERT INTO ${TABLE_USER_TABLE} (${COL_USER_ID}, ${COL_USER_PWD}, ${COL_USER_NN}, ${COL_USER_NAME}, ${COL_USER_PHONE}, ${COL_USER_TAG}) "
			+ "VALUES (#{user_id}, #{user_pwd}, #{user_nn}, #{user_name}, #{user_phone}, #{user_tag})";
	
	@Insert(SIGN_UP)
	int insert(User user);
	
	// 중복 아이디 체크
	String CHECK_USER_ID = 
			"SELECT * FROM ${TABLE_USER_TABLE} WHERE ${COL_USER_ID} = #{user_id}";
	
	// 중복 닉네임 체크
	String CHECK_USER_NN = 
			"SELECT * FROM ${TABLE_USER_TABLE} WHERE ${COL_USER_NN} = #{user_nn}";
	
	@Select(CHECK_USER_ID)
	User selectByUserId(String user_id);
	
	@Select(CHECK_USER_NN)
	User selectByUserNn(String user_nn);
	
	// 로그인 체크
	String CHECK_SIGN_IN = 
			"SELECT * FROM ${TABLE_USER_TABLE} WHERE ${COL_USER_ID} = #{user_id} AND ${COL_USER_PWD} = #{user_pwd}";
	
	@Select(CHECK_SIGN_IN)
	User selectByIdAndPwd(User user);
	
	// 유저 코드로 불러오기
	String SELECT_USER_CODE = 
			"SELECT * FROM ${TABLE_USER_TABLE} WHERE ${COL_USER_CODE} = #{user_code}";
	
	@Select(SELECT_USER_CODE)
	User selectByUserCode(int user_code);
	
	// 프로필 수정하기

	
}