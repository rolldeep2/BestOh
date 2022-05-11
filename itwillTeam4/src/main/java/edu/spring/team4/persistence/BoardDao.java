package edu.spring.team4.persistence;

import java.util.List;

import edu.spring.team4.domain.Board;
import edu.spring.team4.utils.Paging;

public interface BoardDao {
	
	public List<Board> read();
	Board read (int bno);
	Board selectNew(String board_title);
	int create(Board board);
	int update(Board board);
	int updateViewCnt(int bno);
	int updateLike(int bno, String liker);
	int delete(int bno);
	List<Board> read(int type, String keyword);
	int updateReplyCnt(int bno, int increase);

	int countBoard(String board_meet_idx);
	
	List<Board> selectPageBoard(Paging page,String board_meet_idx,int orderby);
	List<Board> selectThree();
	List<Board> selectByUserCode(int userCode);
	List<Board> selectBest();
	public List<Board> selectByMeetIdx(int meet_idx);
	
	
}
