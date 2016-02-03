package com.hanains.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanains.board.service.UserService;
import com.hanains.board.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/loginform")
	public String loginform(){
		return "/user/loginform";
	}
	
	@RequestMapping("/joinform")
	public String joinform(){
		return "/user/joinform";
	}
	
	@RequestMapping("/join")
	public String join(@ModelAttribute UserVo vo){
		userService.join(vo);
		return "redirect:/";
	}
	
	@RequestMapping("/retry")
	public String retryLogin(){
		return "/user/loginform_retry";
	}
}
