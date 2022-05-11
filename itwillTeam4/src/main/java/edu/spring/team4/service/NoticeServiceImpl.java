package edu.spring.team4.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.team4.domain.Notice;
import edu.spring.team4.persistence.NoticeDao;
import edu.spring.team4.utils.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {
	private static final Logger log = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	
	@Autowired private NoticeDao noticeDao;

	@Override
	public List<Notice> select() {
		log.info("select() 호출");
		
		
		return noticeDao.read();
	}

	@Override
	public int insert(Notice notice) {
		log.info("insert({}) 호출", notice);
		
		int result = noticeDao.create(notice);
		
		return result;
		
	}
	
	@Override
	public Notice select(int notice_idx) {
		log.info("select(notice_idx={}) 호출", notice_idx);
		
		Notice notice = noticeDao.read(notice_idx);
		
		
		return notice;
	}
	
	@Override
	public int update(Notice notice) {
		log.info("update({}) 호출", notice);
		
		int result = noticeDao.update(notice);
		
		return result;
	}
	
	@Override
	public int delete(int notice_idx) {
		log.info("delete(notice_idx={}) 호출", notice_idx);
		
		int result = noticeDao.delete(notice_idx);
		
		return result;
	}
	
	@Override
	public List<Notice> select(int type, String keyword) {
		
		log.info("select(type={}, keyword={}) 호출", type, keyword);
		
		
		return noticeDao.read(type,keyword);
	}

	@Override
	public int countNotice(String act) {
		return noticeDao.countNotice(act);
	}

	@Override
	public List<Notice> selectPageNotice(Paging page,String act) {
		return noticeDao.selectPageNotice(page,act);
	}
	
	@Override
	public List<Notice> selectTwo() {
		return noticeDao.selectTwo();
	}
	

}
