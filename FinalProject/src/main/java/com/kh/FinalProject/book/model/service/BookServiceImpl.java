package com.kh.FinalProject.book.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.book.model.dao.BookDao;
import com.kh.FinalProject.book.model.vo.Book;
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
		return bDao.checkBook(sqlSession);
	}


	@Override
	public ArrayList<BookRequest> selectRequestList() {
		return bDao.requestBookmasterPage(sqlSession);
	}


	
	
}
