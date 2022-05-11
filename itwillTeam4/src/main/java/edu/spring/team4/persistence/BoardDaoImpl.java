package edu.spring.team4.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.team4.domain.Board;
import edu.spring.team4.utils.Paging;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger log = LoggerFactory.getLogger(BoardDaoImpl.class);
	private static final String BOARD_NAMESPACE = "edu.spring.team4.mapper.BoardMapper";

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MethodDao methodDao;

	@Override
	public List<Board> read() {
		log.info("boardDaoImpl.read() 호출");

		return sqlSession.selectList(BOARD_NAMESPACE + ".selectAll");
	}

	@Override
	public Board read(int bno) {
		log.info("boardDaoImpl.read(bno={}) 호출", bno);
		return sqlSession.selectOne(BOARD_NAMESPACE + ".selectByBno", bno);
	}

	@Override
	public int create(Board board) {
		log.info("boardDaoImpl.create({}) 호출", board);


		return sqlSession.insert(BOARD_NAMESPACE + ".create", board);
	}

	@Override
	public int update(Board board) {
		log.info("boardDaoImpl.update({}) 호출", board);
		return sqlSession.update(BOARD_NAMESPACE + ".update", board);
	}

	@Override
	public int updateViewCnt(int bno) {
		log.info("boardDaoImpl.updateViewCnt(bno={}) 호출", bno);
		return sqlSession.update(BOARD_NAMESPACE + ".updateViewCnt", bno);
	}

	@Override
	public int delete(int bno) {
		log.info("boardDaoImpl.delete(bno={}) 호출", bno);
		return sqlSession.delete(BOARD_NAMESPACE + ".delete", bno);
	}

	@Override
	public List<Board> read(int type, String keyword) {
		log.info("boardDaoImpl.read(type={}, keyword={})", type, keyword);

		Map<String, Object> params = new HashMap<>();
		params.put("type", type);
		params.put("keyword", "%" + keyword.toLowerCase() + "%");

		return sqlSession.selectList(BOARD_NAMESPACE + ".selectByKeyword", params);
	}

	@Override
	public int updateReplyCnt(int bno, int increase) {
		log.info("updateReplyCnt(bno={}, increase={}) 호출", bno, increase);

		Map<String, Object> params = new HashMap<>();
		params.put("bno", bno);
		params.put("increase", increase);

		return sqlSession.update(BOARD_NAMESPACE + ".updateReplyCnt", params);

	}

	@Override
	public int countBoard(String board_meet_idx) {
		log.info("여기ㅣㅣㅣㅣㅣㅣ{}", methodDao.toList(board_meet_idx));
		Map<String, Object> params = new HashMap<>();
		List<String> list = methodDao.toList(board_meet_idx);
		params.put("list", list);
		return sqlSession.selectOne(BOARD_NAMESPACE+".countBoard",params);
	}

	@Override
	public List<Board> selectPageBoard(Paging page, String board_meet_idx1, int orderby) {
		Map<String, Object> params = new HashMap<>();
		log.info("저기ㅣㅣㅣㅣㅣㅣㅣㅣ{}", board_meet_idx1);
		
		List<String> board_meet_idx = methodDao.toList(board_meet_idx1);
		board_meet_idx.add("test");
		params.put("list", board_meet_idx);
		params.put("start", page.getStart());
		params.put("end", page.getEnd());
		params.put("orderby", orderby);
		List<Board> result = null;
		result = sqlSession.selectList(BOARD_NAMESPACE + ".selectPageBoardBno", params);
		return result;
	}

	@Override
	public List<Board> selectThree() {
		return sqlSession.selectList(BOARD_NAMESPACE + ".selectThree");
	}
	
	@Override
	public List<Board> selectByUserCode(int userCode) {
		log.info("뭐냐{}",userCode);
		return sqlSession.selectList(BOARD_NAMESPACE+".selectByUserCode",userCode);
	}

	@Override
	public int updateLike(int bno, String liker) {
		String old_like = sqlSession.selectOne(BOARD_NAMESPACE+".selectLike",bno);
		Map<String, Object> params = new HashMap<>();
		List<String> list = methodDao.toList(old_like);
		if(list.contains(liker)) {
			params.put("increase", -1);
			list.remove(liker);
		}else {
			params.put("increase", 1);
			list.add(liker);
		}
		params.put("bno",bno);
		if(list.size()==0) {
			params.put("board_like"," ");
		}else {
			params.put("board_like",methodDao.toString(list));
		}
		return sqlSession.update(BOARD_NAMESPACE+".updateLike",params);
	}

	@Override
	public List<Board> selectBest() {
		log.info("selectBest({}) 호출");
		return sqlSession.selectList(BOARD_NAMESPACE+".selectBest");
				
	}

	@Override
	public Board selectNew(String board_title) {
		return sqlSession.selectOne(BOARD_NAMESPACE+".selectNew", board_title);
	}

	@Override
	public List<Board> selectByMeetIdx(int meet_idx) {
		return sqlSession.selectList(BOARD_NAMESPACE+".selectByMeetIdx",Integer.toString(meet_idx));
	}
}
