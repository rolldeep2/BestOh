package edu.spring.team4.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;

import edu.spring.team4.domain.Board;
import edu.spring.team4.domain.Meet;
import edu.spring.team4.domain.User;
import edu.spring.team4.persistence.UserDao;
import edu.spring.team4.service.BoardService;
import edu.spring.team4.service.MeetService;
import edu.spring.team4.service.UserMailSendService;
import edu.spring.team4.service.UserService;

@Controller  
@RequestMapping(value = "/user")
public class UserController {
	
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired private UserService userService;
	@Autowired private BoardService boardService;
	@Autowired private MeetService meetService;
	@Autowired private UserMailSendService mailsender;
	@Autowired private UserDao userdao;

	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register() {
		log.info("register() GET 호출");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(User user, @RequestParam(value = "url", required=true)String url, 
			HttpServletRequest request) {
		log.info("register({}) POST 호출", user);
		
		userService.registerNewUser(user);
		mailsender.mailSendWithUserKey(user.getUser_id(), user.getUser_nn(), request);
		
		return "redirect:" + url;
		
	}
	
	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	@ResponseBody
	public String checkUserId(String user_id) {
		log.info("checkUserId(user_id={})", user_id);
		
		if (userService.isValidId(user_id)) {
			return "valid_id";
		} else {
			return "invalid_id";
		}
	}
	
	@RequestMapping(value = "/checknn", method = RequestMethod.POST)
	@ResponseBody
	public String checkUserNn(String user_nn) {
		if (userService.isValidNn(user_nn)) {
			return "valid_nn";
		} else {
			return "invalid_nn";
		}
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void signIn(String url, Model model) {
		log.info("signIn() GET 호출");
		
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signIn(User user, HttpSession session, Model model,
			@RequestParam(value = "url", required=true)String url) {
		
		log.info("signIn({}) POST 호출", user);
		User signInUser = userService.checkSignIn(user);
			if (signInUser != null) { 
				session.setAttribute("signInUserId", signInUser.getUser_nn());
				session.setAttribute("userAdminCheck", signInUser.getUser_admin_check());
				session.setAttribute("signInUserCode", signInUser.getUser_code());
				session.setAttribute("userMeetIndex", signInUser.getUser_meet_idx());
				model.addAttribute("signInUser", signInUser);
				return "redirect:" + url;
			} else {
				return "redirect:" + url + "?signin=fail";
			}
	}

			
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signOut(HttpSession session,
			@RequestParam(value = "url", required=true)String url) {
		session.removeAttribute("signInUserId");
		session.removeAttribute("userAdminCheck");
		session.removeAttribute("signInUserCode");
		session.removeAttribute("userMeetIndex");
		session.invalidate();
		return "redirect:" + url;
	}
	
	@RequestMapping(value = "/userupdate", method = RequestMethod.GET)
	public String userupdate(HttpSession session, User user, Model model) {
		int userCode = (int)session.getAttribute("signInUserCode");
		User userUpdate = userService.select(userCode);
		model.addAttribute("userUpdate", userUpdate);
		return "/user/userupdate";
	}
	
	@RequestMapping(value = "/userupdate", method = RequestMethod.POST)
	public String userupdate(User user, HttpSession session) {
		userService.updateUser(user);
		int userCode = (int)session.getAttribute("signInUserCode");
		User signInUser = userService.select(userCode);
		session.removeAttribute("signInUserId");
		session.setAttribute("signInUserId", signInUser.getUser_nn());
		return "redirect:../";
	}
	
	@RequestMapping(value = "/userdelete", method = RequestMethod.GET)
	public String userDelete(HttpSession session, int user_code) {
		session.invalidate();
		
		userService.deleteUser(user_code);
		return "redirect:/";
	}
	

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypage(Model model, HttpSession session) {
		
		int userCode = (int)session.getAttribute("signInUserCode");
		List<Board> boardList = boardService.selectByUserCode(userCode);
		List<Meet> meetList = meetService.selectByMemberCode(Integer.toString(userCode));
		model.addAttribute("boardList",boardList);
		model.addAttribute("meetList",meetList);
		
	}
	
	@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("user_nn") String user_nn, @RequestParam("user_key") String key) {

		mailsender.alter_userKey_service(user_nn, key); // mailsender의 경우 @Autowired

		return "user/userRegSuccess";
	}
	
}
