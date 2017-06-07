package com.kdn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.model.biz.MemberService;
import com.kdn.model.domain.Member;

@Controller
public class MemberController {
	@ExceptionHandler
	public ModelAndView handler(Exception e){
		ModelAndView model = new ModelAndView("index");
		
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		
		return model;
	}
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "loginform.do", method = RequestMethod.GET)
	public String loginform(Model model){
		model.addAttribute("content", "member/login.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(String id, String pw, HttpSession session){
		memberService.login(id, pw);
		session.setAttribute("id", id);
		
		return "redirect:listBoard.do";
	}
	
	@RequestMapping(value = "insertMemberForm.do", method = RequestMethod.GET)
	public String insertMemberForm(Model model){
		model.addAttribute("content", "member/insertMember.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "insertMember.do", method = RequestMethod.POST)
	public String insertMember(Model model, Member member){
		memberService.add(member);
		
		model.addAttribute("content", "member/login.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String insertMemberForm(HttpSession session, Model model){
		session.removeAttribute("id");
		
		model.addAttribute("content", "member/login.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "myPage.do", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session){
		model.addAttribute("member", memberService.search((String)session.getAttribute("id")));
		model.addAttribute("content", "member/memberInfo.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "memberUpdateForm.do", method = RequestMethod.GET)
	public String memberUpdateForm(Model model, HttpSession session){
		model.addAttribute("member", memberService.search((String)session.getAttribute("id")));
		model.addAttribute("content", "member/updateMember.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "memberUpdate.do", method = RequestMethod.POST)
	public String memberUpdate(Member member){
		memberService.update(member);
		
		return "redirect:myPage.do";
	}
	
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(){
		return "index";
	}
}
