package com.kh.FinalProject.studyseat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudySeatController {

		@RequestMapping("seatList.ss")
		public String selectSeatList() {
			
			return "studyseatView";
		}
		
		@RequestMapping("myseatList.ss")
		public String mySeatList() {
			
			return "my_studyseatList";
		}
		
		@RequestMapping("studymain.ss")
		public String studyMain() {
			return "studyMain";
		}
		
		
}
