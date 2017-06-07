package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Board;
import com.kdn.model.domain.PageBean;

public interface BoardService {
	public Board searchBoard(int sellbuy, int bno);
}