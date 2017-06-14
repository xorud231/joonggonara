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
		int sellbuyCheck = (Integer)session.getAttribute("sellbuyCheck");
		if(sellbuy == 3){
			if(sellbuyCheck == 1 || sellbuyCheck == 3)
				sellbuy = 1;
			
			else if (sellbuyCheck == 2 || sellbuyCheck == 4)
				sellbuy = 2;
		}
		Board board = boardService.searchBoard(sellbuy, bno);
		List<Reply> replys = boardService.searchReply(sellbuy, bno);
		int replycount = boardService.getCountReply(sellbuy, bno);
		boolean isInCart = boardService.searchInCart(mno, sellbuy, bno);

		board.setIsInCart(isInCart);

		Member member = memberService2.search(mno);
		Member member2 = memberService2.search(board.getMno() + "");
		String category = boardService.getCategory(board.getCno());
		String dealway = boardService.getDealway(board.getDno());
		int imageCount = boardService.getImageCount(sellbuy, bno);

		model.addAttribute("board", board);
		model.addAttribute("replys", replys);
		model.addAttribute("replycount", replycount);
		model.addAttribute("member", member);
		model.addAttribute("member2", member2);
		model.addAttribute("category", category);
		model.addAttribute("dealway", dealway);
		model.addAttribute("imageCount", imageCount);
		model.addAttribute("content", "board/searchBoard.jsp");
		
		return "index";
	}
	@RequestMapping(value = "searchMyBuyBoard.do", method = RequestMethod.GET)
	public String searchMyBuyBoardList( Model model, PageBean bean, HttpSession session){
		session.setAttribute("sellbuyCheck", 3);
		
		String mnoString = (String)session.getAttribute("mno");
		int mno = Integer.parseInt(mnoString);
		bean.setMno(mno);
		List<Board> list = boardService.searchMyBuyBoard(bean);
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchList.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "searchMySellBoard.do", method = RequestMethod.GET)
	public String searchMySellBoardList( Model model, PageBean bean, HttpSession session){
		session.setAttribute("sellbuyCheck", 4);
		
		String mnoString = (String)session.getAttribute("mno");
		int mno = Integer.parseInt(mnoString);
		bean.setMno(mno);
		List<Board> list = boardService.searchMySellBoard(bean);
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchList.jsp");
		
		return "index";
	}
	@RequestMapping(value = "searchBuyList.do", method = RequestMethod.GET)
	public String searchBuyList(Model model, PageBean bean, HttpSession session){
		session.setAttribute("sellbuy", 1);
		session.setAttribute("cnoSession", bean.getCno());
		
		List<Board> list = boardService.searchBuyList(bean);
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchList.jsp");
		
		return "index";
	}
	@RequestMapping(value = "searchSellList.do", method = RequestMethod.GET)
	public String searchSellList(Model model, PageBean bean, HttpSession session){
		session.setAttribute("sellbuy", 2);
		session.setAttribute("cnoSession", bean.getCno());
		
		List<Board> list = boardService.searchSellList(bean);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchList.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "searchBuyCart.do", method = RequestMethod.GET)
	public String searchBuyCartList( Model model, PageBean bean,HttpSession session){
		session.setAttribute("sellbuyCheck", 1);
		
		String mnoString = (String)session.getAttribute("mno");
		int mno = Integer.parseInt(mnoString);
		bean.setMno(mno);
		List<Board> list = boardService.searchBuyCart(bean);
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchList.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "searchSellCart.do", method = RequestMethod.GET)
	public String searchSellCartList( Model model, PageBean bean,HttpSession session){
		session.setAttribute("sellbuyCheck", 2);
		
		String mnoString = (String)session.getAttribute("mno");
		int mno = Integer.parseInt(mnoString);
		bean.setMno(mno);
		List<Board> list = boardService.searchSellCart(bean);
		model.addAttribute("list", list);
		model.addAttribute("content", "board/searchList.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "reply.do", method = RequestMethod.GET)
	public String insertReply(int bno, String replycontent, HttpSession session, Model model){
		System.out.println(bno);
		String mno = (String)session.getAttribute("mno");
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		int sellbuyCheck = (Integer)session.getAttribute("sellbuyCheck"); 

		if(sellbuy == 3){
			if(sellbuyCheck == 1 || sellbuyCheck == 3)
				sellbuy = 1;
			
			else if (sellbuyCheck == 2 || sellbuyCheck == 4)
				sellbuy = 2;
		}
		
		boardService.insertReply(sellbuy, bno, replycontent, mno);
		
		model.addAttribute("sellbuy", sellbuy);
		model.addAttribute("bno", bno);
		
		return "redirect:searchBoard.do";
	}
	
	@RequestMapping(value = "updateCart.do", method = RequestMethod.GET)
	public String updateCart(int bno, HttpSession session, Model model){
		
		String mno = (String)session.getAttribute("mno");
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		int sellbuyCheck = (Integer)session.getAttribute("sellbuyCheck"); 

		if(sellbuy == 3){
			if(sellbuyCheck == 1)
				sellbuy = 1;
			
			else if (sellbuyCheck == 2)
				sellbuy = 2;
		}
		
		boolean isInCart = boardService.searchInCart(mno, sellbuy, bno);
		
		boardService.updateCart(mno, sellbuy, bno, isInCart);
		
		model.addAttribute("sellbuy", sellbuy);
		model.addAttribute("bno", bno);
		
		return "redirect:searchBoard.do";
	}
	
	@RequestMapping(value = "deleteBoard.do", method = RequestMethod.GET)
	public String deleteBoard(int bno, HttpSession session, Model model){
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		int sellbuyCheck = (Integer)session.getAttribute("sellbuyCheck"); 
		int cno = (Integer)session.getAttribute("cnoSession");
		int post_sellbuy = sellbuy;

		if(sellbuy == 3){
			if(sellbuyCheck == 3){
				sellbuy = 1;
				cno = 1;
			}
			
			else if (sellbuyCheck == 4){
				sellbuy = 2;
				cno = 1;
			}
		}
		
		boardService.deleteBoard(sellbuy, bno);
		
		if(post_sellbuy == 1)
			return "redirect:searchBuyList.do?cno=" + cno;
		
		else if(post_sellbuy == 2)
			return "redirect:searchSellList.do?cno=" + cno;
		
		else if(post_sellbuy == 3 && sellbuyCheck == 3)
			return "redirect:searchMyBuyBoard.do?cno=1";
		
		else if(post_sellbuy == 3  && sellbuyCheck == 4)
			return "redirect:searchMySellBoard.do?cno=1";
		
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
		int sellbuyCheck = (Integer)session.getAttribute("sellbuyCheck");
		
		if(sellbuy == 3){
			if(sellbuyCheck == 1 || sellbuyCheck == 3)
				sellbuy = 1;
			
			else if (sellbuyCheck == 2 || sellbuyCheck == 4)
				sellbuy = 2;
		}
		
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
		int sellbuyCheck = (Integer)session.getAttribute("sellbuyCheck"); 

		if(sellbuy == 3){
			if(sellbuyCheck == 1 || sellbuyCheck == 3)
				sellbuy = 1;
			
			else if (sellbuyCheck == 2 || sellbuyCheck == 4)
				sellbuy = 2;
		}
		
		boardService.deleteReply(sellbuy, rno);
		model.addAttribute("bno", bno);
		
		return "redirect:searchBoard.do";
	}
	
	@RequestMapping(value = "insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(Board board, String cnoInsert, HttpSession session, Model model, HttpServletRequest request){
		System.out.println(board);
		String mnoString = (String)session.getAttribute("mno");
		int sellbuy = (Integer)session.getAttribute("sellbuy");
		int mno = Integer.parseInt(mnoString);
		int bno = board.getBno();
		String dir = request.getRealPath("upload/");
		int cno = Integer.parseInt(cnoInsert);
		board.setCno(cno);
		
		board.setBno(boardService.getBoardNo(sellbuy));
		board.setMno(mno);

		boardService.insertBoard(sellbuy, board, dir, bno);
		model.addAttribute("bno", board.getBno());
		
		return "redirect:searchBoard.do";
	}
}
