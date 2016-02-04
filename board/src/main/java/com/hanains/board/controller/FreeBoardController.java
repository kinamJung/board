package com.hanains.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanains.board.annotation.Auth;
import com.hanains.board.annotation.AuthUser;
import com.hanains.board.service.FreeboardService;
import com.hanains.board.vo.FreeboardVo;
import com.hanains.board.vo.UserVo;

@Controller
@RequestMapping("/freeboard")
public class FreeBoardController {

	
	@Autowired
	private FreeboardService freeboardService;
	
	@RequestMapping("/")
	public String index(Model model){
		
		List<FreeboardVo> list = freeboardService.list();
		
		model.addAttribute("list", list);
		
		
		return "/freeboard/list";
	}
	@RequestMapping(value="/deleteform/{no}", method= RequestMethod.GET)
	public String deleteForm(@PathVariable("no") Long no, Model model){
		model.addAttribute("no", no);
		return "/freeboard/deleteform";
	}

	
	@RequestMapping(value="/delete")
	public String delete(@ModelAttribute FreeboardVo vo, @AuthUser UserVo user)
	{
		
		if(user != null){
			if( user.getUserRole() == 1){
				freeboardService.delete(vo);
			}else
			{
				Long freeboardNo = freeboardService.getFreeboardNo(vo);
				if(freeboardNo != null){
					freeboardService.delete(vo);
				}
			}
		}else{
			if(vo.getNo() == null || vo.getPassword() == null){
				return "redirect:/freeboard/";
			}
			Long freeboardNo = freeboardService.getFreeboardNo(vo);
			if(freeboardNo != null){
				freeboardService.delete(vo);
			}
		}
		
		return "redirect:/freeboard/";
	}
	
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@ModelAttribute FreeboardVo vo){
		
		System.out.println(vo);
		
		freeboardService.add(vo);
		
		return "redirect:/freeboard/";
		
	}
	
}
