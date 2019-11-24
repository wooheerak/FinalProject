package com.kh.FinalProject.studyroom_board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.FinalProject.studyroom_board.model.vo.Board;
import com.kh.FinalProject.studyroom_board.model.vo.Reply;

public interface Studyroom_BoderService {

	ArrayList<Board> selectList();

	Board selectBoard(int bo_number);

	int insertBoard(Board b);

	int updateBoard(Board b);

	int deleteBoard(int bo_number);

	int memberJoin(Map<String, Object> join);

	int memberUnjoin(Map<String, Object> join);
	
	int completeBoard(Map<String, Object> map);
	
	int uncompleteBoard(int bo_number);
	
    ArrayList<Reply> selectReplyList(int bo_number);
	
	int insertReply(Reply r);
	
	int deleteReply(int rId);

	int updateReply(Map<String, Object> reply);






}