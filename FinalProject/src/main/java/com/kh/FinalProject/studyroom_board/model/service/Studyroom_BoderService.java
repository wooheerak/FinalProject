package com.kh.FinalProject.studyroom_board.model.service;

import java.util.ArrayList;

import com.kh.FinalProject.studyroom_board.model.vo.Board;
import com.kh.FinalProject.studyroom_board.model.vo.Reply;

public interface Studyroom_BoderService {

	ArrayList<Board> selectList();

	Board selectBoard(int bo_number);

	ArrayList<Reply> selectReplyList(int bo_number);

	int insertBoard(Board b);

	int updateBoard(Board b);

	int deleteBoard(int bo_number);


}