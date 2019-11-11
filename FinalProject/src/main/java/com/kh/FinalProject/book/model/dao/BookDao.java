package com.kh.FinalProject.book.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

	public ArrayList<Book> selectList(SqlSessionTemplate sqlSession, Map<String, Object> searchMap) {
		System.out.println("DAO : " + searchMap);
		
		PageInfo pi = (PageInfo)searchMap.get("pi");
		
		int offset = (pi.getCurrentPage() -1) * pi.getBookLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBookLimit());
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectList", searchMap, rowBounds);
	}

	public Book selectBook(SqlSessionTemplate sqlSession, int bNo) {
		
		return sqlSession.selectOne("bookMapper.selectBook", bNo);
	}
	
	
}
