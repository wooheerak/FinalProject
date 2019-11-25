package com.kh.FinalProject.book.controller;

import java.io.File;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FinalProject.book.model.exception.BookException;
import com.kh.FinalProject.book.model.service.BookService;
import com.kh.FinalProject.book.model.vo.Book;
import com.kh.FinalProject.book.model.vo.BookRent;
import com.kh.FinalProject.book.model.vo.BookRequest;
import com.kh.FinalProject.book.model.vo.BookReservation;
import com.kh.FinalProject.book.model.vo.PageInfo;
import com.kh.FinalProject.booksales.model.exception.BSException;
import com.kh.FinalProject.booksales.model.vo.BookReg;
import com.kh.FinalProject.common.Pagination;
import com.kh.FinalProject.studyroom_board.model.exception.BoardException;
import com.kh.FinalProject.user.model.vo.User;

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
	
	@RequestMapping("reservationBookView.bk")
	public ModelAndView reservationBookView(@RequestParam(value = "page", required = false) Integer page,
											ModelAndView mv,
											HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		String userId = user.getMember_Id();
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = bService.getReservationCount(userId);
		System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		  
		Map<String,Object> reservationMap = new HashMap<>(); 
		reservationMap.put("pi", pi);
		reservationMap.put("userId",userId);
		
		
		ArrayList<BookReservation> list = bService.selectReservationBookList(reservationMap);

	
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("reservationBookView");
		
		return mv;
	}

//	location.href='이동주소';
	@RequestMapping("reservationBook.bk")
	public String reservationBook(@RequestParam("bookNo") int bookNo,
								@RequestParam("bookWriter") String bookWriter,
								HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String userId = ((User)session.getAttribute("loginUser")).getMember_Id();
		Map<String, Object> map = new HashMap<>();
		map.put("bookNo", bookNo);
		map.put("bookWriter", bookWriter);
		map.put("userId", userId);
		
		int insertresult = bService.insertRv(map);
		if(insertresult > 0) {
			return "redirect: reservationBookView.bk";
		} else {
			throw new BookException("도서 예약 실패");
		}
	}

	@RequestMapping("selectList.bk")
	public ModelAndView boardList(@RequestParam(value = "page", required = false) Integer page,
								  @RequestParam(value = "searchOption", required = false) String searchOption, 
								  @RequestParam(value = "search", required = false) String search, 
								  ModelAndView mv) {

		Map<String, String> map = new HashMap<>();

		map.put("searchOption", searchOption);
		map.put("search", search);

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
		}
		
		return mv;
	}	
	
	@RequestMapping("insertRequest.bk")
	public String insertBookRequest(@RequestParam("name") String name,
									@RequestParam("writer") String writer,
									@RequestParam("publisher") String publisher,
									@RequestParam("price") int price,
									@RequestParam("isbn") String isbn,
									@RequestParam("message") String message,
									HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = ((User)session.getAttribute("loginUser")).getMember_Id();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("writer", writer);
		map.put("publisher", publisher);
		map.put("price", price);
		map.put("isbn", isbn);
		map.put("message", message);
		map.put("userId", userId);
		
		int result = bService.insertRequest(map);
		
		if(result > 0) {
			return "redirect: selectRequestBook.bk";
		} else {
			throw new BookException("도서신청 실패");
		}

	}
	
	@RequestMapping("selectRequestBook.bk")
	public ModelAndView selectRequestBook(ModelAndView mv,
											HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = ((User)session.getAttribute("loginUser")).getMember_Id();
		
		ArrayList<BookRequest> list = bService.selectRequestList(userId);
		
		mv.addObject("list", list);
		mv.setViewName("requestBookListView");
		
		return mv;
	}
	
	@RequestMapping("checkBook.bk")
	@ResponseBody
	public String checkBook(HttpServletRequest req) {
		int result = bService.checkBook();
		
		if(result >= 0) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping("masterPage.bk")
	public String masterPage() {
		return "masterPage";
	}
	
	@RequestMapping("requestBookMaster.bk")
	public ModelAndView requestBookMaster(ModelAndView mv) {
		
		ArrayList<BookRequest> list = bService.selectRequestList();
		
		mv.addObject("list", list);
		mv.setViewName("requestBookmasterPage");
		
		return mv;
	}
	
	// 신청도서 수락기능
	@RequestMapping("allowRequset.bk")
	public String allowRequest(@RequestParam("BQ_NO") String bq_no) {
		
		int result = bService.allowRequest(bq_no);
		
		if(result > 0) {
			return "redirect: requestBookMaster.bk";
		} else {
			throw new BookException("신청도서 수락 실패");
		}
		
	}
	
	// 신청도서 거절기능
	@RequestMapping("rejactRequset.bk")
	public String rejactRequest(@RequestParam("BQ_NO") String bq_no) {
		
		int result = bService.rejactRequest(bq_no);
		
		if(result > 0) {
			return "redirect: requestBookMaster.bk";
		} else {
			throw new BookException("신청도서 거절 실패");
		}
		
	}	
	
	// 대출 예약 리스트
	@RequestMapping("reservationBookMaster.bk")
	public ModelAndView reservationBookMaster(ModelAndView mv) {
		
		ArrayList<BookReservation> list = bService.selectReservationList();
		mv.addObject("list", list);
		mv.setViewName("reservationBookmasterPage");
		
		System.out.println("list1" + list);
		return mv;
	}
	
	@RequestMapping("cancelRequset.bk")
	public String cancelRequset(@RequestParam("BQ_NO") int bq_no) {
		
		
		int result = bService.cancelRequest(bq_no);
		
		return "redirect: selectRequestBook.bk";
	}
	
	@RequestMapping("cancelReservation.bk")
	public String cancelReservation(@RequestParam("bv_no") int bv_no,
									@RequestParam("b_no") int b_no) {
	
		// book_reservation update
		int reservationResult = bService.updateResv(bv_no);
		int bookResult = -1;
		
		if(reservationResult > 0) {
			// book update
			bookResult = bService.updateBk(b_no);
		}
		
		if(bookResult > 0) {
			return "redirect: reservationBookView.bk";
		} else {
			throw new BookException("예약 취소 실패");
		}
		
	}
	
	
	 @RequestMapping("allowReservation.bk") 
	 public String allowReservation(@RequestParam("bv_no") int bv_no,
									@RequestParam("b_no") int b_no ,
									@RequestParam("user_id") String userId,
									HttpServletRequest request) {
		 
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("loginUser");

		 HashMap<String, Object> map = new HashMap<>();
		 
		 
		 int result1 = bService.updateRAllow(bv_no);
		 int result2 = -1;
		 int result = -1 ; 
		 
		 if(result1 > 0 ) {
			 result2 = bService.updqteBAllow(b_no);
		 } 
		 
		 if(result2 > 0) {
			 map.put("b_no", b_no);
			 map.put("userId", userId);
			 result = bService.insertRent(map);
		 }
		 if(result > 0 ) {
			 return "redirect: reservationBookMaster.bk";
		 } else { 
			 throw new BookException("예약수락 실패");
		 }
		 
		 
	 }
	 
	 // 도서 대출 목록 가져오기
	 @RequestMapping("borrowBookList.bk")
	 public ModelAndView borrowBookList(ModelAndView mv,
			 								HttpServletRequest request){
		 
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("loginUser");
		 String userId = user.getMember_Id();
		 
		 ArrayList<BookRent> list = bService.selectborrowBkList(userId);
		 mv.addObject("list",list);
		 mv.setViewName("borrowBookList");
		 
		 
		 return mv;
	 }
	 
	 // 대출도서 연장하기 & 상태변경
	 @RequestMapping("extensionBook.bk")
	 public String extensionBook(@RequestParam("br_no") int br_no) {
		 
		 Map<String,Object> map = new HashMap<>();
		 map.put("br_no", br_no);
		 int result = bService.updateExtension(map);
		 
		 if(result > 0) {
			 
			 return "redirect: borrowBookList.bk";
		 } else {
			 throw new BookException("도서 연장 실패");
		 }
	 }
	 
	 @RequestMapping("returnBook.bk")
	 public String returnBook(@RequestParam("br_no") int br_no,
			 					@RequestParam("b_no") int b_no) {
		 
		 int result1 = bService.returnRentBook(br_no);
		 int result2 = -1;
		 
		 if(result1 > 0) {
			 result2 = bService.returnBook(b_no);
		 }
		 
		 if(result2 > 0) {
			 return "redirect: borrowBookList.bk";
		 } else { 
			 throw new BookException("도서 반납 실패");
		 }
	 }
	 
	 @RequestMapping("loanBookMaster.bk")
	 public ModelAndView loanBookList(ModelAndView mv) {
		 
		 ArrayList<BookRent> list = bService.loanBookList();
		 mv.addObject("list", list);
		 mv.setViewName("loanBookmasterPage");
		 
		 return mv;
		 
	 }
	 
	 // 도서 전체 조회(관리자)
	 @RequestMapping("bookManagement.bk")
	 public ModelAndView selectBkListM(ModelAndView mv) {
		 
		 ArrayList<Book> list = bService.selectBkListM();
		 
		 mv.addObject("list", list);
		 mv.setViewName("bookManagementmasterPage");
		 
		 return mv;
	 }
	 
	 @RequestMapping("insertBook.bk") 
	 public String insertBook() {
		 
		 return "bookInsertView";
	 }
	 
	// 중고서적 등록
	@RequestMapping("insertNBook.bk")
	public String insertBk(@ModelAttribute Book bk, 
						   @RequestParam("uploadFile") MultipartFile uploadFile,
						   HttpServletRequest request) {
		if (uploadFile != null && !uploadFile.isEmpty()) {

			String renameFileName = saveFile(uploadFile, request);

			if (renameFileName != null) {
				bk.setbIMG(renameFileName);
			}

		}

		int result = bService.insertBk(bk);

		if (result > 0) {
			return "redirect:bookManagement.bk";
		} else {
			throw new BookException("중고서적 등록 실패");
		}
	}
	 
	// 파일저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로 설정 : 작은 resources 불러오기
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\BOOK_IMG";    // \를 하나만 하면 인지를 못한다
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
								+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return renameFileName;
	}	 
	
	@RequestMapping("bookDetailViewMaster.bk")
	public ModelAndView bookDetailMaster(@RequestParam("bno") int bNo,
										@RequestParam("isbn") String bISBN,
										ModelAndView mv) {
		
		Book book = bService.selectBook(bNo);
		
		int bCount = bService.selectAllCount(bISBN);
		
		int bYCount = bService.selectYCount(bISBN);
		
		if(book != null) {
			mv.addObject("book", book)
			.addObject("allCount", bCount)
			.addObject("yCount", bYCount)
			.setViewName("bookDetailViewmasterPage");
		}
		
		return mv;
	}
	
	@RequestMapping("bookDetailUpdate.bk")
	public ModelAndView bookDetailUpdate(ModelAndView mv,
										@RequestParam("bNo") int bNo) {
		
		Book book = bService.selectBook(bNo);
		
		mv.addObject("book", book);
		mv.setViewName("bookUpdateDetailView");
		
		return mv;
		
	}
	
	@RequestMapping("updateNBook.bk")
	public ModelAndView updateNBook(ModelAndView mv,
									@ModelAttribute Book bk,
									@RequestParam("uploadFile") MultipartFile uploadFile,
									HttpServletRequest request,
									@RequestParam("bNo") int bNo) {

		if(uploadFile != null && !uploadFile.isEmpty()) {

			String renameFileName = saveFile(uploadFile, request);

			if (renameFileName != null) {
				bk.setbIMG(renameFileName);
			}
		}
		
		int result = bService.updateNBook(bk);
		
		if(result > 0) {
			Book book = bService.selectBook(bNo);
			
			String bISBN = bk.getbISBN();
			int bCount = bService.selectAllCount(bISBN);
			int bYCount = bService.selectYCount(bISBN);
			
			mv.addObject("book", book);
			mv.addObject("bCount", bCount);
			mv.addObject("bYCount", bYCount);
			mv.setViewName("bookDetailViewmasterPage");
			
			return mv;
		} else {
			throw new BookException("도서 수정 실패");
		}
		
	}
	
	//도서 삭제
	@RequestMapping("deleteBook.bk")
	public String deleteBook(@RequestParam("bNo") int bNo) {
		
		int result = bService.deleteBook(bNo);
		
		if(result > 0) {
			return "redirect: bookManagement.bk";
		} else { 
			throw new BookException("도서 삭제 실패");
		}
		
	}
	 
	 
}
