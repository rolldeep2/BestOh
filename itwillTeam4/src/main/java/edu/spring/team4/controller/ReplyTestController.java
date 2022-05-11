package edu.spring.team4.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/replytest", method = RequestMethod.GET)
public class ReplyTestController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/replytest", method = RequestMethod.GET)
	public void replytest() {
		logger.info("replytest() 호출");

	}
}
