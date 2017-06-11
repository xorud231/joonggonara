package com.kdn.model.domain;

public class BuyReply extends Reply{
	public BuyReply(){super();}
	
	public BuyReply(int rno, String replyContent, int bno, String regdate, int mno){
		super(rno, replyContent, bno, regdate, mno);
	}
	
	public BuyReply(int rno, String replyContent, int bno, String regdate, int mno, String nick){
		super(rno, replyContent, bno, regdate, mno, nick);
	}
}
