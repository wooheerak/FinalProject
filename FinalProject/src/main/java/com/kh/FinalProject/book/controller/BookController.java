package com.kh.FinalProject.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

	@RequestMapping("selectList.bk")
	public String selectBookList() {
		return "bookListView";
	}

	@RequestMapping("detailView.bk")
	public String detailView() {
		return "bookDetailView";
	}
	
	@RequestMapping("requestBook.bk")
	public String requestBook() {
		return "requestBookView";
	}
//	location.href='이동주소';
	@RequestMapping("reservationBook.bk")
	public String reservationBook() {
		
		return "bookListView";
	}
}
