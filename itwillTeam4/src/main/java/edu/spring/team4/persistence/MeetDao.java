package edu.spring.team4.persistence;

import java.util.List;

import edu.spring.team4.domain.Meet;
import edu.spring.team4.utils.Paging;

public interface MeetDao {
	
	List<Meet> read(Paging page);
	List<Meet> selectByHost(int host, int meet_idx);
	List<Meet> selectByMemberCode(String userCode);
	List<Meet> find(int meet_on_or_off, String meet_theme, String meet_book_title);
	 
	 
	Meet read (int meet_idx);
	int create(Meet meet);
	int update(Meet meet);
	int delete(int meet_idx);
	List<Meet> read(int type, String keyword);
	List<Meet> selectThree();
	int updateLike(int meet_idx, String joiner);
	int countMeet();
	
	Meet selectNew(String meet_name);
}
