package com.kh.FinalProject.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.book.model.vo.Book;
import com.kh.FinalProject.book.model.vo.BookRent;
import com.kh.FinalProject.book.model.vo.BookRequest;
import com.kh.FinalProject.book.model.vo.BookReservation;
import com.kh.FinalProject.book.model.vo.PageInfo;

@Repository("bDao")
public class BookDao {	

	public int selectCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("bookMapper.selectCount",map);
	}

	public ArrayList<Book> selectList(SqlSessionTemplate sqlSession, Map<String, Object> searchMap) {
		PageInfo pi = (PageInfo)searchMap.get("pi");
		
		int offset = (pi.getCurrentPage() -1) * pi.getBookLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBookLimit());
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectList", searchMap, rowBounds);
	}

	public Book selectBook(SqlSessionTemplate sqlSession, int bNo) {
		
		return sqlSession.selectOne("bookMapper.selectBook", bNo);
	}

	public int selectAllCount(SqlSessionTemplate sqlSession, String bISBN) {
		return sqlSession.selectOne("bookMapper.selectAllCount", bISBN);
	}

	public int selectYCount(SqlSessionTemplate sqlSession, String bISBN) {
		return sqlSession.selectOne("bookMapper.selectYCount", bISBN);
	}

	public int insertBv(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.insert("bookMapper.insertBv", map);
	}

	public int updateBookStatus(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("bookMapper.updateBS", map);
	}

	public ArrayList<BookReservation> selectReservationBookList(SqlSessionTemplate sqlSession, Map<String, Object> reservationMap) {
		PageInfo pi = (PageInfo)reservationMap.get("pi");
		
		int offset = (pi.getCurrentPage() -1) * pi.getBookLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBookLimit());
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectReservationBookList", reservationMap, rowBounds);
	}

	public int getReservationCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("bookMapper.selectReservationCount", userId);
	}

	public int insertRequest(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("bookMapper.insertRequest", map);
	}

	public ArrayList<BookRequest> selectRequestList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("bookMapper.selectRequestList", userId);
	}

	public int checkBook(SqlSessionTemplate sqlSession) {
		return sqlSession.update("bookMapper.checkBook");
	}

	public ArrayList<BookRequest> requestBookmasterPage(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bookMapper.requestBookListmaster");
	}

	public int allowRequest(SqlSessionTemplate sqlSession, String bq_no) {
		return sqlSession.update("bookMapper.allowRequest", bq_no);
	}

	public int rejactRequest(SqlSessionTemplate sqlSession, String bq_no) {
		return sqlSession.update("bookMapper.rejactRequest", bq_no);
	}

	public ArrayList<BookReservation> selectReservationList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bookMapper.reservationBookListmaster");
	}

	public int cancelRequest(SqlSessionTemplate sqlSession, int bq_no) {
		return sqlSession.update("bookMapper.cancelRequest", bq_no);
	}

	public int updateResv(SqlSessionTemplate sqlSession, int bv_no) {
		return sqlSession.update("bookMapper.updateResvCancel", bv_no);
	}

	public int updateBk(SqlSessionTemplate sqlSession, int b_no) {
		return sqlSession.update("bookMapper.updateBkCancel", b_no);
	}

	public int updateRAllow(SqlSessionTemplate sqlSession, int bv_no) {
		return sqlSession.update("bookMapper.updateRAllow", bv_no);
	}

	public int updateBAllow(SqlSessionTemplate sqlSession, int b_no) {
		return sqlSession.update("bookMapper.updateBAllow", b_no);
	}

	public int insertRent(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("bookMapper.insertRent", map);
	}

	public ArrayList<BookRent> selectborrowBkList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("bookMapper.selectborrowBkList", userId);
	}

	public int updateExtension(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("bookMapper.updateExtension", map);
	}

	public int checkBook2(SqlSessionTemplate sqlSession) {
		return sqlSession.update("bookMapper.checkBook2");
	}

	public int returnRentBook(SqlSessionTemplate sqlSession, int br_no) {
		return sqlSession.update("bookMapper.updateRentBook",br_no);
	}

	public int returnBook(SqlSessionTemplate sqlSession, int b_no) {
		return sqlSession.update("bookMapper.updateBookY", b_no);
	}

	public ArrayList<BookRent> loanBookList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bookMapper.loanBookList");
	}

	public ArrayList<Book> selectBkListM(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bookMapper.selectBkListM");
	}

	public int insertBk(SqlSessionTemplate sqlSession, Book bk) {
		return sqlSession.insert("bookMapper.insertBk", bk);
	}

	public int updateNBook(SqlSessionTemplate sqlSession, Book bk) {
		return sqlSession.update("bookMapper.updateNB", bk);
	}

	public int deleteBook(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("bookMapper.deleteBook", bNo);
	}
	
	
}
