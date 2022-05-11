package edu.spring.team4;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.team4.DataSourceTest;
import edu.spring.team4.domain.Board;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" }
)
@WebAppConfiguration
public class DataSourceTest {
	private static final Logger logger = LoggerFactory.getLogger(DataSourceTest.class);

	@Autowired private DataSource ds;
	@Autowired private SqlSessionFactory sessionFactory;
	@Autowired private SqlSession sqlSession;
	
	@Test 
	public void doTest() throws SQLException {
		logger.info("ds: {}", ds); 
		
		Connection conn = ds.getConnection();
		logger.info("connection: {}" , conn);
		
		conn.close();
		logger.info("connection 해제");
		logger.info("sessionFactory: {}", sessionFactory);
		logger.info("sqlSession: {}", sqlSession);
		
		List<Board> list = sqlSession.selectList("edu.spring.team4.mapper.BoardMapper.selectAll");
		for (Board b : list) {
			logger.info(b.toString());
		}
	}
}
