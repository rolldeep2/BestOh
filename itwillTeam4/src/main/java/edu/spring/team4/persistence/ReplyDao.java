package edu.spring.team4.persistence;

import java.util.List;

import edu.spring.team4.domain.Reply;

public interface ReplyDao {

	int create(Reply reply);
	List<Reply> read(int bno);
	List<Reply> readLike(int bno);
	
	/***
	 * 
	 * 이거 댓글 내용만 수정됨
	 * 	 */
	int update(Reply reply);
	
//	int clikeLike(int rno);
	int delete(int rno);
	int readBno(int rno);
	int upLike(int rno,Reply liker);
}
