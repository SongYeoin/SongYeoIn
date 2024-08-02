package com.syi.project.controlller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShoppingController {

	private static final Logger logger = LoggerFactory.getLogger(ShoppingController.class);
	
	//메인 페이지 이동
	@GetMapping("/member/main")
	public void mainPageGET() {
		logger.info("메인 페이지 진입");
	}
}
