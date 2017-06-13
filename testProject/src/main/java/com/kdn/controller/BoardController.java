package com.kdn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
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
		System.out.println(board);
		List<Reply> replys = boardService.searchReply(sellbuy, bno);
		int replycount = boardService.getCountReply(sellbuy, bno);
		boolean isInCart = boardService.searchInCart(mno, sellbuy, bno);

		board.setIsInCart(isInCart);

		Member member = memberService2.search(mno);
		String category = boardService.getCategory(board.getCno());
		String dealway = boardService.getDealway(board.getDno());
		int imageCount = boardService.getImageCount(sellbuy, bno);

		model.addAttribute("board", board);
		model.addAttribute("replys", replys);
		model.addAttribute("replycount", replycount);
		model.addAttribute("member", member);
		model.addAttribute("category", category);
		model.addAttribute("dealway", dealway);
		model.addAttribute("imageCount", imageCount);
		model.addAttribute("content", "board/searchBoard.jsp");
		
		return "index";
	}
	@RequestMapping(value = "searchBuyList.do", method = RequestMethod.GET)
	public String searchBuyList(Model model, PageBean bean, HttpSession session){
		session.setAttribute("sellbuy", 1);
		
		List<Board> list = boardService.searchBuyList(bean);
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchList.jsp");
		
		return "index";
	}
	@RequestMapping(value = "searchSellList.do", method = RequestMethod.GET)
	public String searchSellList(Model model, PageBean bean, HttpSession session){
		session.setAttribute("sellbuy", 2);
		
		List<Board> list = boardService.searchSellList(bean);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchList.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "reply.do", method = RequestMethod.GET)
	public String insertReply(int bno, String replycontent, HttpSession session, Model model){
		System.out.println(bno);
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
		
		if(sellbuy == 1)
			return "redirect:searchBuyList.do";
		
		else if(sellbuy == 2)
			return "redirect:searchSellList.do";
		
		else
			return "redirect:HelloBoard.do";
	}
	@RequestMapping(value = "helloBoard.do", method = RequestMethod.GET)
	public String helloBoard(Model model ,HttpSession session){
		String mno = (String)session.getAttribute("mno");
		
		session.setAttribute("sellbuy", 3);
		
		model.addAttribute("nick", memberService2.search(mno).getNick());
		model.addAttribute("content", "board/helloBoard.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "updateReply.do", method = RequestMethod.GET)
	public String updateReply(String replyTemp, String editReply, HttpSession session, Model model){
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		
		String rnoString = replyTemp.split("=")[1].split(",")[0];
		String replyContent = replyTemp.split("=")[2].split(",")[0];
		String bnoString = replyTemp.split("=")[3].split(",")[0];
		String regdate = replyTemp.split("=")[4].split(",")[0];
		String mnoString = replyTemp.split("=")[5].split(",")[0];
		
		int rno = Integer.parseInt(rnoString);
		int bno = Integer.parseInt(bnoString);
		int mno = Integer.parseInt(mnoString);
		
		Reply reply = new Reply(rno, replyContent, bno, regdate, mno);
		
		boardService.updateReply(sellbuy, reply, editReply);
		model.addAttribute("bno", reply.getBno());
		
		return "redirect:searchBoard.do";
	}

	@RequestMapping(value = "deleteReply.do", method = RequestMethod.GET)
	public String deleteReply(String rnoString, int bno, HttpSession session, Model model){
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		int rno = Integer.parseInt(rnoString);
		
		boardService.deleteReply(sellbuy, rno);
		model.addAttribute("bno", bno);
		
		return "redirect:searchBoard.do";
	}
	
	@RequestMapping(value = "insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(Board board, HttpSession session, Model model, HttpServletRequest request){
		String mnoString = (String)session.getAttribute("mno");
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		int mno = Integer.parseInt(mnoString);
		int bno = board.getBno();
		String dir = request.getRealPath("upload/");
		
		board.setBno(boardService.getBoardNo(sellbuy));
		board.setMno(mno);

		boardService.insertBoard(sellbuy, board, dir, bno);
		
		model.addAttribute("bno", board.getBno());
		
		return "redirect:searchBoard.do";
	}
	
	/*@RequestMapping(value = "updateBoard.do", method = RequestMethod.POST)
	public String updateBoard(Board board, HttpSession session, Model model, HttpServletRequest request){
		String mnoString = (String)session.getAttribute("mno");
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		int mno = Integer.parseInt(mnoString);
		String dir = request.getRealPath("upload/");
		
		board.setMno(mno);
		
		boardService.updateBoard(sellbuy, board, dir);
		
		model.addAttribute("bno", board.getBno());
		
		return "redirect:searchBoard.do";
	}*/
}
