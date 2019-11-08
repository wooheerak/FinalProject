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

	
	
}
