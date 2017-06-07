package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Board;
import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.Reply;

public interface BoardDao {

	public Board 	searchBoard(int sellbuy, int bno) 		;
	public List<Board> searchBuyList(PageBean bean) ;
	public int 		getBuyCount(PageBean bean) ;
	public List<Reply> searchReply(int sellbuy, int bno);
}





