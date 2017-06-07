package com.kdn.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.BoardDao;
import com.kdn.model.domain.Board;
import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.Reply;

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
	
	public int getBuyCount(PageBean bean) {
		return session.selectOne("board.getBuyCount", bean);
	}
	
	public List<Board> searchBuyList(PageBean bean) {
		RowBounds rows = new RowBounds(bean.getStart() - 1, bean.getInterval());
		
		return session.selectList("board.searchBuyList", bean, rows);
	}
	
	public List<Reply> searchReply(int sellbuy, int bno){
		if(sellbuy == 1)
			return session.selectList("board.searchBuyReply", bno);
		
		else
			return session.selectList("board.searchSellReply", bno);
	}
}
