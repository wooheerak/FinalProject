package com.kh.FinalProject.studyroom_board.model.service;

import java.util.ArrayList;

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
	
	
	@Override
	public ArrayList<Board> selectList() {

		return sbDAO.selectList(sqlSession);
	}


	@Override
	public Board selectBoard(int bo_number) {
		
		Board b = null;
		
		int result = sbDAO.addReadCount(sqlSession, bo_number);
		
		if(result > 0) {
			System.out.println("service : " + bo_number);
			return  sbDAO.selectBoard(sqlSession, bo_number);
		}
		
		return null;
		
	}


	@Override
	public ArrayList<Reply> selectReplyList(int bo_number) {

		return sbDAO.selectReplyList(sqlSession, bo_number);
	}


	@Override
	public int insertBoard(Board b) {
		return sbDAO.insertBoard(sqlSession, b);
	}


	@Override
	public int updateBoard(Board b) {

		return sbDAO.updateBoard(sqlSession, b);
	}


	@Override
	public int deleteBoard(int bo_number) {

		return sbDAO.deleteBoard(sqlSession, bo_number);
	}


}
