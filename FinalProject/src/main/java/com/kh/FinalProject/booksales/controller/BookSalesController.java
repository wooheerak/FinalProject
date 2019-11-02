package com.kh.FinalProject.booksales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookSalesController {
	
	@RequestMapping("booksales.bs")
	public String bookSales() {
		return "booksales";
	}
	
	@RequestMapping("booksalesdetail.bs")
	public String bookSalesDetail() {
		return "booksales_detail";
	}
}
