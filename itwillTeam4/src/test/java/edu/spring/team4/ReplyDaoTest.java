package edu.spring.team4;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.team4.domain.Reply;
import edu.spring.team4.persistence.MethodDao;
import edu.spring.team4.persistence.ReplyDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class ReplyDaoTest {

	private static final Logger log = LoggerFactory.getLogger(ReplyDaoTest.class);

	@Autowired
	private ReplyDao replyDao;
	@Autowired
	private MethodDao methodDao;

	@Test
	public void doTest() {
		log.info("replyDao:{}", replyDao);

Reply reply=new Reply();
reply.setBno(47);
reply.setRtext("젠지자아아아ㅏ장");
reply.setUser_id("강민수");
reply.setUser_code(8);
System.out.println(reply);
		replyDao.create(reply);
		
	}
}