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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.spring.team4.domain.Board;
import edu.spring.team4.domain.Meet;
import edu.spring.team4.domain.User;
import edu.spring.team4.service.BoardService;
import edu.spring.team4.service.MeetService;
import edu.spring.team4.service.UserService;

@Controller
@RequestMapping(value = "/meet")
public class MeetController {
	private static final Logger log = LoggerFactory.getLogger(MeetController.class);

	@Autowired
	private MeetService meetService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Model model) {
		log.info("main() ȣ��");

//		List<Meet> meetlist = meetService.select();
//		model.addAttribute("meetList", meetlist);
	}

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public void search(Model model) {
		log.info("와아아아아아{}",model);
	}

	@RequestMapping(value = "/find", method = RequestMethod.POST)
	public void search(Model model,HttpServletRequest httpServletRequest) {
		log.info("이거 머야??{}", httpServletRequest.getParameter("search1"));
		log.info("이거 머야??{}", httpServletRequest.getParameter("search2[]"));
		log.info("이거 머야??{}", httpServletRequest.getParameter("search3"));
		int meet_on_or_off = 0;
		if(httpServletRequest.getParameter("search1")!=null) {
			meet_on_or_off=Integer.parseInt(httpServletRequest.getParameter("search1"));
		}
		String meet_theme=httpServletRequest.getParameter("search2[]");
		String meet_book_title=httpServletRequest.getParameter("search3");
		List<Meet> meetlist = meetService.find(meet_on_or_off, meet_theme, meet_book_title);
				
		model.addAttribute("meetList", meetlist);		
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
		log.info("insert() ȣ��");
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Meet meet) {
		meetService.insert(meet);
		meet = meetService.selectNew(meet.getMeet_name());
		int meet_idx = meet.getMeet_idx();
		return "redirect:/meet/detail?meet_idx=" + meet_idx;
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detail(int meet_idx, Model model) {
		Meet meet = meetService.select(meet_idx);
		List<Meet> meetlist = meetService.selectByHost(meet.getMeet_host(), meet.getMeet_idx());
		List<Board> boardlist = boardService.selectByMeetIdx(meet_idx);
		
		model.addAttribute("meet", meet);
		model.addAttribute("meetlist", meetlist);
		model.addAttribute("boardlist",boardlist);
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update(int meet_idx, Model model) {
		log.info("update(meet_idx={}) 호출", meet_idx);

		Meet meet = meetService.select(meet_idx);
		model.addAttribute("meet", meet);

	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Meet meet) {
		log.info("update({}) POST 호출", meet);

		meetService.update(meet);
		int meet_idx = meet.getMeet_idx();
		//return "redirect:/board?act=rlt";
		return "redirect:/meet/detail?meet_idx=" + meet_idx;

	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int meet_idx) {
		meetService.delete(meet_idx);
		return "redirect:/board?act=rlt";
	}

	@RequestMapping(value = "/updateLike/{meet_idx}", method = RequestMethod.GET)
	public String updateLike(HttpSession session,@PathVariable(name = "meet_idx") Integer meet_idx,
			@RequestParam(value = "joiner", required = false) String joiner) {
		log.info("meet_idx={},joiner={}", meet_idx, joiner);
		meetService.updateLike(meet_idx, joiner);
		User userUpdate = userService.select(Integer.parseInt(joiner));
		session.removeAttribute("userMeetIndex");
		session.setAttribute("userMeetIndex", userUpdate.getUser_meet_idx());
		return "redirect:/meet/detail?meet_idx={meet_idx}";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam(value = "type", required = false) int type,
			@RequestParam(value = "keyword", required = true) String keyword, Model model) {
		List<Meet> list = meetService.select(type, keyword);
		model.addAttribute("meetList", list);
		return "/meet/main";
	}

}