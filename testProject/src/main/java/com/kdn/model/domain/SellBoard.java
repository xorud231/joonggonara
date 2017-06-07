package com.kdn.model.domain;

public class SellBoard extends Board {
	public SellBoard(){super();}

	public SellBoard(int bno, String regdate, String title, int price,
			String contents, String dealstate, int mno, int dno, int cno) {
		super(bno, regdate, title, price, contents, dealstate, mno, dno, cno);
	}
}
