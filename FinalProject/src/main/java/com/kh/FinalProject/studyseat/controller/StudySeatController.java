package com.kh.FinalProject.studyseat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.FinalProject.studyseat.model.exception.SeatException;
import com.kh.FinalProject.studyseat.model.service.SeatService;
import com.kh.FinalProject.studyseat.model.vo.Seat;
import com.kh.FinalProject.user.model.vo.User;

@Controller
public class StudySeatController {

		@Autowired
		private SeatService sService ;
		
		@RequestMapping("seatList.ss")
		public ModelAndView selectSeatList(ModelAndView mv , @RequestParam(value = "floor" , defaultValue = "A") String floor) {
			
						
			// A , B , C 열람실의 좌석을 먼저 가져옴
			ArrayList<Integer> countList = sService.countSeat();
			
			
			if(countList == null) {
				throw new SeatException("열람실별 좌석갯수 불러오기 실패!");
			}
			
			// default로 A열람실의 좌석을 먼저 보여줌			
			ArrayList<Seat> sList = sService.selectSeatList(floor);
			
			System.out.println("floor : " + floor + "sList : " + sList);
			if(sList != null) {
				
				
				 mv.addObject("count" , countList)
				   .addObject("list" , sList)
				   .addObject("floor" , floor)
				   .setViewName("studyseatView");
				return mv;
			}
			else {
				throw new SeatException("좌석리스트 가져오기 실패!");
			}
			 
		}
		
		@RequestMapping("myseatList.ss")
		public String mySeatList() {
			
			return "my_studyseatList";
		}
		
		@RequestMapping("studymain.ss")
		public String studyMain() {
			return "studyMain";
		}		
		
		@RequestMapping("popResv.ss")
		public ModelAndView popResv(@RequestParam("ss_no") int ss_no,@RequestParam(value = "floor" , defaultValue = "A") String floor, ModelAndView mv) {
			
			mv.addObject("sNo" , ss_no).addObject("floor" , floor).setViewName("popReservation");
			
			return mv;
		}
		
		@RequestMapping("popCancel.ss")
		public String popCancel() {
			return "popCancelResv";
		}
		
		@RequestMapping("slistAjax.ss")
		public void selectSeatList(HttpServletResponse response , String floor) throws IOException {
			
			response.setContentType("application/json; charset=UTF-8");
			
			// A , B , C 열람실의 좌석을 먼저 가져옴
			ArrayList<Integer> countList = sService.countSeat();
			
			JSONArray countArr = new JSONArray();
			
			for(int i : countList) {
				JSONObject jCount = new JSONObject();
				
				jCount.put("count", i);
				countArr.add(jCount);
			}
			
			System.out.println("countList : " + countList);
			if(countList == null) {
				throw new SeatException("열람실별 좌석갯수 불러오기 실패!");
			}
			
			
			
			
			// 열람실 층수에 맞는 좌석을 가져옴
			ArrayList<Seat> sList = sService.selectSeatList(floor);
			
			JSONArray seatArr = new JSONArray();
			
			for(Seat seat : sList) {
				JSONObject jSeat = new JSONObject();
				
				jSeat.put("no", seat.getSs_no());
				jSeat.put("floor", seat.getSs_floor());
				jSeat.put("use", seat.getSs_use());
				
				seatArr.add(jSeat);
			}
			
			Gson gson = new GsonBuilder().create(); 
						
			if(countList != null && sList != null) {
				JSONObject sendJson = new JSONObject();
				sendJson.put("cList", countArr);
				sendJson.put("sList", seatArr);
				
				PrintWriter out = response.getWriter();
				out.print(sendJson);
				out.flush();
				out.close();
			}
			else {
				throw new SeatException("열람실 층에 맞는 좌석가져오기 실패!");
			}			
			
		}
		
		@RequestMapping("updateR.ss")
		public ModelAndView updateResv(ModelAndView mv , @RequestParam("sNo") int sNo , @RequestParam("floor") String floor , HttpServletRequest request) {
			
			System.out.println("sNo : " + sNo + ", floor : " + floor);
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			
			Seat seat = new Seat();
			seat.setSs_no(sNo);
			seat.setSs_floor(floor);
			seat.setCert_code(getCertCode());
			seat.setStudent_id(user.getMember_Id());
			
			System.out.println("seat : " + seat);
			
			int result = sService.updateResv(seat);
			
			if(result > 0) {
				
				mv.addObject("floor" , floor).setViewName("redirect:seatList.ss");
				
				return mv;
			}
			else {
				throw new SeatException("좌석 예약하기 실패!");
			}
			
			
			
		}
		
		
		public String getCertCode() {
			
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 6; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
			    }
			}


			return temp.toString();
		}
		
		
		@RequestMapping("checkDup.ss")
		@ResponseBody
		public String checkDup(HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			
			User user = (User)session.getAttribute("loginUser");
			String id = user.getMember_Id();
			
			int result = sService.checkDup(id);
			
			if(result == 0) {
				return "notDup";
			}
			else {				
				return "dup";
			}
			 
			
			
		}

}
