package com.syi.project.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.syi.project.model.Criteria;
import com.syi.project.model.PageDTO;
import com.syi.project.model.board.BoardVO;
import com.syi.project.model.board.CommentsVO;
import com.syi.project.model.board.HeartVO;
import com.syi.project.model.member.MemberVO;
import com.syi.project.service.board.BoardService;
import com.syi.project.service.board.CommentService;

@Controller
@RequestMapping("/member/board")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;

	@GetMapping("/list")
	public void listBoards(Criteria cri, Model model) {
		List<BoardVO> boardList = boardService.selectBoards(cri);
		model.addAttribute("boardList", boardList);
		int total = boardService.selectBoardTotal(cri);
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
	}

	@GetMapping("/detail")
	public String detailBoard(int boardNo, Criteria cri, HeartVO heart, Model model, HttpSession session) {
		long start = System.currentTimeMillis();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		BoardVO board = boardService.selectBoardByBoardNo(boardNo);
		List<CommentsVO> commentList = commentService.selectCommentList(boardNo, cri);
		
		heart.setHeartBoardNo(boardNo);
		heart.setHeartMemberNo(member.getMemberNo());
		int heartCount = boardService.selectMyHeart(heart);
		
		model.addAttribute("board", board);
		model.addAttribute("commentList", commentList);
		model.addAttribute("heartCount", heartCount);
		
		long end = System.currentTimeMillis();
		double timeInSeconds = (end - start) / 1000.0;
		
		int total = commentService.selectCommentTotal(boardNo);
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
		
	    System.out.println(">>> 조회 소요 시간 : " + timeInSeconds + " 초");
		return "member/board/detail";
	}

	@GetMapping("/enroll")
	public String insertBoard() {
		return "member/board/enroll";
	}

	@PostMapping("/enroll")
	public String insertBoard(@ModelAttribute BoardVO board, RedirectAttributes rttr, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		int boardMemberNo = member.getMemberNo();
		board.setBoardMemberNo(boardMemberNo);

		int result = boardService.insertBoard(board);
		if (result > 0) {
			rttr.addFlashAttribute("message", "등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "등록에 실패하였습니다.");
		}
		return "redirect:/member/board/list";
	}

	@GetMapping("/modify")
	public String updateBoard(int boardNo, Model model) {
		BoardVO board = boardService.selectBoardByBoardNo(boardNo);
		model.addAttribute("board", board);
		return "member/board/modify";
	}

	@PostMapping("/modify")
	public String updateBoard(@ModelAttribute BoardVO board, RedirectAttributes rttr) {
		int result = boardService.updateBoard(board);
		if (result > 0) {
			rttr.addFlashAttribute("message", "정상적으로 수정되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "수정에 실패하였습니다.");
		}
		return "redirect:/member/board/detail?boardNo=" + board.getBoardNo();
	}

	@PostMapping("/delete")
	@ResponseBody
	public String deleteBoard(int boardNo) {
		int result = boardService.deleteBoard(boardNo);
		return result > 0 ? "success" : "fail";
	}

	// 좋아요
	@PostMapping("/heart")
	@ResponseBody
	public String heartBoard(@RequestParam int boardNo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		HeartVO heart = new HeartVO();
		heart.setHeartBoardNo(boardNo);
		heart.setHeartMemberNo(member.getMemberNo());
		
		int heartCount = boardService.selectMyHeart(heart);
		
		if(heartCount > 0) {
			int result = boardService.deleteHeart(heart);
			if(result > 0) {
				boardService.decreaseHeartCount(boardNo);
				return "heartRemoved";
			}
		} else {
			int result = boardService.insertHeart(heart);
			if(result > 0) {
				boardService.increaseHeartCount(boardNo);
				return "heartAdded";
			}
		}
		return "fail";
	}
	
	
}
