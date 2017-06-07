package com.kdn.model.domain;

import java.io.Serializable;

public class Reply implements Serializable{
	private int rno;
	private String reply;
	private int bno;
	
	public Reply(){}

	public Reply(int rno, String reply, int bno) {
		super();
		this.rno = rno;
		this.reply = reply;
		this.bno = bno;
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
		return "rno=" + rno + ", reply=" + reply + ", bno=" + bno;
	}
	
	
}
