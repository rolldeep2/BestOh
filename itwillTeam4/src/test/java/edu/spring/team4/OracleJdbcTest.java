package edu.spring.team4;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

// JUnit Test

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import oracle.jdbc.OracleDriver;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp//WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class OracleJdbcTest {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "scott";
	private static final String PASSWORD = "tiger";
	private static final Logger logger = LoggerFactory.getLogger("OracleJdbcTest.class");
	
	@Test
	public void doJunitTest() throws SQLException {
		logger.info("doJunitTest() 시작");
		
		DriverManager.registerDriver(new OracleDriver());
		logger.info("Driver 로딩 성공");
		
		Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
		logger.info("connection 성공: {}", conn);
		
		conn.close();
		logger.info("connection 해제 성공");
	}
}
