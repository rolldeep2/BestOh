package edu.spring.team4.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.team4.domain.Board;
import edu.spring.team4.persistence.BoardDao;
import edu.spring.team4.utils.Paging;

@Service
public class BoardServiceImpl implements BoardService {
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	// Service 계층은 Persistence(Repository) 계층의 객체를 사용.
	@Autowired private BoardDao boardDao;
	
	@Override
	public List<Board> select() {
		log.info("select() 호출");
		return boardDao.read();
	}

	@Override
	public int insert(Board board) {
		int result = boardDao.create(board);
		
		return result;
	}

	@Override
	public Board select(int bno) {
		
		Board board = boardDao.read(bno);
		boardDao.updateViewCnt(bno);
		
		return board;
	}

	@Override
	public int update(Board board) {
		return boardDao.update(board);
	}
	
	@Override
	public int delete(int bno) {
		return boardDao.delete(bno);
	}
	
	@Override
	public List<Board> select(int searchType, String searchKeyword) {
		return boardDao.read(searchType, searchKeyword);
	}

	@Override
	public int countBoard(String board_meet_idx) {
		return boardDao.countBoard(board_meet_idx);
	}

	@Override
	public List<Board> selectPageBoard(Paging page,String board_meet_idx,int orderby) {
		return boardDao.selectPageBoard(page,board_meet_idx,orderby);
	}
	
	@Override
	public List<Board> selectThree() {
		return boardDao.selectThree();
	}
	
	@Override
	public List<Board> selectByUserCode(int userCode) {
		return boardDao.selectByUserCode(userCode);
	}

	@Override
	public int updateLike(int bno, String liker) {
		return boardDao.updateLike(bno, liker);
	}
	
	@Override
	public List<Board> selectBest() {
		return boardDao.selectBest();
		
	}

	@Override
	public Board selectNew(String board_title) {
		return boardDao.selectNew(board_title);
	}

	@Override
	public List<Board> selectByMeetIdx(int meet_idx) {
		return boardDao.selectByMeetIdx(meet_idx);
	}

}
