package com.kh.FinalProject.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("notice.no")
	public String notice() {
		return "noticeList";
	}
	
	@RequestMapping("noticedetail.no")
	public String noticeDetail() {
		return "noticeListDetail";
	}
}
