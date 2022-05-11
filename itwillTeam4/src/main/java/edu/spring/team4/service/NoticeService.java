package edu.spring.team4.service;

import java.util.List;

import edu.spring.team4.domain.Notice;
import edu.spring.team4.utils.Paging;

public interface NoticeService {

	
	List<Notice> select();
	
	int insert(Notice notice);
	Notice select(int notice_idx);
	
	
	int update(Notice notice);
	
	int delete(int notice_idx);
	List<Notice> select(int type, String keyword);
	
	// 게시물 총 갯수
	int countNotice(String act);
	
	// 페이징 처리 공지글 조회
	List<Notice> selectPageNotice(Paging page,String act);
	
	//홈화면 공지사항 두개만
	
	List<Notice> selectTwo();
}
