package edu.spring.team4.controller;

import java.util.List;

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
import edu.spring.team4.service.BoardService;
import edu.spring.team4.service.MeetService;
import edu.spring.team4.utils.Paging;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	
	
	@Autowired
	private MeetService meetService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String main(HttpSession session,Model model, Paging page, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "order", required = false) String order,
			@RequestParam(value = "act", required = false) String act,
			@RequestParam(value = "MeetIdx", required = false) String user_meet_idx) {
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		log.info("free() 호출");
		String result;
		if (user_meet_idx == null) {
			user_meet_idx = "0";
		}

		int total = boardService.countBoard(user_meet_idx);
		if (act == null) {
			act = "free";
		}
		if (act.equals("my")) {
			log.info("나의");
			result = "board/mymeet";
			
			int userCode = (int)session.getAttribute("signInUserCode");
			List<Meet> meetList = meetService.selectByMemberCode(Integer.toString(userCode));
			model.addAttribute("meetList",meetList);
			
			
			
		} else if (act.equals("rlt")) {
			log.info("실시간");
			total = meetService.countMeet();
			
			page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			List<Meet> meetList = meetService.select(page);
			model.addAttribute("meetList",meetList);
			
			result = "board/realtime";
		} else {
			log.info("자유");
			result = "board/free";
		}

		int orderby = 0;
		if (order == null) {
			orderby = 0;
		} else {
			orderby = Integer.parseInt(order);
		}
		
		if(!act.equals("rlt")) {
		page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<Board> list = boardService.selectPageBoard(page, user_meet_idx, orderby);
		model.addAttribute("boardList", list); // jsp에서 el로 사용할 수 있음.
		}
		
		
		model.addAttribute("paging", page);
		model.addAttribute("act", act); // jsp에서 el로 사용할 수 있음.
		model.addAttribute("order", order); // jsp에서 el로 사용할 수 있음.
		model.addAttribute("userMeetIdx", user_meet_idx); // jsp에서 el로 사용할 수 있음.
		
		

		return result;
	}

	@RequestMapping(value="/mymeet", method=RequestMethod.GET)
	public void myMeet(Model model, HttpSession session) {
		int userCode = (int)session.getAttribute("signInUserCode");
		List<Meet> meetList = meetService.selectByMemberCode(Integer.toString(userCode));
		model.addAttribute("meetList",meetList);
	}
	
	
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert(Model model, @RequestParam(value = "MeetIdx", required = false) String meet_idx,
			@RequestParam(value = "bookImg", required = false) String meet_bookImg,
			@RequestParam(value = "bookTitle", required = false) String meet_bookTitle,
			@RequestParam(value = "bookAuthors", required = false) String meet_bookAuthors,
			@RequestParam(value = "bookPub", required = false) String meet_bookPub
			) {
		log.info("insert() 호출");
		if (meet_idx == null) {
			meet_idx = "0";
		}
		
		if(meet_bookImg == null) {
			meet_bookImg = "";
		}
		if(meet_bookTitle == null) {
			meet_bookTitle = "";
		}
		if(meet_bookAuthors == null) {
			meet_bookAuthors = "";
		}
		if(meet_bookPub == null) {
			meet_bookPub = "";
		}
		log.info("insert() 호출 및 bookTitle({})",meet_bookTitle);
		model.addAttribute("userMeetIdx", meet_idx);
		model.addAttribute("bookImg", meet_bookImg);
		model.addAttribute("bookTitle", meet_bookTitle);
		model.addAttribute("bookAuthors", meet_bookAuthors);
		model.addAttribute("bookPub", meet_bookPub);
		
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Board board) {
		log.info("있는거야? {}", board);
		boardService.insert(board);
		board = boardService.selectNew(board.getBoard_title());
		int bno = board.getBno();
		return "redirect:/board/detail/" + bno;
	}

	@RequestMapping(value = "/detail/{bno}", method = RequestMethod.GET)
	public String detail(Model model, @PathVariable(name = "bno") Integer bno) {
		Board board = boardService.select(bno);
		model.addAttribute("board", board);
		return "/board/detail";
	}

	@RequestMapping(value = "/update/{bno}", method = RequestMethod.GET)
	public String update(Model model, @PathVariable(name = "bno") Integer bno) {
		Board board = boardService.select(bno);
		model.addAttribute("board", board);
		return "/board/update";
	}

	@RequestMapping(value = "/update/{bno}", method = RequestMethod.POST)
	public String update(Board board, @PathVariable(name = "bno") Integer bno) {
		boardService.update(board);
		return "redirect:/board/detail/{bno}";
	}

	@RequestMapping(value = "/updateLike/{bno}", method = RequestMethod.GET)
	public String updateLike(@PathVariable(name = "bno") Integer bno,
			@RequestParam(value = "liker", required = false) String liker) {
		log.info("bno={}",bno);
		boardService.updateLike(bno, liker);
		return "redirect:/board/detail/{bno}";
	}

	@RequestMapping(value = "/delete/{bno}", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "bno") Integer bno) {
		boardService.delete(bno);
		return "redirect:/board/";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(int type, String keyword, Model model) {
		List<Board> list = boardService.select(type, keyword);
		model.addAttribute("boardList", list);
		return "/board/";
	}
}
