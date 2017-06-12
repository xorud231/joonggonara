package com.kdn.model.domain;

import java.io.Serializable;
public class BoardFile implements Serializable {
	private int fno;
	private String rfilename;
	private String sfilename;
	private int bno;
	public BoardFile(){}
	public BoardFile(int fno, String rfilename, String sfilename, int bno) {
		super();
		this.fno = fno;
		this.rfilename = rfilename;
		this.sfilename = sfilename;
		this.bno = bno;
	}
	public BoardFile(String rfilename, String sfilename) {
		this.rfilename = rfilename;
		this.sfilename = sfilename;
	}
	@Override
	public String toString() {
		return  new StringBuilder().append("BoardFile [fno=")
				.append(fno).append(", rfilename=")
				.append(rfilename).append(", sfilename=")
				.append(sfilename).append(", bno=")
				.append(bno).append("]").toString();
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getRfilename() {
		return rfilename;
	}
	public void setRfilename(String rfilename) {
		this.rfilename = rfilename;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}
}








