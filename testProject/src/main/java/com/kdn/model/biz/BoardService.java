package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Board;
import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.Reply;

public interface BoardService {
	public Board searchBoard(int sellbuy, int bno);
	public Board searchBuyFile(int bno);
	public Board searchSellFile(int bno);
	public List<Board> searchBuyCart(PageBean bean);
	public List<Board> searchSellCart(PageBean bean);
	public List<Board> searchBuyList(PageBean bean);
	public List<Board> searchSellList(PageBean bean);
	public List<Reply> searchReply(int sellbuy, int bno);
	public int getCountReply(int sellbuy, int bno);
	public void insertReply(int sellbuy, int bno, String replycontent, String mno);
	public boolean searchInCart(String mno, int sellbuy, int bno);
	public void updateCart(String mno, int sellbuy, int bno, boolean isInCart);
	public void deleteBoard(int sellbuy, int bno);
	public void updateReply(int sellbuy, Reply reply, String editReply);
	public void deleteReply(int sellbuy, int rno);
	public int getBoardNo(int sellbuy);
	public void insertBoard(int sellbuy, Board board, String dir, int bno);
	public String getCategory(int cno);
	public String getDealway(int dno);
	public int getImageCount(int sellbuy, int past_bno);
}
