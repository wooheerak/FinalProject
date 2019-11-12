package com.kh.FinalProject.book.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.book.model.dao.BookDao;
import com.kh.FinalProject.book.model.vo.Book;
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

	
	
}
