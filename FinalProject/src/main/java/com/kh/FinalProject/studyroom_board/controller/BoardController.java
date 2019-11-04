package com.kh.FinalProject.studyroom_board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.FinalProject.studyroom_board.model.service.Studyroom_BoderService;

@Controller
public class BoardController {
	
	@Autowired
	private Studyroom_BoderService sbService;
	
	@RequestMapping("bList.bo")
	public String boardList() {
		
		return "boardList";

	}
	
	
	
	
	@RequestMapping("bDetail.bo")
	public String boardDetail() {
		
		return "boardDetail";
		
	}
	
	@RequestMapping("bInsert.bo")
	public String boardInsert() {
		
		return "boardInsert";
		
	}
	
	@RequestMapping("bUpdate.bo")
	public String boardUpdate() {
		
		return "boardUpdate";
		
	}

}
