package com.kh.FinalProject.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.notice.model.vo.Notice;

@Repository("nDAO")
public class NoticeDAO {

	// 공지사항 리스트
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList");
	}
	
	// 공지사항 디테일
	public Notice selectNotice(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.selectOne("noticeMapper.selectNotice", nId);
	}

	// 공지사항 조회수
	public int addReadCount(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.update("noticeMapper.addReadCount", nId);
	}

	// 공지사항 작성
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

}
