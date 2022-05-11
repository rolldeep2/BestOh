package edu.spring.team4;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.team4.domain.Board;
import edu.spring.team4.domain.User;
import edu.spring.team4.persistence.BoardDao;
import edu.spring.team4.persistence.UserDao;
import edu.spring.team4.utils.AES256;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class BoardDaoTest {
	private static final Logger log = LoggerFactory.getLogger(BoardDaoTest.class);

	@Autowired
	private BoardDao boardDao;
	@Autowired
	private UserDao userDao;

	@Test
	public void deTest() {	

		AES256 aes256= new AES256();
		try {
			log.info("{}",aes256.decrypt("Z1CLewotyvG413H4citvCg"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
//		
//		Board board = boardDao.read(3);
//		log.info(board.toString());
		
//		Board board = new Board(0, "글 추가하기", "내용 추가하기", 0, null, 0, null, "태그입력", "책이름", "저자", "출판사", "표지", "admin", 0);
//		int result = boardDao.create(board);
//		log.info("INSERT 결과: {}", result);
//		
//		

	}

}
