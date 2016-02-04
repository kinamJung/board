package com.hanains.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanains.board.dao.FreeboardDao;
import com.hanains.board.vo.FreeboardVo;

@Service
public class FreeboardService {

	@Autowired
	private FreeboardDao dao;
	
	public List<FreeboardVo> list(){
		
		List<FreeboardVo> list = dao.getList();
		return list;
		
	}
	
	public void delete(FreeboardVo vo){		
		dao.delete(vo);		
	}
	
	
	
	public void add(FreeboardVo vo){
		dao.insert(vo);
	}
	
	public Long getFreeboardNo(FreeboardVo vo){
		return dao.select(vo);
	}
	
}
