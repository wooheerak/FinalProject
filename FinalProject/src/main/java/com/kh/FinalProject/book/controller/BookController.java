package com.kh.FinalProject.book.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FinalProject.book.model.service.BookService;
import com.kh.FinalProject.book.model.vo.Book;
import com.kh.FinalProject.book.model.vo.PageInfo;
import com.kh.FinalProject.common.Pagination;
import com.kh.FinalProject.studyroom_board.model.exception.BoardException;

@Controller
public class BookController {

	@Autowired
	private BookService bService;

	@RequestMapping("selectListNone.bk")
	public ModelAndView selectBookList(ModelAndView mv) {

		ArrayList<Book> list = new ArrayList<>();
		mv.addObject("list", list);
		mv.setViewName("bookListView");
		return mv;
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

		return "reservationBookView";
	}

	@RequestMapping("selectList.bk")
	public ModelAndView boardList(@RequestParam(value = "page", required = false) Integer page,
								  @RequestParam(value = "searchOption", required = false) String searchOption, 
								  @RequestParam(value = "search", required = false) String search, 
								  ModelAndView mv) {

		System.out.println("searchOption : " + searchOption + ", searchbar : " + search);
		Map<String, String> map = new HashMap<>();

		map.put("searchOption", searchOption);
		map.put("search", search);

		System.out.println("컨트롤러 controller : " + map.get("searchOption"));

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = bService.getListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		  
		Map<String,Object> searchMap = new HashMap<>(); 
		searchMap.put("pi", pi);
		searchMap.put("search", search); 
		searchMap.put("searchOption" ,searchOption);
		  
		  
		ArrayList<Book> list = bService.selectList(searchMap); 
		  
		if(list != null) {
			mv.addObject("list",list); 
			mv.addObject("pi", pi);
			mv.addObject("search", search);
			mv.addObject("searchOption", searchOption);
			mv.setViewName("bookListView"); 
		} else { 
			  throw new BoardException("도서 조회에 실패하였습니다");
		}
		 

		return mv;
	}
	
	@RequestMapping("bookdetail.bk")
	public ModelAndView boardDetail(@RequestParam("bNo") int bNo,
									@RequestParam("page") int page,
									ModelAndView mv) {
		
		Book book = bService.selectBook(bNo);
		
		String bISBN = book.getbISBN();
		
		int bCount = bService.selectAllCount(bISBN);
		
		int bYCount = bService.selectYCount(bISBN);
		
		if(book != null) {
			mv.addObject("book", book)
			.addObject("page", page)
			.addObject("allCount", bCount)
			.addObject("yCount", bYCount)
			.setViewName("bookDetailView");
		} else {
			throw new BoardException("상세 게시글 불러오기 실패");
		}
		
		return mv;
	}	
}
