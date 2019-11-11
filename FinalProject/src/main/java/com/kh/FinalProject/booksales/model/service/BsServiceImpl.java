package com.kh.FinalProject.booksales.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.booksales.model.dao.BsDAO;
import com.kh.FinalProject.booksales.model.vo.BookReg;

@Service("bsService")
public class BsServiceImpl implements BsService{

	@Autowired
	private BsDAO bsDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 중고서적 리스트
	public ArrayList<BookReg> selectList(){
		return bsDAO.selectList(sqlSession);
	}
	
}
