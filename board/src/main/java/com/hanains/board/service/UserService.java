package com.hanains.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanains.board.dao.UserDao;
import com.hanains.board.vo.UserVo;

@Service
public class UserService {

	@Autowired
	UserDao userDao;
	
	
	public UserVo login(UserVo vo){
		
		UserVo user = userDao.getUser(vo);
		
		return user;
	}
	
	public void join(UserVo vo){
		userDao.insert(vo);
	}
	
	public UserVo getUser(String id){
		UserVo vo = userDao.getUser(id);
		return vo;
	}
	
}
