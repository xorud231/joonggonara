package com.kdn.model.domain;

import java.io.Serializable;

public class Member implements Serializable{
	private String mno;
	private String password;
	private String name;
	private String nick;
	private String address;
	private String phonenum;
	private String withdraw;

	public Member() {	}
	public Member(String id, String password) {
		super();
		this.mno = mno;
		this.password = password;
	}

	public Member(String mno, String password, String name, String nick,
			String address, String phonenum) {
		this.mno = mno;
		this.password = password;
		this.name = name;
		this.nick = nick;
		this.address = address;
		this.phonenum = phonenum;
	}
	
	public Member(String mno, String password, String name, String nick,
			String address, String phonenum, String withdraw) {
		super();
		this.mno = mno;
		this.password = password;
		this.name = name;
		this.nick = nick;
		this.address = address;
		this.phonenum = phonenum;
		this.withdraw = withdraw;
	}
	
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}
	@Override
	public String toString() {
		return "mno=" + mno + ", password=" + password + ", name="
				+ name + ", nick=" + nick + ", address=" + address
				+ ", phonenum=" + phonenum;
	}
	
}
