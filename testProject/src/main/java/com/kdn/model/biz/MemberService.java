package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Member;
import com.kdn.model.domain.PageBean;

public interface MemberService {

	public Member search(String mno);
	public List<Member> searchAll(PageBean bean);
	public boolean login(String mno, String password);
	public void withdraw(String mno);
	public void update(Member member);
	public void add(Member member);

}