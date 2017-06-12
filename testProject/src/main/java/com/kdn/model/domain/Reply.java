package com.kdn.model.domain;

import java.io.Serializable;

public class Reply implements Serializable{
	private int rno;
	private String replyContent;
	private int bno;
	private String regdate;
	private int mno;
	private String nick;
	
	public Reply(){}

	public Reply(int rno, String replyContent, int bno, String regdate, int mno) {
		this.rno = rno;
		this.replyContent = replyContent;
		this.bno = bno;
		this.regdate = regdate;
		this.mno = mno;
	}
	
	public Reply(int rno, String replyContent, int bno, String regdate, int mno,
			String nick) {
		this.rno = rno;
		this.replyContent = replyContent;
		this.bno = bno;
		this.regdate = regdate;
		this.mno = mno;
		this.nick = nick;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	@Override
	public String toString() {
		return "rno=" + rno + ", replyContent=" + replyContent + ", bno=" + bno
				+ ", regdate=" + regdate + ", mno=" + mno;
	}
}
