package com.kdn.model.biz;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kdn.model.domain.Board;
import com.kdn.model.domain.BoardFile;
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
							, "img/");
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
							, "img/");
			bean.setPagelink(bar.getPageBar());
			
			return dao.searchSellList(bean);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}
	public Board searchBuyFile(int bno) {
		return dao.searchBuyFile( bno);
	}
	public Board searchSellFile(int bno) {
		return dao.searchSellFile( bno);
	}
	public List<Reply> searchReply(int sellbuy, int bno){
		try {
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
	
	public void deleteReply(int sellbuy, int rno){
		try {
			dao.deleteReply(sellbuy, rno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("댓글 삭제 중 오류 발생");
		}
	}
	
	public int getBoardNo(int sellbuy){
		try {
			return dao.getBoardNo(sellbuy);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시판 번호 추출 중 오류 발생");
		}
	}
	
	public void insertBoard(int sellbuy, Board board, String dir, int past_bno){
		File[ ] files = null;
		int size = 0;
		
		try {
			dao.deleteBoard(sellbuy, past_bno);
			dao.insertBoard(sellbuy, board);
			MultipartFile[] fileup = board.getFileup();
			
			if(fileup!=null){
				size = fileup.length;
				files = new File[size];     
				ArrayList<BoardFile> fileInfos = new ArrayList<BoardFile>(size);
				String rfilename = null;
				String sfilename = null;
				int index =0;  
				int bno = board.getBno();
				int mno = board.getMno();
				
				for (MultipartFile file : fileup) {
					rfilename = file.getOriginalFilename();
					sfilename = String.format("%d_%d_%d_%d_%s"
											, sellbuy
											, bno
											, mno
											, System.currentTimeMillis()
											, rfilename);
					fileInfos.add(new BoardFile(rfilename, sfilename));
					String fileName = String.format("%s/%s", dir, sfilename);
					files[index] = new File(fileName);
					file.transferTo(files[index++]);
				}
				dao.insertFiles(fileInfos, sellbuy, bno);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시판 등록 중 오류 발생");
		}
	}
	
	public String getCategory(int cno){
		try {
			return dao.getCategory(cno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("카테고리 추출 중 오류 발생");
		}
	}
	
	public String getDealway(int dno){
		try {
			return dao.getDealway(dno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("거래방법 추출 중 오류 발생");
		}
	}
	
	public int getImageCount(int sellbuy, int bno){
		try {
			return dao.getImageCount(sellbuy, bno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("이미지 개수 추출 중 오류 발생");
		}
	}
}
