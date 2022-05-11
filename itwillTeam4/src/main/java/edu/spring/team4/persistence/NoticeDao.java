package edu.spring.team4.persistence;

import java.util.List;

import edu.spring.team4.domain.Notice;
import edu.spring.team4.utils.Paging;

public interface NoticeDao {

	List<Notice> read();
	

	int create(Notice notice);
	Notice read(int notice_idx);
	int update(Notice notice);
	int delete(int notice_idx);
	List<Notice> read(int type, String keyword);
	
	
	int countNotice(String act);
	
	List<Notice> selectPageNotice(Paging page,String act);
	
	List<Notice> selectTwo();
}
