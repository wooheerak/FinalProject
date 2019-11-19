package com.kh.FinalProject.studyroom_order.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FinalProject.studyroom_order.model.serivce.StudyroomService;
import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;
import com.kh.FinalProject.studyroom_order.model.vo.StudyroomOrder;

@Controller
public class StudyroomContoller {
	
	@Autowired
	private StudyroomService srService;
	
	// 내정보 > 스터디룸 예약 조회
	@RequestMapping("mystudyroomList.sr")
	public ModelAndView mySeatList(ModelAndView mv) {
		
		ArrayList<StudyroomOrder> list = srService.selectOrderList();
		System.out.println("학번으로 이름 출력전 list : " + list);
		
		ArrayList<String> hakbunList = new ArrayList<String>();
		
		for(StudyroomOrder so : list ) {
			hakbunList.add(so.getSo_participant());
			//System.out.println("학번만 뽑은 list"+hakbunList);
		}
		//System.out.println(hakbunList + "size : " + hakbunList.size());
		
		for(int i=0; i<hakbunList.size(); i++) {		
			String[] name = hakbunList.get(i).split(",");
			
			ArrayList<String> hcnList = new ArrayList<String>();
			for(int j =0; j<name.length; j++) {
				hcnList.add(name[j]);
			}
			
			Map<String, Object> map = new HashMap<String , Object>();
			
			map.put("list", hcnList);
			
			ArrayList<String> uList = srService.selectName(map);
			
			//System.out.println("uList : " + uList);
			
			String nameList = "";
			for(int k=0; k<uList.size(); k++) {
				nameList +=" "+uList.get(k);
			}
			list.get(i).setSo_participant(nameList);
		}
		
		if(list != null) {
			mv.addObject("list",list);			
			mv.setViewName("my_studyroomList");
			
		}else {
			
		}
		return mv;
	}
	
	// 스터디룸 조회
	@RequestMapping("getSrInfo.sr")
	@ResponseBody
	public ArrayList<Studyroom> studyroomInfo(@RequestParam String so_floor) {
		
		ArrayList<Studyroom> list = srService.getSrInfo(so_floor);
		//System.out.println("getSrInfo : " + list);
		return list;
	}
	
	// 스터디룸 해당일 예약 전체 조회
	@RequestMapping("srDay.sr")
	public ModelAndView dayView(ModelAndView mv,@RequestParam(value="year", required=false)Integer year,
								@RequestParam(value="month", required=false)Integer month,@RequestParam(value="day", required=false)Integer date) {
		
		int roomCount = srService.getRoomCount();
		ArrayList<Studyroom> roomlist = srService.selectRoomList();
		
		if(year==null) {
			//최초입력 시 오늘 날짜 정보 
			Calendar cr = Calendar.getInstance();
			year = cr.get(Calendar.YEAR);
			month = cr.get(Calendar.MONTH)+1;
			date = cr.get(Calendar.DATE);
		}
		String dateInfo = Integer.toString(year) + Integer.toString(month) + Integer.toString(date);
		//System.out.println("dateInfo : " +dateInfo);
		//Map<String, Object> map = new HashMap<String,Object>();
		
		
		ArrayList<StudyroomOrder> reservationInfo = srService.reservationInfo(dateInfo);
		System.out.println("reservationInfo: "+reservationInfo);
		//System.out.println("roomlist: "+roomlist);
		
		//System.out.println("roomCount : " + roomCount);
		//System.out.println("list : " + list);
		
		if(roomlist != null) {
			mv.addObject("year",year);
			mv.addObject("month",month);
			mv.addObject("date",date);
			mv.addObject("list",roomlist);
			mv.addObject("roomCount",roomCount);
			mv.addObject("reservationInfo",reservationInfo);
			mv.setViewName("studyroomDay");
		}else {
			
		}
		return mv;
	}

	@RequestMapping("srWeek.sr")
	public String weekView() {
		return "studyroomWeek";
	}
	
	// 스터디룸 예약 페이지
	@RequestMapping("srReservation.sr")
	public ModelAndView reservView(@RequestParam("sr_name") String sr_name, @RequestParam(value="so_date", required=false) String so_date,
								@RequestParam(value="so_startTime", required=false) String so_startTime, @RequestParam(value="so_organizer", required=false) String so_organizer,
								@RequestParam(value="sr_floor", required=false) String sr_floor, ModelAndView mv) {
		
		// 값 받은후 변경
		mv.addObject("sr_name",sr_name);
		mv.addObject("so_date",so_date);
		mv.addObject("so_startTime",so_startTime);
		mv.addObject("so_organizer",so_organizer);
		mv.addObject("sr_floor",sr_floor);
		
		// 전체 스터디룸 정보
		ArrayList<Studyroom> studyroomInfo = srService.selectRoomList();
		//System.out.println("studyroomInfo : " + studyroomInfo);
		
		if(studyroomInfo != null) {
			mv.addObject("studyroomInfo",studyroomInfo);
			mv.setViewName("studyroomReservation");
		}else {
			
		}
		
		return mv;
	}
	
	// 스터디룸 예약
	@RequestMapping("reservationStudyroom.sr")
	public String reservationStudyroom(@ModelAttribute StudyroomOrder sr) {
		// 값 받은후 변경
		
		System.out.println(sr);
		
		int result=srService.reservationStudyroom(sr);
		
		return "reservationCheckView";
		
	}
	
	// 학생체크
	@RequestMapping("checkId.sr")
	@ResponseBody
	public ArrayList<String> checkId(@RequestParam(value="idCheck"/*, required=false*/)ArrayList<String> idCheck) {
//		System.out.println("학생체크매핑됨");
//		System.out.println(idCheck);
//		System.out.println(idCheck.size());
		
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", idCheck);
		
		ArrayList<String> result= srService.checkId(map);
		
		return result;
	}
	
	
	
}
