package com.kh.FinalProject.studyroom_board.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.FinalProject.studyroom_board.model.exception.BoardException;
import com.kh.FinalProject.studyroom_board.model.service.Studyroom_BoderService;
import com.kh.FinalProject.studyroom_board.model.vo.Board;
import com.kh.FinalProject.studyroom_board.model.vo.Reply;
import com.kh.FinalProject.user.model.vo.User;

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
	public ModelAndView boardUpdate(@ModelAttribute Board b, ModelAndView mv) {
		
		int result = sbService.updateBoard(b);
					
		if(result > 0) {
			mv.setViewName("redirect:bDetail.bo?bo_number=" + b.getBo_number());
			return mv;
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
	
	// 모집 마감
	@RequestMapping("bComplete.bo")
	public String boardComplete(@RequestParam("bo_number") int bo_number) {
		
		int result = sbService.completeBoard(bo_number);
		
		if(result > 0) {
			return "redirect:bList.bo";
			
		}else {
			throw new BoardException("모집 마감 실패");
		}
	}
	
	// 그룹 참여
	@RequestMapping("bJoin.bo")
	public ModelAndView memberJoin(@RequestParam("bo_number") int bo_number, @RequestParam("bo_member") int bo_member,
								@RequestParam("bo_maxmember") int bo_maxmember, @RequestParam("Member_Name") String Member_Name,
								@RequestParam("Member_Id") String Member_Id,
							HttpServletRequest request, ModelAndView mv) {
		
		Map<String, Object> join = new HashMap<String, Object>();
		join.put("bo_number", bo_number );
		join.put("Member_Name", Member_Name );
		join.put("Member_Id", Member_Id );
		
		int mem = bo_member;
		int maxmem = bo_maxmember;
		int bNo = bo_number;
		
		if( mem < maxmem) {
			int result = sbService.memberJoin(join);
			
			if(result > 0) {
				
				mv.addObject("bo_number", bNo).setViewName("redirect:bDetail.bo");
				return mv;
			}else {
				throw new BoardException("그룹 참여 실패");
			}
			
		}else {
			throw new BoardException("모집 인원 초과");
		}
	}
	
	// 그룹 탈퇴
	@RequestMapping("bUnjoin.bo")
	public ModelAndView memberUnjoin(@RequestParam("bo_number") int bo_number, @RequestParam("Member_Name") String Member_Name,
						HttpServletRequest request, ModelAndView mv) {
		
		int bNo = bo_number;
		
		Map<String, Object> join = new HashMap<String, Object>();
		join.put("bo_number",bo_number);
		join.put("Member_Name",Member_Name);
		
		int result = sbService.memberUnjoin(join);
			
		if(result > 0) {
			
			mv.addObject("bo_number", bNo).setViewName("redirect:bDetail.bo");
			return mv;
		}else {
			throw new BoardException("그룹 탈퇴 실패");
		}
		
	}
	
	
	// 댓글 리스트
	@RequestMapping("rList.bo")
	@ResponseBody
	public void getReplyList(HttpServletResponse response, int bo_number) throws JsonIOException, IOException {
		
		ArrayList<Reply> list = sbService.selectReplyList(bo_number);
		
		if(list != null) {
			
			for(Reply r : list) {
				r.setrContent(URLEncoder.encode(r.getrContent(), "utf-8"));
			}
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(list, response.getWriter());
		}else {
			System.out.println("댓글 없음");
		}

	}
	
	// 댓글 입력
	@RequestMapping("addReply.bo")
	@ResponseBody
	public String addReply(Reply r, HttpSession session) {
		
		User loginUser = (User)session.getAttribute("loginUser"); // 세션에 로그인 정보 가져옴
		String rWriter = loginUser.getMember_Id(); // 세션의 작성자 불러옴
		
		r.setrWriter(rWriter); // reply 에 작성자 넣어줌
		
		int result = sbService.insertReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			throw new BoardException("댓글 등록 실패");
		}
	}
	
	// 댓글 삭제
	@RequestMapping("rDelete.bo")
	@ResponseBody
	public String deleteReply(int rId) {
		
		int result = sbService.deleteReply(rId);
		
		if(result > 0) {
			return "success";
		}else {
			throw new BoardException("댓글 삭제 실패");
		}
	}
	// 댓글 수정
	@RequestMapping("rUpdate.bo")
	@ResponseBody
	public String updateReply(int rId, String rContent, HttpSession session) {
		
		Map<String, Object> reply = new HashMap<String, Object>();
		reply.put("rId", rId );
		reply.put("rContent", rContent );
		
		int result = sbService.updateReply(reply);
		
		if(result > 0) {
			return "success";
		}else {
			throw new BoardException("댓글 수정 실패");
		}
	}
	
	

}
