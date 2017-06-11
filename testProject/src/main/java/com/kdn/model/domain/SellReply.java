package com.kdn.model.domain;

public class SellReply extends Reply{
	public SellReply(){super();}
	
	public SellReply(int rno, String replyContent, int bno, String regdate, int mno){
		super(rno, replyContent, bno, regdate, mno);
	}
	
	public SellReply(int rno, String replyContent, int bno, String regdate, int mno, String nick){
		super(rno, replyContent, bno, regdate, mno, nick);
	}
}
