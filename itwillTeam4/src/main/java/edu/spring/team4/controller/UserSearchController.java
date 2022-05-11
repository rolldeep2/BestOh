package edu.spring.team4.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.spring.team4.service.UserSearchService;
import edu.spring.team4.service.UserMailSendService;

@Controller
public class UserSearchController {
	
	private static final Logger log = LoggerFactory.getLogger(UserSearchController.class);

	@Autowired
	private UserSearchService searchService;
	@Autowired
	private UserMailSendService mailsender;
	
	// 아이디 찾기
	@RequestMapping(value = "/user/userSearch", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("inputName_1") String user_name, 
			@RequestParam("inputPhone_1") String user_phone) {
		log.info("유저 서치 컨트롤러ㅓㅓㅓ 호출 아이디를 찾아보자 ");
		String result = searchService.get_searchId(user_name, user_phone);

		return result;
		
	}
	
	// 비번찾기 전 Y키 확인
	@RequestMapping(value = "/user/userPwdY", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("inputId") String user_id) {
		log.info("유저 서치 컨트롤러ㅓㅓㅓ 호출 비밀번호 찾기 전에 Y냐  ");
		String result = searchService.get_searchPwd(user_id);

		return result;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/user/searchPassword", method = RequestMethod.GET)
	@ResponseBody
	public String passwordSearch(@RequestParam(value="inputId", required=false)String user_id,
			@RequestParam("inputPhone_2")String user_phone,
			HttpServletRequest request) {
		log.info("유저 서치 컨트롤러ㅓㅓㅓ 호출 비번을 찾아보자 ");
		
		
		searchService.mailSendWithPassword(user_id, user_phone, request);
		
		return "user/searchPassword";
	}


	
}
