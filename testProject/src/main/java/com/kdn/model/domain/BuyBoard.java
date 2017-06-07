package com.kdn.model.domain;

public class BuyBoard extends Board {

	public BuyBoard(){super();}

	public BuyBoard(int bno, String regdate, String title, int price,
			String contents, String dealstate, int mno, int dno, int cno) {
		super(bno, regdate, title, price, contents, dealstate, mno, dno, cno);
	}

}
