package com.kh.FinalProject.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.FinalProject.book.model.vo.Book;
import com.kh.FinalProject.book.model.vo.BookRent;
import com.kh.FinalProject.book.model.vo.BookRequest;
import com.kh.FinalProject.book.model.vo.BookReservation;
import com.kh.FinalProject.book.model.vo.PageInfo;

public interface BookService {


	int getListCount(Map<String, String> map);

	ArrayList<Book> selectList(Map<String, Object> searchMap);

	Book selectBook(int bNo);

	int selectAllCount(String bISBN);

	int selectYCount(String bISBN);

	int insertRv(Map<String, Object> map);

	ArrayList<BookReservation> selectReservationBookList(Map<String, Object> reservationMap);

	int getReservationCount(String userId);

	int insertRequest(Map<String, Object> map);

	ArrayList<BookRequest> selectRequestList(String userId);

	int checkBook();

	ArrayList<BookRequest> selectRequestList();

	int allowRequest(String bq_no);

	int rejactRequest(String bq_no);

	ArrayList<BookReservation> selectReservationList();

	int cancelRequest(int bq_no);

	int updateResv(int bv_no);

	int updateBk(int b_no);

	int updateRAllow(int bv_no);

	int updqteBAllow(int b_no);

	int insertRent(HashMap<String, Object> map);

	ArrayList<BookRent> selectborrowBkList(String userId);

	int updateExtension(Map<String, Object> map);

	int returnRentBook(int br_no);

	int returnBook(int b_no);

	ArrayList<BookRent> loanBookList();

	ArrayList<Book> selectBkListM();

	int insertBk(Book bk);

	int updateNBook(Book bk);

	int deleteBook(int bNo);

}
