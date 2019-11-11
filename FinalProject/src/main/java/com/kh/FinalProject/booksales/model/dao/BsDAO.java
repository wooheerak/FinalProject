package com.kh.FinalProject.booksales.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.booksales.model.vo.BookReg;


@Repository("bsDAO")
public class BsDAO {

	public ArrayList<BookReg> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bsMapper.selectList");
	}

}
