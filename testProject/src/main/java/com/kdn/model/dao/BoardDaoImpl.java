package com.kdn.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	public int getSellCount(PageBean bean) {
		return session.selectOne("board.getSellCount", bean);
	}
	
	public List<Board> searchBuyList(PageBean bean) {
		RowBounds rows = new RowBounds(bean.getStart() - 1, bean.getInterval());
		
		return session.selectList("board.searchBuyList", bean, rows);
	}
	public List<Board> searchSellList(PageBean bean) {
		RowBounds rows = new RowBounds(bean.getStart() - 1, bean.getInterval());
		
		return session.selectList("board.searchSellList", bean, rows);
	}
	
	public List<Reply> searchReply(int sellbuy, int bno){
		if(sellbuy == 1)
			return session.selectList("board.searchBuyReply", bno);
		
		else
			return session.selectList("board.searchSellReply", bno);
	}
	
	public int getCountReply(int sellbuy, int bno){
		if(sellbuy == 1)
			return session.selectOne("board.getCountBuyReply", bno);
		
		else
			return session.selectOne("board.getCountSellReply", bno);
	}
	
	public void insertReply(int sellbuy, int bno, String replycontent, String mno){
		HashMap<String, Object> temp = new HashMap<String, Object>();
		temp.put("bno", bno);
		temp.put("replycontent", replycontent);
		temp.put("mno", Integer.parseInt(mno));
		
		if(sellbuy == 1)
			session.insert("board.insertBuyReply", temp);
		
		else
			session.insert("board.insertSellReply", temp);
	}
	
	public boolean searchInCart(String mno, int sellbuy, int bno){
		HashMap<String, Object> temp = new HashMap<String, Object>();
		temp.put("mno", Integer.parseInt(mno));
		temp.put("sellbuy", sellbuy + "");
		temp.put("bno", bno);
		
		int check = session.selectOne("board.searchInCart", temp);
		
		if(check == 0)
			return false;
		else
			return true;
	}
	
	public void updateCart(String mno, int sellbuy, int bno, boolean isInCart){
		HashMap<String, Object> temp = new HashMap<String, Object>();
		temp.put("mno", Integer.parseInt(mno));
		temp.put("sellbuy", sellbuy + "");
		temp.put("bno", bno);
		
		if(isInCart){
			session.delete("board.deleteCart", temp);
		}
		
		else{
			session.insert("board.insertCart", temp);
		}
	}
	
	public void deleteBoard(int sellbuy, int bno){
		if(sellbuy == 1)
			session.delete("board.deleteBuyBoard", bno);
		
		else
			session.delete("board.deleteSellBoard", bno);
	}
	
	public void updateReply(int sellbuy, Reply reply, String editReply){
		HashMap<String, Object> temp = new HashMap<String, Object>();
		temp.put("reply", reply);
		temp.put("editReply", editReply);
		
		if(sellbuy == 1)
			session.update("board.updateBuyReply", temp);
		
		else
			session.update("board.updateSellReply", temp);
	}
}
