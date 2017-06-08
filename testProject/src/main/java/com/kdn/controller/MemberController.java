package com.kdn.controller;

import java.awt.Window;
import java.awt.event.WindowEvent;

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
		ModelAndView model = new ModelAndView("main");
		
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		
		return model;
	}
	
	@Autowired
	private MemberService memberService;

/*	@RequestMapping(value = "loginform.do", method = RequestMethod.GET)
	public String loginform(Model model){
		model.addAttribute("content", "main.jsp");
		
		return "index";
	}*/
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(String mno, String password, HttpSession session){
		
		memberService.login(mno, password);
		session.setAttribute("mno", mno);
		
		return "index";
		//return "redirect:index.do";
	}
	
/*	@RequestMapping(value = "insertMemberForm.do", method = RequestMethod.GET)
	public String insertMemberForm(Model model){
		model.addAttribute("content", "insertMember.jsp");
		
		return "index";
	}
	*/
	@RequestMapping(value = "insertMember.do", method = RequestMethod.POST)
	public String insertMember(Model model, Member member){
		
		memberService.add(member);
	
		model.addAttribute("content", "main");
		
		return "main";
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String insertMemberForm(HttpSession session, Model model){
		session.removeAttribute("mno");
		
		model.addAttribute("content", "main");
		
		return "main";
	}
	
	@RequestMapping(value = "myPage.do", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session){
		model.addAttribute("member", memberService.search((String)session.getAttribute("mno")));
		model.addAttribute("content", "member/memberInfo.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "memberUpdateForm.do", method = RequestMethod.GET)
	public String memberUpdateForm(Model model, HttpSession session){
		model.addAttribute("member", memberService.search((String)session.getAttribute("mno")));
		model.addAttribute("content", "member/updateMember.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "memberUpdate.do", method = RequestMethod.GET)
	public String memberUpdate(Member member){
		memberService.update(member);
		
		return "redirect:myPage.do";
	}
	
	
	
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(){
		
		return "index";
	}
	
	@RequestMapping(value = "gomain.do", method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.removeAttribute("mno");
		return "main";
	}
}
