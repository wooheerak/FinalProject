package com.kh.FinalProject.studyroom_order.model.serivce;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyroom_order.model.dao.StudyroomDao;
import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;

@Service("srService")
public class StudyroomServiceImpl implements StudyroomService{
	
	@Autowired
	private StudyroomDao srDao;
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getRoomCount() {
		return srDao.getRoomCount(sqlSession);
	}

	@Override
	public ArrayList<Studyroom> selectRoomList() {
		return srDao.selectRoomList(sqlSession);
	}

}
