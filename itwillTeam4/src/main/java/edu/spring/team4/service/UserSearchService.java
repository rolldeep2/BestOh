package edu.spring.team4.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import edu.spring.team4.controller.UserSearchController;
import edu.spring.team4.domain.User;
import edu.spring.team4.mapper.UserMapper;
import edu.spring.team4.persistence.UserDao;
import edu.spring.team4.utils.AES256;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

@Service
public class UserSearchService {
	
	private static final Logger log = LoggerFactory.getLogger(UserSearchService.class);


	@Autowired private SqlSessionTemplate sqlSession;
	@Autowired private UserDao userDao;
	@Autowired private UserMapper mapper;
	@Autowired private JavaMailSender mailSender;
	public AES256 aes256 = new AES256();

	// 아이디 찾기
	public String get_searchId(String user_name, String user_phone) {

		mapper = sqlSession.getMapper(UserMapper.class);
		
		String result = "";

		try {
			result = userDao.searchId(user_name, user_phone);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public String get_searchPwd(String user_id) {
		mapper = sqlSession.getMapper(UserMapper.class);
		
		String result = "";
		
		try {
			result = userDao.searchPwdY(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	// 이메일 난수 만드는 메서드
		private String init() {
			Random ran = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;

			do {
				num = ran.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}
		
	// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;

		public String getKey(boolean lowerCheck, int size) {
			this.lowerCheck = lowerCheck;
			this.size = size;
			return init();
		}

		
	// 비밀번호 찾기
	public void mailSendWithPassword(String user_id, String user_phone, HttpServletRequest request) {
		// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
		String key = getKey(false, 6);
		mapper = sqlSession.getMapper(UserMapper.class);
		
		// 회원 이름 꺼내는 코드
		User user = userDao.checkUserId(user_id);
		String name = user.getUser_nn();
				
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ name +"' 님</h2><br><br>" 
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://localhost:8181/team4/'> 책오 홈페이지로 바로가기 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("<책오> 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			InternetAddress from = new InternetAddress("test@test.com");
	        mail.setFrom(from);
			mail.addRecipient(RecipientType.TO, new InternetAddress(user_id));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		// 비밀번호 암호화해주는 메서드
		try {
			key = aes256.encrypt(key);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 데이터 베이스 값은 암호한 값으로 저장시킨다.
		userDao.searchPassword(user_id, key);
		
	}
	
}
