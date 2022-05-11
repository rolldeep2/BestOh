package edu.spring.team4.service;

import java.util.List;

import edu.spring.team4.domain.Board;
import edu.spring.team4.utils.Paging;

public interface BoardService {
	
	List<Board> select();
	int insert(Board board);
	Board selectNew(String title);
	Board select(int bno);
	int update(Board board);
	int delete(int bno);
	int updateLike(int bno,String liker);
	List<Board> select(int searchType, String searchKeyword);

	int countBoard(String board_meet_idx);
	List<Board> selectPageBoard(Paging page,String board_meet_idx,int orderby);

	List<Board> selectThree();
	
	List<Board> selectByUserCode(int userCode);
	
	List<Board> selectBest();
	List<Board> selectByMeetIdx(int meet_idx);
	
}
