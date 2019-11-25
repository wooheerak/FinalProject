package com.kh.FinalProject.studyroom_order.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FinalProject.studyroom_order.model.serivce.StudyroomService;
import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;
import com.kh.FinalProject.studyroom_order.model.vo.StudyroomOrder;
import com.kh.FinalProject.studyseat.model.vo.SeatHistory;
import com.kh.FinalProject.user.model.vo.User;

@Controller
public class StudyroomContoller {
	
	@Autowired
	private StudyroomService srService;
	
	// 내정보 > 스터디룸 예약 조회
	@RequestMapping("mystudyroomList.sr")
	public ModelAndView mySeatList(HttpServletRequest request ,ModelAndView mv) {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		String id = "";
		ArrayList<StudyroomOrder> list = null;
		
		if(user != null) {
			id = user.getMember_Id();
			list = srService.selectOrderList(id);				
		}
		
		ArrayList<String> hakbunList = new ArrayList<String>();
		
		for(StudyroomOrder so : list ) {
			hakbunList.add(so.getSo_participant());
		}
		
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
	
	// 스터디룸 층별 조회
	@RequestMapping("getSrInfo.sr")
	@ResponseBody
	public ArrayList<Studyroom> studyroomInfo(@RequestParam String so_floor) {
		
		ArrayList<Studyroom> list = srService.getSrInfo(so_floor);
		//System.out.println("getSrInfo : " + list);
		return list;
	}
	
	// 스터디룸 해당일 예약 전체 조회
	@RequestMapping(value="srDay.sr", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView dayView(ModelAndView mv,@RequestParam(value="year", required=false)Integer year,
								@RequestParam(value="month", required=false)Integer month,@RequestParam(value="day", required=false)Integer date) {
		
		int roomCount = srService.getRoomCount();
		ArrayList<Studyroom> roomlist = srService.selectRoomList();

		System.out.println("변경전 month: " + month);
		
		if(year==null) {
			//최초입력 시 오늘 날짜 정보 
			Calendar cr = Calendar.getInstance();
			year = cr.get(Calendar.YEAR);
			month = cr.get(Calendar.MONTH)+1;
			date = cr.get(Calendar.DATE);
		}
		System.out.println(year+" "+month+" "+date);
		String dateInfo = Integer.toString(year) + Integer.toString(month) + Integer.toString(date);
		
		ArrayList<StudyroomOrder> reservationInfo = srService.reservationInfo(dateInfo);
		System.out.println("reservationInfo: "+reservationInfo);
		
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
	// 주간별 스터디룸 일정 조회
	@RequestMapping("srWeek.sr")
	public String weekView() {
		return "studyroomWeek";
	}
	
	// 스터디룸 게시판 마감 -> 예약 페이지
	@RequestMapping("srAppointment.sr")
	public ModelAndView sr( 
			@RequestParam(value="bo_member", required=false) int bo_member,
			@RequestParam(value="bo_number",required=false) int bo_number,
			@RequestParam(value="member_Name", required=false) String member_Name,
			@RequestParam(value="bo_join", required=false) String bo_join, ModelAndView mv) {
		
		System.out.println(bo_number);
		System.out.println(bo_member);
		System.out.println(member_Name);
		System.out.println(bo_join);
		
		mv.addObject("bo_number",bo_number);
		mv.addObject("bo_member",bo_member);
		mv.addObject("member_Name",member_Name);
		mv.addObject("bo_join",bo_join);
		
		
		//ArrayList<Studyroom> studyroomInfo = srService.checkRoomList(bo_member);
		//System.out.println("studyroomInfo : " + studyroomInfo);
		
		if(mv != null) {
			//mv.addObject("studyroomInfo",studyroomInfo);
			mv.setViewName("studyroomAppointment");
		}else {
			
		}
		
		return mv;
	}
	
	// 참여인원 만큼의 스터디룸 조회
		@RequestMapping("spoidSrInfo.sr")
		@ResponseBody
		public ArrayList<Studyroom> spoidSrInfo(@RequestParam String so_floor, @RequestParam String bo_member) {
//			Map<String,Object> map = new HashMap<>();
//			map.put("so_floor", so_floor);
//			map.put("bo_member", bo_member);
//			
//			System.out.println(map);
			
			Studyroom sr = new Studyroom();
			
			sr.setSr_floor(so_floor);
			sr.setSr_maxPeople(Integer.parseInt(bo_member));
			
//			ArrayList<Studyroom> list = srService.spoidSrInfo(map);
			ArrayList<Studyroom> list = srService.spoidSrInfo(sr);
			//System.out.println("getSrInfo : " + list);
			return list;
		}
	
	// 스터디룸 예약 페이지
	@RequestMapping("srReservation.sr")
	public ModelAndView reservView(@RequestParam("sr_name") String sr_name, @RequestParam(value="so_date", required=false) String so_date,
								@RequestParam(value="so_startTime", required=false) String so_startTime, @RequestParam(value="so_organizer", required=false) String so_organizer,
								@RequestParam(value="sr_floor", required=false) String sr_floor,ModelAndView mv) {
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
	// 스터디룸 예약 정보(날짜,스터디룸 이름) 조회
	@RequestMapping("orderList.sr")
	@ResponseBody
	public ArrayList<StudyroomOrder> orderList(String so_date, String so_name){
		StudyroomOrder sr = new StudyroomOrder();
		System.out.println("so_date : "+ so_date);
		System.out.println("so_name : " + so_name);
		
		sr.setSo_date(Date.valueOf(so_date));
		sr.setSo_name(so_name);
		
		System.out.println("sr : "  + sr);
		
		ArrayList<StudyroomOrder> list = srService.orderList(sr);
		
		System.out.println("list : " + list );
		
		return list;
	}
	
	// 스터디룸 예약
	@RequestMapping("reservationStudyroom.sr")
	public ModelAndView reservationStudyroom(@ModelAttribute StudyroomOrder sr,ModelAndView mv) {
		// 값 받은후 변경
		
		System.out.println("예약할 객체 SR 값:"+ sr);
		
		int result=srService.reservationStudyroom(sr);
		
		if(result!=0) {
			mv.addObject("sr",sr);
			mv.setViewName("reservationCheckView");
		}
		return mv;
		
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
	
	// 학생 시간 중복체크
	@RequestMapping("checkTime.sr")
	@ResponseBody
	public ArrayList<StudyroomOrder> checkTime(@RequestParam(value="so_participant")String so_participant, 
							@RequestParam(value="so_date", required=false) String so_date,
							@RequestParam(value="so_organizer", required=false) String so_organizer) {
//		System.out.println("학생체크매핑됨");
		SimpleDateFormat tf = new SimpleDateFormat("yyyy-MM-dd");
		// System.out.println("안바뀐 date : " + so_date);
		Date date=Date.valueOf(so_date);
		// System.out.println("바뀐 date : " + date);
		
		StudyroomOrder sro = new StudyroomOrder();
			sro.setSo_participant(so_participant);
			sro.setSo_organizer(so_organizer);
			sro.setSo_date(date);
		System.out.println("참여자 빼고 삽입 완료한 객체 sro : "+sro);
		
		// 참여자 쪼갤 배열
		String[] partici = so_participant.split(",| ");
		
		// 참여자별 조회 결과 저장을 위한 변수
		ArrayList<StudyroomOrder> result = new ArrayList<StudyroomOrder>();
		// 참여자 숫자만큼 검색
		for(int i =0; i<partici.length; i++) {
			System.out.println("검색하는 참여자 partici : "+partici[i]);
			sro.setSo_participant(partici[i]);
			System.out.println("예약 조회할 객체 sro: " + sro);
			ArrayList<StudyroomOrder> searchResult= srService.checkTime(sro);
			for(StudyroomOrder sr : searchResult) {
				result.add(sr);
			}
		}
		System.out.println("예약 조회 result : " + result);
		return result;
	}
	
	// ajax 예약취소(삭제)
	@RequestMapping("deleteOrder.sr")
	public void deleteOrder(String so_no) {
		System.out.println("deleteOrder.sr so_no : " + so_no);
		
		int result = srService.deleteOrder(so_no);
	}
	// ajax 마감 취소(삭제)
	@RequestMapping("cancelOrder.sr")
	public void cancelOrder(String bo_number) {
		System.out.println("cancelOrder.sr bo_number : " + bo_number);
		
		int result = srService.cancelOrder(bo_number);
	}
	
}
