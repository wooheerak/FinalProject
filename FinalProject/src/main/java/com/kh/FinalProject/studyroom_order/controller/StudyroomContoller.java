package com.kh.FinalProject.studyroom_order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FinalProject.studyroom_order.model.serivce.StudyroomService;
import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;

@Controller
public class StudyroomContoller {
	
	@Autowired
	private StudyroomService srService;
	
	@RequestMapping("mystudyroomList.sr")
	public String mySeatList() {
		return "my_studyroomList";
	}
	
//	@RequestMapping("srDay.sr")
//	public String dayView() {
//		return "studyroomDay";
//	}
	@RequestMapping("srDay.sr")
	public ModelAndView dayView(ModelAndView mv) {
		
		int roomCount = srService.getRoomCount();
		ArrayList<Studyroom> list = srService.selectRoomList();
		
		System.out.println("roomCount : " + roomCount);
		System.out.println("list : " + list);
		
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("roomCount",roomCount);
			mv.setViewName("studyroomDay");
		}else {
			
		}
		return mv;
	}

	@RequestMapping("srWeek.sr")
	public String weekView() {
		return "studyroomWeek";
	}
	
	@RequestMapping("srReservation.sr")
	public String reservView() {
		// 값 받은후 변경
		return "studyroomReservation";
	}
	
	@RequestMapping("InsertStudyroom.sr")
	public void InsertStudyroom() {
		// 값 받은후 변경
		
		
		
	}
	
}
