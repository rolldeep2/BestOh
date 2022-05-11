package edu.spring.team4.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.team4.domain.Board;
import edu.spring.team4.domain.Meet;
import edu.spring.team4.domain.Notice;
import edu.spring.team4.service.BoardService;
import edu.spring.team4.service.MeetService;
import edu.spring.team4.service.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MeetService meetService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		

		Notice event = noticeService.select(103);
		model.addAttribute("event", event);
		List<Notice> noticeList = noticeService.selectTwo();
		model.addAttribute("noticeList", noticeList);
		List<Board> boardList = boardService.selectThree();
		model.addAttribute("boardList",boardList);
		List<Meet> meetList = meetService.selectThree();
		model.addAttribute("meetList",meetList);
		List<Board> boardList2 = boardService.selectBest();
		model.addAttribute("boardList2", boardList2);
		
		
		return "home";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "/mypage";
	}
	
	
}
