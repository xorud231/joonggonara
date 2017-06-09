package com.kdn.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.domain.Board;
import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.Reply;
import com.kdn.model.domain.UpdateException;
import com.kdn.util.PageUtility;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	@Qualifier("boardDao")
	private BoardDao dao;
	
	@Override
	public Board searchBoard(int sellbuy, int bno){
		try {
			return dao.searchBoard(sellbuy, bno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}
	
	public List<Board> searchBuyList(PageBean bean) {
		try {
			int total = dao.getBuyCount( bean);
			PageUtility bar = 
					new PageUtility(bean.getInterval()
							, total
							, bean.getPageNo()
							, "images/");
			bean.setPagelink(bar.getPageBar());
			
			return dao.searchBuyList(bean);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}
	public List<Board> searchSellList(PageBean bean) {
		try {
			int total = dao.getSellCount( bean);
			PageUtility bar = 
					new PageUtility(bean.getInterval()
							, total
							, bean.getPageNo()
							, "images/");
			bean.setPagelink(bar.getPageBar());
			
			return dao.searchSellList(bean);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}
	public Board searchBuyFile(int bno) {
		System.out.println("bno"+dao.searchBuyFile( bno));
		return dao.searchBuyFile( bno);
	}
	public Board searchSellFile(int bno) {
		System.out.println("bno"+dao.searchSellFile( bno));
		return dao.searchSellFile( bno);
	}
	public List<Reply> searchReply(int sellbuy, int bno){
		try {
			/*int total = dao.getBuyCount( bean);
			PageUtility bar = 
					new PageUtility(bean.getInterval()
							, total
							, bean.getPageNo()
							, "images/");
			bean.setPagelink(bar.getPageBar());*/
			
			return dao.searchReply(sellbuy, bno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}
	
	public int getCountReply(int sellbuy, int bno){
		try {
			return dao.getCountReply(sellbuy, bno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("댓글 개수 검색 중 오류 발생");
		}
	}
	
	public void insertReply(int sellbuy, int bno, String replycontent, String mno){
		try {
			dao.insertReply(sellbuy, bno, replycontent, mno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("댓글 작성 중 오류 발생");
		}
	}
	
	public boolean searchInCart(String mno, int sellbuy, int bno){
		try {
			return dao.searchInCart(mno, sellbuy, bno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("장바구니 검색 중 오류 발생");
		}
	}
	
	public void updateCart(String mno, int sellbuy, int bno, boolean isInCart){
		try {
			dao.updateCart(mno, sellbuy, bno, isInCart);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("장바구니 수정 중 오류 발생");
		}
	}
	
	public void deleteBoard(int sellbuy, int bno){
		try {
			dao.deleteBoard(sellbuy, bno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 삭제 중 오류 발생");
		}
	}
	
	public void updateReply(int sellbuy, Reply reply, String editReply){
		try {
			dao.updateReply(sellbuy, reply, editReply);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("댓글 수정 중 오류 발생");
		}
	}
}
