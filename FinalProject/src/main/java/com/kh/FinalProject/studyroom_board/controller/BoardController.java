package com.kh.FinalProject.studyroom_board.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.FinalProject.studyroom_board.model.exception.BoardException;
import com.kh.FinalProject.studyroom_board.model.service.Studyroom_BoderService;
import com.kh.FinalProject.studyroom_board.model.vo.Board;
import com.kh.FinalProject.studyroom_board.model.vo.Reply;

@Controller
public class BoardController {
	
	@Autowired
	private Studyroom_BoderService sbService;
	
	// 게시글 리스트
	@RequestMapping("bList.bo")
	public ModelAndView boardList(ModelAndView mv) {
		
		ArrayList<Board> list = sbService.selectList();
		
		if(list != null) {
			// list --> boardLisView
			mv.addObject("list", list);
			mv.setViewName("boardList");
		}else {
			throw new BoardException("게시글 조회 실패");
		}
		return mv;

	}
	
	// 게시글 보기
	@RequestMapping("bDetail.bo")
	public ModelAndView boardDetail(@RequestParam("bo_number") int bo_number, ModelAndView mv) {
		
		Board board = sbService.selectBoard(bo_number);
		
		if(board != null) {
			// board --> boardDetail
			mv.addObject("board",board)
			  .setViewName("boardDetail");
		}else {
			throw new BoardException("게시글 상세 보기 실패");
		}
		
		return mv;
	}
	
	// 게시글 등록 폼
	@RequestMapping("bInsertView.bo")
	public String boardInsertView() {
		
		return "boardInsert";
	}
	
	// 게시글 등록
	@RequestMapping("bInsert.bo")
	public String boardInsert(@ModelAttribute Board b, HttpServletRequest request) {
						
		int result = sbService.insertBoard(b);
		
		if(result > 0) {
			return "redirect:bList.bo";
		
			}else {
				throw new BoardException("게시글 등록 실패");
		}
	}
	
	// 게시글 업데이트 폼
	@RequestMapping("bUpView.bo")
	public ModelAndView boardUpdateView(@RequestParam("bo_number") int bo_number, ModelAndView mv) {
		
		Board board = sbService.selectBoard(bo_number);
		
		mv.addObject("board",board)
		  .setViewName("boardUpdate");
		
		return mv;
	}
	
	// 게시글 업데이트
	@RequestMapping("bUpdate.bo")
	public String boardUpdate(@ModelAttribute Board b , ModelAndView mv) {
		
		int result = sbService.updateBoard(b);
					
		if(result > 0) {
		
			return "redirect:bDetail.bo";
		}else {
			throw new BoardException("게시글 수정 실패");
		}

	}
	
	// 게시글 삭제
	@RequestMapping("bdelete.bo")
	public String boardDelete(@RequestParam("bo_number") int bo_number) {
	
		int result = sbService.deleteBoard(bo_number);
		
		if(result > 0) {
			return "redirect:bList.bo";
			
		}else {
			throw new BoardException("게시글 삭제 실패");
		}
	}
	
	// 그룹 참여
	@RequestMapping("bJoin.bo")
	public String memberJoin(@ModelAttribute Board b, HttpServletRequest request, ModelAndView mv) {
		
		int mem = b.getBo_member();
		int maxmem = b.getBo_maxmember();
		
		if( maxmem > mem) {
			int result = sbService.memberJoin(b);
			
			if(result > 0) {
				
				return "redirect:bDetail.bo";
			}else {
				throw new BoardException("그룹 참여 실패");
			}
			
		}
		throw new BoardException("모집 인원 초과");
	}
	
	
	// 댓글
	@RequestMapping("rList.bo")
	public void getReplyList(HttpServletResponse response, int bo_number) throws JsonIOException, IOException {
		ArrayList<Reply> list = sbService.selectReplyList(bo_number);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		if(list != null) {
		
			for(Reply r : list) {
				r.setrContent(URLEncoder.encode(r.getrContent(), "utf-8"));
				}
			}else{
				gson.toJson(list, response.getWriter());
		}
		
	}
	
	/*@RequestMapping("addReply.bo")
	@ResponseBody
	public String addReply(Reply r, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String rWriter = loginUser.getId();
		
		r.setrWriter(rWriter);
		
		int result = sbService.insertReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			throw new BoardException("댓글 등록 실패");
		}
	}*/
	
	

}
