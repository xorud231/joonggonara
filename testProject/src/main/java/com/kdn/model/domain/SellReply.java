package com.kdn.model.domain;

public class SellReply extends Reply{
	public SellReply(){super();}
	
	public SellReply(int rno, String reply, int bno, String regdate, String mno){
		super(rno, reply, bno, regdate, mno);
	}
	
	public SellReply(int rno, String reply, int bno, String regdate, String mno, String nick){
		super(rno, reply, bno, regdate, mno, nick);
	}
}
