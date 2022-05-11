package edu.spring.team4.persistence;

import edu.spring.team4.domain.Reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	private static final Logger log = LoggerFactory.getLogger(ReplyDaoImpl.class);
	private static final String NAMESPACE = "edu.spring.team4.mapper.ReplyMapper";
	@Autowired // 의존성 주입
	private SqlSession sqlSession;
	@Autowired
	private MethodDao methodDao;

	@Override
	public int create(Reply reply) {
		log.info("create({}) 호출", reply);

		return sqlSession.insert(NAMESPACE + ".insert", reply);
	}

	@Override
	public List<Reply> read(int bno) {
		log.info("read(bno={}) 호출", bno);

		return sqlSession.selectList(NAMESPACE + ".select", bno);
	}

	@Override
	public List<Reply> readLike(int bno) {
		log.info("readLike(bno={}) 호출", bno);

		return sqlSession.selectList(NAMESPACE + ".select_like", bno);
	}

	@Override
	public int update(Reply reply) {
		log.info("update({}) 호출", reply);

		return sqlSession.update(NAMESPACE + ".update", reply);
	}

	@Override
	public int delete(int rno) {
		log.info("delete(rno={}) 호출", rno);

		return sqlSession.delete(NAMESPACE + ".delete", rno);
	}

	@Override
	public int readBno(int rno) {
		log.info("readBno(rno={})", rno);

		return sqlSession.selectOne(NAMESPACE + ".readBno", rno);
	}

	@Override
	public int upLike(int rno, Reply liker) {
		log.info("upLike({},{}) 호출", rno, liker);
		String oldLiker = sqlSession.selectOne(NAMESPACE + ".readLiker", rno);
		List<String> list = methodDao.toList(oldLiker);
		log.info("list = {}", list);
		String newLiker = Integer.toString(liker.getUser_code());

		boolean result = methodDao.addList(list, newLiker);
		log.info("여기까진 왔니 {}", result);
		if (result) {
			Map<String, Object> params = new HashMap<>();
			params.put("reply_like", methodDao.toString(list));
			params.put("rno", rno);

			return sqlSession.update(NAMESPACE + ".update_like", params);
		} else {
			return 0;
		}

	}
}
