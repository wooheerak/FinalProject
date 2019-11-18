package com.kh.FinalProject.booksales.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.booksales.model.vo.BookReg;


@Repository("bsDAO")
public class BsDAO {

	// 중고서적 리스트
	public ArrayList<BookReg> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bsMapper.selectList");
	}
	
	// 중고서적 디테일
	public BookReg selectBs(SqlSessionTemplate sqlSession, int brBnumber) {
		return sqlSession.selectOne("bsMapper.selectBs", brBnumber);
	}

	// 중고서적 조회수
	public int addReadCount(SqlSessionTemplate sqlSession, int brBnumber) {
		return sqlSession.update("bsMapper.addReadCount", brBnumber);
	}

	// 중고서적 등록
	public int insertBs(SqlSessionTemplate sqlSession, BookReg br) {
		return sqlSession.insert("bsMapper.insertBs", br);
	}
	
	// 중고서적 수정
	public int updateBs(SqlSessionTemplate sqlSession, BookReg br) {
		return sqlSession.update("bsMapper.updateBs", br);
	}

	// 중고서적 삭제
	public int bsDelete(SqlSessionTemplate sqlSession, int brBnumber) {
		return sqlSession.update("bsMapper.deleteBs", brBnumber);
	}

	// 판매완료 업데이트
	public int updateComplete(SqlSessionTemplate sqlSession, int brBnumber) {
		return sqlSession.update("bsMapper.updateComplete", brBnumber);
	}

	// 판매 완료 insert
	public int insertBookSale(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("bsMapper.insertBooksale", map);
	}

	public ArrayList<BookReg> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bsMapper.selectTopList");
		
	}


}
