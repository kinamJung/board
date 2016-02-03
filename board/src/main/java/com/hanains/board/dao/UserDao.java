package com.hanains.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanains.board.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	SqlSession sqlsession;
	
	public UserVo getUser(UserVo vo) {
		UserVo user= sqlsession.selectOne("user.get", vo);
		return user;
	}
	public UserVo getUser(String id){
		UserVo user = sqlsession.selectOne("user.getById", id);
		return user;
	}
	
	public void insert(UserVo vo){
		sqlsession.insert("user.insert", vo);
		
	}
}
