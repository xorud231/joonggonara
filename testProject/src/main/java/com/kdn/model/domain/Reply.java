package com.kdn.model.domain;

import java.io.Serializable;

public class Reply implements Serializable{
	private int rno;
	private String reply;
	private int bno;
	private String regdate;
	private String mno;
	
	public Reply(){}

	public Reply(int rno, String reply, int bno, String regdate, String mno) {
		this.rno = rno;
		this.reply = reply;
		this.bno = bno;
		this.regdate = regdate;
		this.mno = mno;
	}
	
	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	@Override
	public String toString() {
		return "rno=" + rno + ", reply=" + reply + ", bno=" + bno
				+ ", regdate=" + regdate + ", mno=" + mno;
	}
}
