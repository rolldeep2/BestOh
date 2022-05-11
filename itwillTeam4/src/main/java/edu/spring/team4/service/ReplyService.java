package edu.spring.team4.service;

import java.util.List;

import edu.spring.team4.domain.Reply;

public interface ReplyService {

	List<Reply> select(int bno);
	List<Reply> select_like(int bno);
	int insert(Reply reply);
	int update(Reply reply);
	int delete(int rno);
	int upLike(int rno,Reply liker);
}
