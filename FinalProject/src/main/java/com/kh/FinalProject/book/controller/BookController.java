package com.kh.FinalProject.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

	@RequestMapping("selectList.bk")
	public String selectBookList() {
		return "bookListView";
	}

	
	////// 테스트용
}
