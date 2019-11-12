package com.kh.FinalProject.studyroom_board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyroom_board.model.dao.BoardDAO;
import com.kh.FinalProject.studyroom_board.model.vo.Board;
import com.kh.FinalProject.studyroom_board.model.vo.Reply;

@Service("sbService")
public class Studyroom_BoardServiceImpl implements Studyroom_BoderService{

	@Autowired
	private BoardDAO sbDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 조회수
	@Override
	public Board selectBoard(int bo_number) {
		
		int result = sbDAO.addReadCount(sqlSession, bo_number);
		
		if(result > 0) {
			return  sbDAO.selectBoard(sqlSession, bo_number);
		}
		
		return null;
		
	}
	
	// 게시글 리스트
	@Override
	public ArrayList<Board> selectList() {

		return sbDAO.selectList(sqlSession);
	}

	// 게시글 등록
	@Override
	public int insertBoard(Board b) {
		return sbDAO.insertBoard(sqlSession, b);
	}

	// 게시글 수정
	@Override
	public int updateBoard(Board b) {
		
		return sbDAO.updateBoard(sqlSession, b);		
	}

	// 게시글 삭제
	@Override
	public int deleteBoard(int bo_number) {

		return sbDAO.deleteBoard(sqlSession, bo_number);
	}


	// 그룹 참여
	@Override
	public int memberJoin(Map<String, Object> join) {
	
		return sbDAO.memberJoin(sqlSession, join);
	
	}
	
	// 그룹 탈퇴 
	@Override
	public int memberUnjoin(Map<String, Object> join) {
		return sbDAO.memberUnjoin(sqlSession, join);
	}
	
	// 댓글 리스트
	@Override
	public ArrayList<Reply> selectReplyList(int bo_number) {
		
		return sbDAO.selectReplyList(sqlSession, bo_number);
	}

	// 댓글 등록
	/*@Override
	public int insertReply(Reply r) {

		return sbDAO.insertReply(sqlSession, r);
	}*/
	
	// 댓글 삭제
	@Override
	public int deleteReply(int refBid) {
		return sbDAO.deleteReply(sqlSession, refBid);
	}

	@Override
	public int insertReply(Reply r) {
		return sbDAO.insertReply(sqlSession, r);
	}

}
