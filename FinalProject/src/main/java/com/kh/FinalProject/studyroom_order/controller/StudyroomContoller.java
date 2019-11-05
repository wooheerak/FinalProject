package com.kh.FinalProject.studyroom_order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudyroomContoller {
	
//	public ModelAndView studyroomDayView(ModelAndView mv) {
//		
//		retrun mv
//	}
	
	@RequestMapping("srDay.sr")
	public String dayView() {
		return "studyroomDay";
	}

	@RequestMapping("srWeek.sr")
	public String weekView() {
		return "studyroomWeek";
	}
	
	@RequestMapping("srReservation.sr")
	public String reservView() {
		return "studyroomReservation";
	}
	
	
}
