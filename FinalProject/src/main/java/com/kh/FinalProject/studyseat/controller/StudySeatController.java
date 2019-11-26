package com.kh.FinalProject.studyseat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.kh.FinalProject.studyseat.model.vo.CookieIs;
import com.kh.FinalProject.studyseat.model.vo.Seat;
import com.kh.FinalProject.studyseat.model.vo.SeatHistory;
import com.kh.FinalProject.user.model.vo.User;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
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
				
			}
			else {
				mv.addObject("message", "로그인 후 이용해주세요!").setViewName("../common/errorPage");
			}	
			
			return mv;
			
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
			
			int result1 = sService.cancelResv(seat);
			
			int result = 0;
			int result2 = 0;
			
			if(result1 > 0) {
				result2 = sService.resetSeat(cancelId);
			}
			
			
			if(result2 > 0) {
				
				// 예약취소 후 인증타이머 죽이기
				Cookie[] cookies = request.getCookies();
				
				if(cookies != null){
					for(Cookie c : cookies){
						if(c.getName().equals("certTimer" + user.getMember_Id())){
							c.setMaxAge(0);
							response.addCookie(c);
							break;
						}				
						
					}
				}
				
				user.setcStatus("No");
				user.setRseatNo(0);
				user.setsNo(0);
				session.setAttribute("loginUser", user);
				
				result = sService.updateUser(user);
				
				if(result <= 0) {
					throw new SeatException("멤버 sNo , cStatus 수정 실패 !");
				}
				
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
		public String cancelResvC(HttpServletRequest request , @RequestParam("cancelId") int cancelId , HttpServletResponse response) {
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			
			
			Seat seat = new Seat();
			
			if(user != null) {
				seat.setStudent_id(user.getMember_Id());
				seat.setSs_no(cancelId);
			}
			
			int result1 = sService.cancelResv(seat);
			
			int result2 = 0;
			int result = 0;
			
			if(result1 > 0) {
				result2 = sService.resetSeat(cancelId);
			}
			
			if(result2 > 0) {
							
				user.setRseatNo(0);
				user.setcStatus("No");
				user.setsNo(0);
				session.setAttribute("loginUser", user);
				
				result = sService.updateUser(user);
				
			}
			
			if(result > 0) {
				return "redirect:myseatList.ss";
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
			
			System.out.println(sNo + "번 인증코드 : " + seat.getCert_code() );
			int result1 = sService.updateResv(seat);
			int result = 0;
			int result2 = 0;
			
			if(result1 > 0) {
				result = sService.insertHistory(seat);
			}
			
			if(result > 0) {
				
				// 문자 전송 
				
				sendMsg(seat,request);
				
				Cookie cookie = new Cookie("certTimer" + user.getMember_Id() , "certTimer");
				// 인증타이머 시간 설정
				cookie.setMaxAge(20);
				response.addCookie(cookie);
				
				user.setcStatus("cert");
				user.setRseatNo(sNo);
				user.setsNo(sNo);
				session.setAttribute("loginUser", user);
				
				result2 = sService.updateUser(user);
				
				if(result2 <= 0) {
					throw new SeatException("멤버 sNo , cStatus 수정 실패 !");
				}
				
				// A , B , C 열람실의 좌석을 먼저 가져옴
				ArrayList<Integer> countList = sService.countSeat();
				
				JSONArray countArr = new JSONArray();
				
				for(int i : countList) {
					JSONObject jCount = new JSONObject();
					
					jCount.put("count", i);
					countArr.add(jCount);
				}
				
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
		
		
		// 예약 인증코드 문자 전송
		public void sendMsg(Seat seat ,  HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");  
			 
			String api_key = "NCSU4SUSDGQAJ4NB";
		    String api_secret = "ONIC8SHR7QB2KI4C3JX1WLI35BXGX5NJ";
		    Message coolsms = new Message(api_key, api_secret);
		    
		    String msg = "";
		    String phone = "";
		    
		    if(user != null) {
		    	phone = user.getPhone();
		    	msg += user.getMember_Name() + "님의 " + seat.getSs_floor() + "열람실 " + seat.getSs_no() + "번 좌석 \n";
		    	msg += "인증코드는 '" + seat.getCert_code() + "' 입니다. \n";
		    	msg += "15분 내로 예약인증바랍니다. \t\n -KH대학교 도서관-";		    			
		    }
		    
		    //System.out.println("phone : " + phone + ", msg : " + msg);
		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", phone); // 수신번호
		    params.put("from", "01072111601"); // 발신번호
		    params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
		    params.put("text", msg); // 문자내용    
		    params.put("app_version", "JAVA SDK v1.2"); // application name and version
		    params.put("charset", "utf-8");
		    
		    // Optional parameters for your own needs
		    // params.put("delay", "10"); // 0~20사이의 값으로 전송지연 시간을 줄 수 있습니다.
		    // params.put("country", "KR"); // Korea(KR) Japan(JP) America(USA) China(CN) Default is Korea
		    // params.put("datetime", "20140106153000"); // Format must be(YYYYMMDDHHMISS) 2014 01 06 15 30 00 (2014 Jan 06th 3pm 30 00)
		    // params.put("mid", "mymsgid01"); // set message id. Server creates automatically if empty
		    // params.put("gid", "mymsg_group_id01"); // set group id. Server creates automatically if empty
		    // params.put("subject", "Message Title"); // set msg title for LMS and MMS
		    // params.put("charset", "euckr"); // For Korean language, set euckr or utf-8

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		    
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
			
			int result1 = sService.checkCode(seat);

			int result = -1 ;
			int result2 = 0;
			
			if(result1 > 0) {
				
				// 인증완료 후 인증타이머 죽이기
				Cookie[] cookies = request.getCookies();
				
				if(cookies != null){
					for(Cookie c : cookies){
						System.out.println("쿠키 : " + c.getName());
						if(c.getName().equals("certTimer" + user.getMember_Id())){
							c.setMaxAge(0);
							response.addCookie(c);
							System.out.println("인증 되었으니 "+ user.getMember_Id() +"의 인증타이머 쿠키 죽이기!");
							break;
						}				
						
					}
				}
				
				user.setRseatNo(0);
				user.setcStatus(null);
				session.setAttribute("loginUser", user);
				
				// 인증완료 후 퇴실타이머 생성
				Cookie cookie = new Cookie("outTimer"+user.getMember_Id() , "outTimer");
				// 퇴실타이머 시간 설정
				cookie.setMaxAge(20);
				response.addCookie(cookie);
				
				user.setcStatus("out");
				user.setUseatNo(cId);
				user.setsNo(cId);
				session.setAttribute("loginUser", user);
				
				result2 = sService.updateUser(user);
				
				if(result2 > 0) {
					// 사용자 이용내역 업데이트
					result = sService.updateHistory(seat);
				}
				else {
					throw new SeatException("멤버 sNo , cStatus 수정 실패 !");
				}
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
		public String outSeat(HttpServletRequest request ,@RequestParam("cId") int cId , HttpServletResponse response) {
			
			
			HttpSession session = request.getSession();
			
			User user = (User)session.getAttribute("loginUser");
			Seat seat = new Seat();
			
			if(user != null) {
				seat.setSs_no(cId);
				seat.setStudent_id(user.getMember_Id());
			}
			
			
			int result1 = sService.updateSeat(seat);
			int result = -1 ;
			int result2 = 0 ;
			
			if(result1 > 0) {
				result = sService.updateOutHistory(seat);
				
				// 퇴실완료 후 퇴실타이머 죽이기
				Cookie[] cookies = request.getCookies();
				
				if(cookies != null){
					for(Cookie c : cookies){
						if(c.getName().equals("outTimer" + user.getMember_Id())){
							c.setMaxAge(0);
							response.addCookie(c);
							System.out.println("퇴실 되었으니 "  + user.getMember_Id() +"의 퇴실타이머 쿠키 죽이기!");
							break;
						}				
						
					}
				}
				
				user.setcStatus("No");
				user.setUseatNo(0);
				user.setsNo(0);
				session.setAttribute("loginUser", user);
				
				result2 = sService.updateUser(user);
				
				if(result2 <= 0) {
					throw new SeatException("멤버 sNo , cStatus 수정 실패 !");
				}
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
		public String outSeatCoo(HttpServletRequest request ,@RequestParam("outNo") int outNo ) {
		
			System.out.println("쿠키퇴실");
			HttpSession session = request.getSession();
			
			User user = (User)session.getAttribute("loginUser");
			Seat seat = new Seat();
			
			if(user != null) {
				seat.setSs_no(outNo);
				seat.setStudent_id(user.getMember_Id());
			}
			
			int result1 = sService.updateSeat(seat);
			int result = 0 ;
			int result2 = 0;
			
			if(result1 > 0) {
				result2 = sService.updateOutHistory(seat);
			}
			
			
			if(result2 > 0) {
				
				user.setcStatus("No");
				user.setUseatNo(0);
				user.setsNo(0);
				session.setAttribute("loginUser", user);
				
				result = sService.updateUser(user);
				
			}
			
			if(result > 0 ) {
				return "redirect:myseatList.ss";
			}
			else {
				throw new SeatException("쿠키로 좌석퇴실 실패 !");
			}
			
			
		}
		
		// 쿠키 생존 확인 
		@RequestMapping("checkCookie.ss")		
		public void checkCoookie(HttpServletRequest request , HttpServletResponse response) throws JsonIOException, IOException {
			
			response.setContentType("application/json; charset=UTF-8");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			CookieIs ci = new CookieIs();
			
			int sNo = 0;
			
			Cookie[] cookies = request.getCookies();
			
			if(user != null) {
				if(user.getRseatNo() != 0) {
					sNo = user.getRseatNo();
				}
				else if(user.getUseatNo() != 0) {
					sNo = user.getUseatNo();
				}
				if(cookies != null) {
					for(Cookie c : cookies) {
						if(!c.getName().equals("JSESSIONID")) {
							System.out.println("살아있는 쿠키 : " + c.getName());
						}
						if(c.getName().equals("certTimer" + user.getMember_Id())) {
								user.setcStatus("cert");
								ci.setcName("cert");							
						}
						else if(c.getName().equals("outTimer"  + user.getMember_Id() )) {
								user.setcStatus("out");
								ci.setcName("out");							
						}
						else {
							ci.setcName("No");							
						}
					}
					
				}
				ci.setsNo(user.getsNo());
				ci.setcStatus(user.getcStatus());
			}
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(ci , response.getWriter());
			
			
		}
		
		@RequestMapping("cSeat.ss")
		public void countSeat(HttpServletResponse response) throws JsonIOException, IOException {
			
			response.setContentType("application/json; charset=UTF-8");
			
			ArrayList<Integer> cList = sService.countSeat();
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(cList , response.getWriter());
			
			
		}
		

}
