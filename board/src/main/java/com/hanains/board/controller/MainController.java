package com.hanains.board.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;


@Controller
public class MainController {
	
	public MainController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/")
	public String index(){
		return "/main/index";
	}
	@ExceptionHandler(Exception.class)
	@ResponseStatus(value=HttpStatus.NOT_FOUND)
	public void testException(Exception e){
		System.out.println("Exception");
	}
	
}
