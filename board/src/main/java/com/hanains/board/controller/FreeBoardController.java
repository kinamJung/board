package com.hanains.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanains.board.service.FreeboardService;
import com.hanains.board.vo.FreeboardVo;

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

	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute FreeboardVo vo)
	{
		freeboardService.delete(vo);
		
		return "redirect:/freeboard/";
	}
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@ModelAttribute FreeboardVo vo){
		
		System.out.println(vo);
		
		freeboardService.add(vo);
		
		return "redirect:/freeboard/";
		
	}
	
}
