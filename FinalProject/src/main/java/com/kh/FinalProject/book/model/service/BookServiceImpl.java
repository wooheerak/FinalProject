package com.kh.FinalProject.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.book.model.dao.BookDao;
import com.kh.FinalProject.book.model.vo.Book;
import com.kh.FinalProject.book.model.vo.BookRent;
import com.kh.FinalProject.book.model.vo.BookRequest;
import com.kh.FinalProject.book.model.vo.BookReservation;
import com.kh.FinalProject.book.model.vo.PageInfo;

@Service("bService")
public class BookServiceImpl implements BookService{

	@Autowired
	private BookDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public int getListCount(Map<String, String> map) {
		return bDao.selectCount(sqlSession,map);
	}


	@Override
	public ArrayList<Book> selectList(Map<String, Object> searchMap) {

		return bDao.selectList(sqlSession , searchMap);
	}


	@Override
	public Book selectBook(int bNo) {

		return bDao.selectBook(sqlSession, bNo);
	}


	@Override
	public int selectAllCount(String bISBN) {
		return bDao.selectAllCount(sqlSession, bISBN);
	}


	@Override
	public int selectYCount(String bISBN) {
		return bDao.selectYCount(sqlSession, bISBN);
	}


	@Override
	public int insertRv(Map<String, Object> map) {
		int result = bDao.insertBv(sqlSession, map);
		
		int updateresult = 0;
		if(result > 0) {
			updateresult =  bDao.updateBookStatus(sqlSession, map);
		}
		return updateresult;
	}


	@Override
	public ArrayList<BookReservation> selectReservationBookList(Map<String, Object> reservationMap) {
		return bDao.selectReservationBookList(sqlSession,reservationMap);
	}


	@Override
	public int getReservationCount(String userId) {
		return bDao.getReservationCount(sqlSession,userId);
	}


	@Override
	public int insertRequest(Map<String, Object> map) {
		return bDao.insertRequest(sqlSession, map);
	}


	@Override
	public ArrayList<BookRequest> selectRequestList(String userId) {
		return bDao.selectRequestList(sqlSession, userId);
	}


	@Override
	public int checkBook() {
		int result = bDao.checkBook(sqlSession);
		int updateBook = 0;
		if(result >= 0) {
			updateBook = bDao.checkBook2(sqlSession);
		}
		
		return updateBook;
	}


	@Override
	public ArrayList<BookRequest> selectRequestList() {
		return bDao.requestBookmasterPage(sqlSession);
	}


	@Override
	public int allowRequest(String bq_no) {
		return bDao.allowRequest(sqlSession, bq_no);
	}


	@Override
	public int rejactRequest(String bq_no) {
		return bDao.rejactRequest(sqlSession, bq_no);
	}


	@Override
	public ArrayList<BookReservation> selectReservationList() {
		return bDao.selectReservationList(sqlSession);
	}


	@Override
	public int cancelRequest(int bq_no) {
		return bDao.cancelRequest(sqlSession, bq_no);
	}


	@Override
	public int updateResv(int bv_no) {
		return bDao.updateResv(sqlSession, bv_no);
	}


	@Override
	public int updateBk(int b_no) {
		return bDao.updateBk(sqlSession, b_no);
	}


	@Override
	public int updateRAllow(int bv_no) {
		return bDao.updateRAllow(sqlSession, bv_no);
	}


	@Override
	public int updqteBAllow(int b_no) {
		return bDao.updateBAllow(sqlSession, b_no);
	}


	@Override
	public int insertRent(HashMap<String, Object> map) {
		return bDao.insertRent(sqlSession, map);
	}


	@Override
	public ArrayList<BookRent> selectborrowBkList(String userId) {
		return bDao.selectborrowBkList(sqlSession, userId);
	}


	@Override
	public int updateExtension(Map<String, Object> map) {
		return bDao.updateExtension(sqlSession, map);
	}


	@Override
	public int returnRentBook(int br_no) {
		return bDao.returnRentBook(sqlSession, br_no);
	}


	@Override
	public int returnBook(int b_no) {
		return bDao.returnBook(sqlSession, b_no);
	}


	@Override
	public ArrayList<BookRent> loanBookList() {
		return bDao.loanBookList(sqlSession);
	}


	@Override
	public ArrayList<Book> selectBkListM() {
		return bDao.selectBkListM(sqlSession);
	}


	@Override
	public int insertBk(Book bk) {
		return bDao.insertBk(sqlSession, bk);
	}


	@Override
	public int updateNBook(Book bk) {
		return bDao.updateNBook(sqlSession, bk);
	}


	@Override
	public int deleteBook(int bNo) {
		return bDao.deleteBook(sqlSession, bNo);
	}


	@Override
	public ArrayList<Book> selectTopList() {
		return bDao.selectTopList(sqlSession);
	}


	@Override
	public Book selectBookIndex(String bNo) {
		return bDao.selectBookIndex(sqlSession, bNo);
	}


	@Override
	public ArrayList<BookRent> checkExpire(String userId) {
		return bDao.checkExpire(sqlSession , userId);
	}


	@Override
	public int updateMsg(Map<String, Object> map) {
		return bDao.updateMsg(sqlSession , map);
	}


	
	
}
