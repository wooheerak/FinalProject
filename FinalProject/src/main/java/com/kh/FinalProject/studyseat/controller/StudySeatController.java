package com.kh.FinalProject.studyseat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.Cookie;
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
import com.google.gson.JsonIOException;
import com.kh.FinalProject.studyseat.model.exception.SeatException;
import com.kh.FinalProject.studyseat.model.service.SeatService;
import com.kh.FinalProject.studyseat.model.vo.Seat;
import com.kh.FinalProject.studyseat.model.vo.SeatHistory;
import com.kh.FinalProject.user.model.vo.User;

@Controller
public class StudySeatController {

		@Autowired
		private SeatService sService ;
		
		// 좌석리스트 가져오기
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
		
		// 나의 열람실 사용내역 
		@RequestMapping("myseatList.ss")
		public ModelAndView mySeatList(HttpServletRequest request , ModelAndView mv) {
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			String id = "";
			ArrayList<SeatHistory> shList = null;
			
			if(user != null) {
				id = user.getMember_Id();
				shList = sService.selectHistoryList(id);				
			}
			
			if(shList != null) {
				mv.addObject("list" , shList).setViewName("my_studyseatList");
				
				return mv;
			}
			else {
				throw new SeatException("개인정보 : 열람실이용내역 불러오기 실패 !");
			}	
			
			
		}
		
		// 메인페이지로 이동
		@RequestMapping("studymain.ss")
		public String studyMain() {
			return "studyMain";
		}		
		
		// ajax로 좌석리스트 
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
		
		// 예약 취소 (ajax)
		@RequestMapping("cancelResv.ss")
		public void cancelResv(HttpServletRequest request , @RequestParam("cancelId") int cancelId , HttpServletResponse response) throws JsonIOException, IOException {
			
			response.setContentType("application/json; charset=UTF-8");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			
			
			ArrayList<SeatHistory> shList = null;
			Seat seat = new Seat();
			String id = "";
			if(user != null) {
				id = user.getMember_Id();
				seat.setStudent_id(user.getMember_Id());
				seat.setSs_no(cancelId);
			}
			System.out.println("seat " + seat);
			
			int result1 = sService.cancelResv(seat);
			
			int result = 0;
			
			if(result1 > 0) {
				result = sService.resetSeat(cancelId);
			}
			
			if(result > 0) {
				if(user != null) {
					id = user.getMember_Id();
					shList = sService.selectHistoryList(id);				
				}				
			}
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(shList , response.getWriter());
			
			
		}
		
		
		// 예약취소 (cookie)
		@RequestMapping("cancelRC.ss")
		public ModelAndView cancelResvC(ModelAndView mv ,HttpServletRequest request , @RequestParam("cancelId") int cancelId , HttpServletResponse response) {
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			
			
			ArrayList<SeatHistory> shList = null;
			Seat seat = new Seat();
			String id = "";
			if(user != null) {
				id = user.getMember_Id();
				seat.setStudent_id(user.getMember_Id());
				seat.setSs_no(cancelId);
			}
			System.out.println("seat " + seat);
			
			int result1 = sService.cancelResv(seat);
			
			int result = 0;
			
			if(result1 > 0) {
				result = sService.resetSeat(cancelId);
			}
			
			if(result > 0) {
				if(user != null) {
					id = user.getMember_Id();
					shList = sService.selectHistoryList(id);				
				}
				user.setRseatNo(0);
				session.setAttribute("loginUser", user);			
			}
			
			if(shList != null) {
				mv.addObject("list" , shList).setViewName("my_studyseatList");
				
				return mv;
			}
			else {
				throw new SeatException("쿠키로 좌석취소 실패 !");
			}
		}
		
		
		
		// ajax로 나의 열람실 사용내역
		@RequestMapping("seatListAjax.ss")
		public void seatListAjax(HttpServletRequest request , HttpServletResponse response) throws JsonIOException, IOException {
			
			response.setContentType("application/json; charset=UTF-8");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			
			String id = "";
			ArrayList<SeatHistory> shList = null;
			
			if(user != null) {
				id = user.getMember_Id();
				shList = sService.selectHistoryList(id);				
			}	
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(shList , response.getWriter());
		}
		
		
		// 좌석 예약 
		@RequestMapping("updateR.ss")
		public void updateResv(@RequestParam("sNo") int sNo , @RequestParam("floor") String floor , HttpServletRequest request ,HttpServletResponse response) throws IOException {
			
			System.out.println("sNo : " + sNo + ", floor : " + floor);
			
			if(floor.equals("")) {
				floor = "A";
			}
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			
			Seat seat = new Seat();
			seat.setSs_no(sNo);
			seat.setSs_floor(floor);
			seat.setCert_code(getCertCode());
			seat.setStudent_id(user.getMember_Id());
			
			System.out.println("resv seat : " + seat);
			
			int result1 = sService.updateResv(seat);
			int result = 0;
			
			if(result1 > 0) {
				result = sService.insertHistory(seat);
			}
			
			if(result > 0) {
				
				Cookie cookie = new Cookie("certTimer" , "CERT_TIMER");
				cookie.setMaxAge(10);
				response.addCookie(cookie);
				
				user.setRseatNo(sNo);
				session.setAttribute("loginUser", user);
				
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
				
				for(Seat s : sList) {
					JSONObject jSeat = new JSONObject();
					
					jSeat.put("no", s.getSs_no());
					jSeat.put("floor", s.getSs_floor());
					jSeat.put("use", s.getSs_use());
					
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
			else {
				throw new SeatException("좌석 예약하기 실패!");
			}
			
			
			
		}
		
		// 예약 시 인증코드 생성
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
		
		
		// 사용자가 열람실을 사용 or 예약 했는지 확인
		@RequestMapping("checkDup.ss")
		@ResponseBody
		public String checkDup(HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			
			User user = (User)session.getAttribute("loginUser");
			String id = "" ;
			int result = -1 ;
			
			if(user == null) {
				result = -1 ;
			}
			else {
				id = user.getMember_Id();
				result = sService.checkDup(id);				
			}
			
			int result1 = sService.checkUsing(id);
			
			if(result1 > 0) {
				result = -2;
			}
			
			if(result == -2) {
				return "using";
			}
			else if(result == -1) {
				return "noUser";
			}
			else if(result == 0) {
				return "notDup";
			}
			else {				
				return "dup";
			} 
			
			
		}
		
		// 현재 사용중인 좌석번호
		@RequestMapping("selectsId.ss")
		@ResponseBody
		public int selectsId(HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			
			User user = (User)session.getAttribute("loginUser");
			String id = "";
			int sId = 0 ;
			SeatHistory sh = null ;
			
			
			if(user != null) {
				id = user.getMember_Id();
				sh = sService.selectsId(id);
			}
			
			if(sh != null) {
				sId = sh.getSeat().getSs_no();
			}
			else {
				sId = 0;
			}
		
			
			System.out.println("sId : " + sId);
			
			return sId;
		}
		
		// 예약 인증코드 체크
		@RequestMapping("checkCode.ss")
		@ResponseBody
		public String checkCode(HttpServletRequest request , @RequestParam("iCode") String iCode , @RequestParam("cId") int cId ,HttpServletResponse response) {
			
			HttpSession session = request.getSession();
			
			User user = (User)session.getAttribute("loginUser");
			Seat seat = new Seat();
			
			if(user != null) {
				seat.setStudent_id(user.getMember_Id());
				seat.setCert_code(iCode);
				seat.setSs_no(cId);
			}
			
			System.out.println("checkseat : " + seat.getCert_code());
			int result1 = sService.checkCode(seat);

			int result = -1 ;
			
			if(result1 > 0) {
				user.setRseatNo(0);
				session.setAttribute("loginUser", user);
				
				// 인증완료 후 인증타이머 죽이기
				Cookie[] cookies = request.getCookies();
				
				if(cookies != null){
					for(Cookie c : cookies){
						System.out.println("쿠키 : " + c.getName());
						if(c.getName().equals("certTimer")){
							c.setMaxAge(0);
							response.addCookie(c);
							System.out.println("인증 되었으니 인증타이머 쿠키 죽이기!");
							break;
						}				
						
					}
				}
				
				// 인증완료 후 퇴실타이머 생성
				Cookie cookie = new Cookie("outTimer" , "OUT_TIMER");
				cookie.setMaxAge(30);
				response.addCookie(cookie);
				
				user.setUseatNo(cId);
				session.setAttribute("loginUser", user);
				
				result = sService.updateHistory(seat);
			}
			
			if(result > 0) {
				return "success";
			}
			else {
				return "fail";
			}			
			
			
			
		}
		
		// 퇴실처리 
		@RequestMapping("outSeat.ss")
		@ResponseBody
		public String outSeat(HttpServletRequest request ,@RequestParam("cId") int cId) {
			
			
			HttpSession session = request.getSession();
			
			User user = (User)session.getAttribute("loginUser");
			Seat seat = new Seat();
			
			if(user != null) {
				seat.setSs_no(cId);
				seat.setStudent_id(user.getMember_Id());
			}
			
			System.out.println("cId :" + cId + ", seat : " + seat);
			
			int result1 = sService.updateSeat(seat);
			int result = -1 ;
			
			if(result1 > 0) {
				result = sService.updateOutHistory(seat);
			}
			
			if(result > 0) {
				return "out";
			}
			else {
				return "fail";
			}
		}
		
		// 쿠키로 퇴실처리
		@RequestMapping("outSeatCoo.ss")
		public ModelAndView outSeatCoo(HttpServletRequest request ,@RequestParam("outNo") int outNo ,ModelAndView mv) {
		
			HttpSession session = request.getSession();
			
			User user = (User)session.getAttribute("loginUser");
			Seat seat = new Seat();
			
			if(user != null) {
				seat.setSs_no(outNo);
				seat.setStudent_id(user.getMember_Id());
			}
			
			System.out.println("outNo :" + outNo + ", seat : " + seat);
			
			int result1 = sService.updateSeat(seat);
			int result = -1 ;
			
			if(result1 > 0) {
				result = sService.updateOutHistory(seat);
			}
			
			String id = "";
			ArrayList<SeatHistory> shList = null;
			
			if(result > 0) {
				if(user != null) {
					id = user.getMember_Id();
					shList = sService.selectHistoryList(id);				
				}
				user.setUseatNo(0);
				session.setAttribute("loginUser", user);
			}
			
			if(shList != null) {
				mv.addObject("list" , shList).setViewName("my_studyseatList");
				
				return mv;
			}
			else {
				throw new SeatException("쿠키로 좌석퇴실 실패 !");
			}
			
			
		}
		
		

}
