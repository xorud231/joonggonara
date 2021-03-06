package com.kdn.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.dao.MemberDaoImpl;
import com.kdn.model.domain.Member;
import com.kdn.model.domain.UpdateException;
import com.kdn.model.domain.PageBean;
import com.kdn.util.DBUtil;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	
	public Member search(String mno) {
		Member member = null;
		try {
			member = dao.search( mno);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		} 
		if(member == null){
			throw new UpdateException("아이디에 해당하는 회원을 찾을 수 없습니다.");
		}else{
			return member;
		}
		
	}

	public List<Member> searchAll(PageBean bean) {
		List<Member> members= null;
		try {
			int count = dao.getCount(bean);
			return dao.searchAll(bean);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}

	public boolean login(String mno, String password) {
		Member member = null;
		try{
			member = dao.search( mno);
		}catch(Exception s){
			throw new UpdateException("DB 서버 오류");
		}
		if(member == null){
			throw new UpdateException("해당하는 아이디는 존재하지 않습니다.");
		}
		if(password ==null || !password.equals(member.getPassword())){
			throw new UpdateException("비밀번호가 맞지 않습니다.");
		}
		
		return true;
	}
	
	

	public void withdraw(String mno) {
		Member member = null;
		
			member = dao.search(mno);
			if(member == null){
				throw new UpdateException("아이디에 해당하는 회원이 없어 탈퇴 처리할 수 없습니다.");
			}else{
				dao.update(mno);
			}
		
	}	


	public void update(Member member) {
			
			Member find= dao.search(member.getMno());
			System.out.println(find);
			if(find == null){
				throw new UpdateException("아이디에 해당하는 회원이 없어 수정할 수 없습니다.");
			}else{
				
				dao.update(member);
			}
	}
	
	public void add(Member member) {
		
		
		
		
		Member find= dao.search(member.getMno());
		if(find != null){
			System.out.println(find);
			throw new UpdateException("이미 등록된 사번 입니다.");
		}
		if(find == null){
			if(member.getMno() == ""){
				throw new UpdateException("사번 입력하세요!");
			}
			else if(member.getName() == ""){
				throw new UpdateException("이름 입력하세요!");
			}
			else if(member.getPassword() == ""){
				throw new UpdateException("비밀번호 입력하세요!");
			}
			else if(member.getNick() == ""){
				throw new UpdateException("닉네임 입력하세요!");
			}
			else if(member.getPhonenum() == ""){
				throw new UpdateException("전화번호 입력하세요!");
			}
			else if(member.getAddress() == ""){
				throw new UpdateException("주소 입력하세요!");
			}
			else if(member.getMno() != null && member.getName() != null && member.getPassword() != null 
					&& member.getNick() != null && member.getPhonenum() != null && member.getAddress() != null){
				dao.add(member);
				throw new UpdateException("회원가입이 완료되었습니다.");
			}
		}
	}
	
}
