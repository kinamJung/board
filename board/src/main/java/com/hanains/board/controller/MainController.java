package com.hanains.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	public MainController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/")
	public String index(){
		return "/main/index";
	}
	
}
