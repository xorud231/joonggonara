package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Board;
import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.Reply;

public interface BoardService {
	public Board searchBoard(int sellbuy, int bno);
	public List<Board> searchBuyList(PageBean bean);
	public List<Board> searchSellList(PageBean bean);
	public List<Reply> searchReply(int sellbuy, int bno);
	public int getCountReply(int sellbuy, int bno);
	public void insertReply(int sellbuy, int bno, String replycontent, String mno);
	public boolean searchInCart(String mno, int sellbuy, int bno);
	public void updateCart(String mno, int sellbuy, int bno, boolean isInCart);
}
