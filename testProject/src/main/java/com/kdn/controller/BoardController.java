package com.kdn.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.model.biz.BoardService;
import com.kdn.model.biz.MemberService;
import com.kdn.model.domain.Board;
import com.kdn.model.domain.Member;
import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.Reply;

@Controller
public class BoardController {
	@ExceptionHandler
	public ModelAndView handler(Exception e){
		ModelAndView model = new ModelAndView("index");
		
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		
		return model;
	}
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memberService2;
	
	@RequestMapping(value = "searchBoard.do", method = RequestMethod.GET)
	public String searchBoard(int bno, Model model, HttpSession session){
		//sellbuy가 1이면 삽니다, 2면 팝니다
		
		String mno = (String)session.getAttribute("mno");
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		
		Board board = boardService.searchBoard(sellbuy, bno);
		List<Reply> replys = boardService.searchReply(sellbuy, bno);
		int replycount = boardService.getCountReply(sellbuy, bno);
		
		boolean isInCart = boardService.searchInCart(mno, sellbuy, bno);
		
		board.setInCart(isInCart);
		
		Member member = memberService2.search(mno);
		
		model.addAttribute("board", board);
		model.addAttribute("replys", replys);
		model.addAttribute("replycount", replycount);
		model.addAttribute("member", member);
		model.addAttribute("content", "board/searchBoard.jsp");
		return "index";
	}
	
	@RequestMapping(value = "searchBuyList.do", method = RequestMethod.GET)
	public String searchBuyList(Model model, PageBean bean, HttpSession session){
		
		session.setAttribute("sellbuy", 1);
		
		List<Board> list = boardService.searchBuyList(bean);
		
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchBuyList.jsp");
		
		return "index";
//		return "board/searchBuyList";
	}
	@RequestMapping(value = "searchSellList.do", method = RequestMethod.GET)
	public String searchSellList(Model model, PageBean bean, HttpSession session){
		session.setAttribute("sellbuy", 2);
		
		List<Board> list = boardService.searchSellList(bean);
		
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchSellList.jsp");
		
		return "index";
//		return "board/searchSellList";
	}
	@RequestMapping(value = "myBoardPage.do", method = RequestMethod.GET)
	public String myboardPage(HttpSession session){
		session.setAttribute("sellbuy", 3);
		
		return "index";
	}
	
	@RequestMapping(value = "reply.do", method = RequestMethod.GET)
	public String insertReply(int bno, String replycontent, HttpSession session, Model model){
		
		String mno = (String)session.getAttribute("mno");
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		
		boardService.insertReply(sellbuy, bno, replycontent, mno);
		
		model.addAttribute("sellbuy", sellbuy);
		model.addAttribute("bno", bno);
		
		return "redirect:searchBoard.do";
	}
	
	@RequestMapping(value = "updateCart.do", method = RequestMethod.GET)
	public String updateCart(int bno, HttpSession session, Model model){
		
		String mno = (String)session.getAttribute("mno");
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		
		boolean isInCart = boardService.searchInCart(mno, sellbuy, bno);
		
		boardService.updateCart(mno, sellbuy, bno, isInCart);
		
		model.addAttribute("sellbuy", sellbuy);
		model.addAttribute("bno", bno);
		
		return "redirect:searchBoard.do";
	}
	
	@RequestMapping(value = "deleteBoard.do", method = RequestMethod.GET)
	public String deleteBoard(int bno, HttpSession session, Model model){
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		
		boardService.deleteBoard(sellbuy, bno);
		
		return "redirect:searchBoard.do";
	}
}
