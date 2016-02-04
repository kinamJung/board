package com.hanains.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanains.board.vo.FreeboardVo;


@Repository
public class FreeboardDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FreeboardVo> getList() {
		
		List<FreeboardVo> list = sqlSession.selectList("freeboard.getList");
		
		return list;
	}

	public void delete(FreeboardVo vo) {	
		sqlSession.selectOne("freeboard.deleteGuestBook", vo);	
	}

	public void insert(FreeboardVo vo) {
		sqlSession.selectOne("freeboard.insertGuestBook", vo);	
	}
	
	public Long select(FreeboardVo vo){
		return sqlSession.selectOne("freeboard.get", vo);
	}
	
}
