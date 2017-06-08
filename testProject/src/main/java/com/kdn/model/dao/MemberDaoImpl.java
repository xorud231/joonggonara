package com.kdn.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.MemberDao;
import com.kdn.model.domain.Member;
import com.kdn.model.domain.PageBean;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public Member search(String mno) {
		return session.selectOne("member.searchMember", mno);
	}

	public List<Member> searchAll(PageBean bean) {
		RowBounds rows = new RowBounds(bean.getStart() - 1, bean.getInterval());
		
		return session.selectList("member.searchAllMember", bean, rows);
	}

	public int getCount(PageBean bean) {
		return session.selectOne("member.getCount", bean);
	}

	public void add(Member member) {
		System.out.println("adddddd");
		session.insert("member.insertMember", member);
	}

	public void update(String mno) {
		session.delete("member.removeMember", mno);
	}

	public void update(Member member) {
		session.update("member.updateMember", member);
	}

}
