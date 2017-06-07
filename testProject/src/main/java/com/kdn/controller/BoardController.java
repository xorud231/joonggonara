package com.kdn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.model.biz.BoardService;
import com.kdn.model.domain.Board;
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
	
	@RequestMapping(value = "searchBoard.do", method = RequestMethod.GET)
	public String searchBoard(int sellbuy, int bno, Model model){
		//sellbuy가 1이면 삽니다, 2면 팝니다
		
		Board board = boardService.searchBoard(sellbuy, bno);
		List<Reply> replys = boardService.searchReply(sellbuy, bno);
		
		model.addAttribute("board", board);
		model.addAttribute("replys", replys);
		model.addAttribute("content", "board/searchBoard.jsp");
		
		return "board/searchBoard";
	}
	@RequestMapping(value = "searchBuyList.do", method = RequestMethod.GET)
	public String searchBuyList(Model model, PageBean bean){
		List<Board> list = boardService.searchBuyList(bean);
		
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchBuyList.jsp");
		
		return "board/searchBuyList";
	}
}
