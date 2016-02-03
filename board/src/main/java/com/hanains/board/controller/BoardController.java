package com.hanains.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hanains.board.annotation.Auth;
import com.hanains.board.annotation.AuthUser;
import com.hanains.board.service.BoardService;
import com.hanains.board.util.Common;
import com.hanains.board.vo.BoardVo;
import com.hanains.board.vo.UploadFileVo;
import com.hanains.board.vo.UserVo;



@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	private static final Log LOG = LogFactory.getLog( BoardController.class );
	

	@RequestMapping(value="/{division}", method= RequestMethod.GET)
	public String list(@PathVariable("division") Long div, Model model){
		model.addAttribute("divison", div);
		model = boardService.list(model, div);		
		return "/board/list";
	}
	
	@RequestMapping( value = "/delete", method = RequestMethod.GET) 
	public String delete(@ModelAttribute BoardVo vo){
		boardService.delete(vo);
		return "redirect:/board/"+vo.getDivision();
	}
	
	@Auth
	@RequestMapping("/writeForm")
	public String writeForm(@ModelAttribute BoardVo vo, Model model){
		
		model.addAttribute("board", vo);
		
		System.out.println(vo);
		
		return "/board/write";
	}
	
	@RequestMapping("/write")
	public String write(@AuthUser UserVo authUser,
						@ModelAttribute BoardVo vo,
						@RequestParam( "uploadFile" ) MultipartFile multipartFile[],
						@RequestParam(value= "division", required=false) Long division){
		
		vo.setMemberNo(authUser.getNo());
		System.out.println("write:" +vo);
		boardService.insert(vo, multipartFile);
		
		return "redirect:/board/"+vo.getDivision();
	}
	
	
	@RequestMapping("/view")	
	public String boardView(@ModelAttribute BoardVo vo,
							@RequestParam(value="search",required=true,defaultValue="")String search,
							@RequestParam(value="index",required=true, defaultValue="1" )int index,
							Model model){
		
		LOG.info("BoardController.boardView");
		
		//update view Count
		boardService.updateView(vo);
		
		//select board vo
		Map<String, Object> map = new HashMap<String, Object>();
		map = boardService.view(vo);
		
		BoardVo board = (BoardVo)map.get("board");
		List<UploadFileVo> list = (List<UploadFileVo>)map.get("uploadFile");
		
		//파일 이름에 경로 추가. // view.jsp에 파일을 다운받게 하기 위해
		for(UploadFileVo file : list){
			file.setFileName( Common.FILE_MAPPING_URL + file.getFileName());		
		}
	
		model.addAttribute("search", search);
		model.addAttribute("index", index);
		model.addAttribute("boardVo", board);
		model.addAttribute("uploadFileList", list);
		
		System.out.println(board);
		return "/board/view";
		
	}
	
	@Auth
	@RequestMapping("/modifyform")
	public String modifyForm(@ModelAttribute BoardVo vo, Model model){
		
	
		Map<String, Object> map = new HashMap<String, Object>();
		map = boardService.view(vo);
		
		BoardVo board = (BoardVo)map.get("board");
		
		
		
		System.out.println("modifyform:"+ board);
		model.addAttribute("boardVo", board);
		
		return "/board/modify";
	}
	
	@Auth
	@RequestMapping("/update")
	public String update( @AuthUser UserVo authUser,
						  @ModelAttribute BoardVo vo, Model model){
		
		vo.setMemberNo(authUser.getNo());
		boardService.updateBoard(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map = boardService.view(vo);
		
		List<UploadFileVo> list = (List<UploadFileVo>)map.get("uploadFile");
		
		//파일 이름에 경로 추가. // view.jsp에 파일을 다운받게 하기 위해
		for(UploadFileVo file : list){
			file.setFileName( Common.FILE_MAPPING_URL + file.getFileName());		
		}
		
		System.out.println("update:"+ vo);
		model.addAttribute("boardVo", vo);
		model.addAttribute("uploadFileList", list);
		return "/board/view";
		
	}
	
	@RequestMapping("/viewpaging")
	public String viewPaging(@RequestParam(value="index", required=true, defaultValue="1")int index,							
							@RequestParam(value="search", required=true, defaultValue="")String keyword,
							@RequestParam(value="division", required=true, defaultValue="")Long division,
							Model model){
		LOG.info("BoardController.viewPaging");
		System.out.println("index:" + index + " keyword:" + keyword + " division:" + division);
		model = boardService.viewPaging(index, keyword, model, division);
		return "/board/list";		
	}
	
}
