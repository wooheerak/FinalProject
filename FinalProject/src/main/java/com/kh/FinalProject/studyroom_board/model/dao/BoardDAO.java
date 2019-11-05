package com.kh.FinalProject.studyroom_board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.studyroom_board.model.vo.Board;
import com.kh.FinalProject.studyroom_board.model.vo.Reply;

@Repository("sbDAO")
public class BoardDAO {

	// 게시판 리스트
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectList");
	}

	// 게시글 조회수
	public int addReadCount(SqlSessionTemplate sqlSession, int bo_number) {
		
		System.out.println("dao : " + bo_number);
		return sqlSession.update("boardMapper.addReadCount", bo_number);
	}

	// 게시글 상세보기
	public Board selectBoard(SqlSessionTemplate sqlSession, int bo_number) {
		return sqlSession.selectOne("boardMapper.selectBoard", bo_number);
	}


	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {

		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bo_number) {

		return sqlSession.update("boardMapper.deleteBoard", bo_number);
	}
	

	
	// 댓글
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bo_number) {
		return (ArrayList)sqlSession.selectOne("boardMapper.selectReplyList", bo_number);
	}

}
