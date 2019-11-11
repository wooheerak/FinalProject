package com.kh.FinalProject.booksales.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FinalProject.booksales.model.exception.BSException;
import com.kh.FinalProject.booksales.model.service.BsService;
import com.kh.FinalProject.booksales.model.vo.BookReg;



@Controller
public class BookSalesController {

	@Autowired
	private BsService bsService;

	// 중고서적 리스트
	@RequestMapping("bslist.bs")
	public ModelAndView bsList(ModelAndView mv) {

		ArrayList<BookReg> list = bsService.selectList();

		if (list != null) {

			mv.addObject("list", list);
			mv.setViewName("bsList");
		} else {
			throw new BSException("중고서적 조회 실패");
		}

		return mv;

	}

/*	@RequestMapping("booksalesdetail.bs")
	public String bookSalesDetail() {
		return "booksales_detail";
	}*/
}
