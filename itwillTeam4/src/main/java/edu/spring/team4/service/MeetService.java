package edu.spring.team4.service;

import java.util.List;

import edu.spring.team4.domain.Meet;
import edu.spring.team4.utils.Paging;

public interface MeetService {
	
	List<Meet> select(Paging page);
	List<Meet> selectByHost(int host,int meet_idx);
	List<Meet> selectByMemberCode(String userCode);
	List<Meet> find(int meet_on_or_off, String meet_theme, String meet_book_title);
	
	int insert(Meet meet);
	Meet select(int meet_idx);
	int update(Meet meet);
	int delete(int meet_idx);
	int countMeet();
	
	
	List<Meet> select(int searchType, String searchKeyword);
	List<Meet> selectThree();
	int updateLike(int meet_idx, String joiner);
	
	Meet selectNew(String meet_name);

}
