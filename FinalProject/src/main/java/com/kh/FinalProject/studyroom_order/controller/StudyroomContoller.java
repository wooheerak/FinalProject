package com.kh.FinalProject.studyroom_order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FinalProject.studyroom_order.model.serivce.StudyroomService;
import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;
import com.kh.FinalProject.studyroom_order.model.vo.StudyroomOrder;

@Controller
public class StudyroomContoller {
	
	@Autowired
	private StudyroomService srService;
	
	@RequestMapping("mystudyroomList.sr")
	public ModelAndView mySeatList(ModelAndView mv) {
		
		ArrayList<StudyroomOrder> list = srService.selectOrderList();
		
		System.out.println(list);
		
		if(list != null) {
			mv.addObject("list",list);
			
			mv.setViewName("my_studyroomList");
		}else {
			
		}
		return mv;
	}
	
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
	public ModelAndView reservView(@RequestParam("sr_name") String sr_name, @RequestParam(value="so_date", required=false) String so_date,
								@RequestParam(value="so_startTime", required=false) String so_startTime, @RequestParam(value="so_organizer", required=false) String so_organizer,
								@RequestParam(value="sr_floor", required=false) String sr_floor, ModelAndView mv) {
//		System.out.println(sr_name);
//		System.out.println(so_date);
//		System.out.println(so_startTime);
//		System.out.println(so_organizer);
//		System.out.println(sr_floor);
		
		// 값 받은후 변경
		mv.addObject("sr_name",sr_name);
		mv.addObject("so_date",so_date);
		mv.addObject("so_startTime",so_startTime);
		mv.addObject("so_organizer",so_organizer);
		mv.addObject("sr_floor",sr_floor);
		mv.setViewName("studyroomReservation");
		
		return mv;
	}
	
	@RequestMapping("reservationStudyroom.sr")
	public void reservationStudyroom(@ModelAttribute StudyroomOrder sr) {
		// 값 받은후 변경
		
		System.out.println(sr);
		
		int result=srService.reservationStudyroom(sr);
		
		
	}
	
}
