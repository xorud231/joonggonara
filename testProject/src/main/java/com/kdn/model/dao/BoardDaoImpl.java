package com.kdn.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.BoardDao;
import com.kdn.model.domain.Board;
import com.kdn.model.domain.FileBean;
import com.kdn.model.domain.PageBean;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public void add(Board board) {
		session.insert("board.addBoard", board);
	}

	public void update(Board board) {
		session.update("board.updateBoard", board);
	}

	public void remove(int no) {
		session.delete("board.removeBoard", no);
	}

	public Board search(int no) {
		return session.selectOne("board.searchBoard", no);
	}

	public List<Board> searchAll(PageBean bean) {
		RowBounds rows = new RowBounds(bean.getStart() - 1, bean.getInterval());
		
		return session.selectList("board.searchAllBoard", bean, rows);
	}

	public int getCount(PageBean bean) {
		return session.selectOne("board.getCount", bean);
	}

	public int getBoardNo() {
		return session.selectOne("board.getBoardNo");
	}

	public void addFiles(List<FileBean> files, int bno) {
		
	}

	public void removeFiles(int bno) {

	}

}
