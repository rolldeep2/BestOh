package edu.spring.team4.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.team4.domain.Meet;
import edu.spring.team4.utils.Paging;

@Repository
public class MeetDaoImpl implements MeetDao {
	private static final Logger log = LoggerFactory.getLogger(MeetDaoImpl.class);
	private static final String MEET_NAMESPACE = "edu.spring.team4.mapper.MeetMapper";
	private static final String USER_NAMESPACE = "edu.spring.team4.mapper.UserMapper";
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MethodDao methodDao;
	@Override
	public List<Meet> read(Paging page) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("start", page.getStart());
		params.put("end", page.getEnd());
		
		log.info("meetDaoImpl.read() 호출");
		return sqlSession.selectList(MEET_NAMESPACE + ".selectAll",params);
	}

	@Override
	public Meet read(int meet_idx) {
		log.info("meetDaoImpl.read(meet_idx={}) 호출", meet_idx);
		return sqlSession.selectOne(MEET_NAMESPACE + ".selectByMeet_idx", meet_idx);
	}

	@Override
	public int create(Meet meet) {
		log.info("MeetDaoImpl.create({}) 호출", meet);

		return sqlSession.insert(MEET_NAMESPACE + ".create", meet);
	}

	@Override
	public int update(Meet meet) {
		log.info("MeetDaoImpl.update({}) 호출", meet);
		return sqlSession.update(MEET_NAMESPACE + ".update", meet);
	}

	@Override
	public int delete(int meet_idx) {
		log.info("MeetDaoImpl.delete(meet_idx={}) 호출", meet_idx);
		return sqlSession.delete(MEET_NAMESPACE + ".delete", meet_idx);
	}

	@Override
	public List<Meet> read(int type, String keyword) {
		log.info("meetDaoImpl.read(type={}, keyword={})", type, keyword);

		Map<String, Object> params = new HashMap<>();
		params.put("type", type);
		params.put("keyword", "%" + keyword.toLowerCase() + "%");

		return sqlSession.selectList(MEET_NAMESPACE + ".selectByKeyword", params);
	}
	
	@Override
	public List<Meet> selectThree() {
		log.info("MeetDaoImpl.selectThree() 호출");
		
		return sqlSession.selectList(MEET_NAMESPACE+".selectThree");
	}

	@Override
	public List<Meet> selectByHost(int host, int meet_idx) {
		log.info("MeetDaoImpl.selectByHost() 호출");
		Map<String, Integer> params = new HashMap<>();
		params.put("host",host);
		params.put("meet_idx", meet_idx);
		return sqlSession.selectList(MEET_NAMESPACE+".selectByHost",params);
	}
	
	
	
	@Override
	public int updateLike(int meet_idx, String joiner) {
		String old_member = sqlSession.selectOne(MEET_NAMESPACE+".selectLike",meet_idx);
		String old_meet_idx = sqlSession.selectOne(USER_NAMESPACE+".getMeetIdx",joiner);
		
		Map<String, Object> params = new HashMap<>();
		Map<String, Object> params2 = new HashMap<>();
		List<String> old_member_list = methodDao.toList(old_member);
		List<String> old_meet_idx_list = methodDao.toList(old_meet_idx);
		
		
		log.info("여기봐라ㅏ라라ㅏㅏ{}",old_member_list);
		if(old_member_list.contains(joiner)) {
			params.put("increase", -1);
			old_member_list.remove(joiner);
			old_meet_idx_list.remove(Integer.toString(meet_idx));
			
		}else {
			params.put("increase", 1);
			old_member_list.add(joiner);
			old_meet_idx_list.add(Integer.toString(meet_idx));
		}
		params.put("meet_idx",meet_idx);
		if(old_member_list.size()==0) {
			params.put("meet_member_code"," ");
		}else {
			params.put("meet_member_code"," "+methodDao.toString(old_member_list)+" ");
		}
		params2.put("user_code", Integer.parseInt(joiner));
		if(old_meet_idx_list.size()==0) {
			params2.put("user_meet_idx", " ");
		}else {
			params2.put("user_meet_idx", " "+methodDao.toString(old_meet_idx_list)+" ");
		}
		sqlSession.update(USER_NAMESPACE+".updateLike", params2);
		return sqlSession.update(MEET_NAMESPACE+".updateLike",params);
	}

	@Override
	public List<Meet> selectByMemberCode(String userCode) {
		return sqlSession.selectList(MEET_NAMESPACE+".selectByMemberCode", "%"+ userCode+"%");
	}

	@Override
	public List<Meet> find(int meet_on_or_off, String meet_theme, String meet_book_title) {
		log.info("여기는 meetDao.find");
		Map<String, Object> params = new HashMap<>();
		if(meet_theme==null) {
			meet_theme="%";
		}
		if(meet_book_title==""||meet_book_title==null) {
			meet_book_title="%";
		}
		params.put("meet_on_or_off", 3-meet_on_or_off);
		params.put("meet_theme", meet_theme);
		params.put("meet_book_title", "%"+meet_book_title+"%");
		return sqlSession.selectList(MEET_NAMESPACE+".find",params);
	}

	@Override
	public int countMeet() {
		return sqlSession.selectOne(MEET_NAMESPACE+".count");
	}
	
	@Override
	public Meet selectNew(String meet_name) {
		return sqlSession.selectOne(MEET_NAMESPACE+".selectNew", meet_name);
	}
}
