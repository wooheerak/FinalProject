package com.kh.FinalProject.book.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.book.model.vo.Book;
import com.kh.FinalProject.book.model.vo.PageInfo;

@Repository("bDao")
public class BookDao {	

	public int selectCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		System.out.println("map : " + map);
		return sqlSession.selectOne("bookMapper.selectCount",map);
	}

	
	
}
