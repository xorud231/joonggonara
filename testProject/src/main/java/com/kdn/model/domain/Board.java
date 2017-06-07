package com.kdn.model.domain;

import java.io.Serializable;

public class Board implements Serializable{
	private int bno;
	private String regdate;
	private String title;
	private int price;
	private String contents;
	private String dealstate;
	private int mno;
	private int dno;
	private int cno;
	
	public Board(){}

	public Board(int bno, String regdate, String title, int price,
			String contents, String dealstate, int mno, int dno, int cno) {
		this.bno = bno;
		this.regdate = regdate;
		this.title = title;
		this.price = price;
		this.contents = contents;
		this.dealstate = dealstate;
		this.mno = mno;
		this.dno = dno;
		this.cno = cno;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getDealstate() {
		return dealstate;
	}

	public void setDealstate(String dealstate) {
		this.dealstate = dealstate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	@Override
	public String toString() {
		return "bno=" + bno + ", regdate=" + regdate + ", title="
				+ title + ", price=" + price + ", contents=" + contents
				+ ", dealstate=" + dealstate + ", mno=" + mno + ", dno=" + dno
				+ ", cno=" + cno;
	}
}