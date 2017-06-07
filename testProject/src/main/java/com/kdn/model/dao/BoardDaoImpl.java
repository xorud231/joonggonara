package com.kdn.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.BoardDao;
import com.kdn.model.domain.Board;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public Board searchBoard(int sellbuy, int bno) {
		if(sellbuy == 1){
			return session.selectOne("board.searchBuyBoard", bno);
		}
		else{
			return session.selectOne("board.searchSellBoard", bno);
		}
	}
}
