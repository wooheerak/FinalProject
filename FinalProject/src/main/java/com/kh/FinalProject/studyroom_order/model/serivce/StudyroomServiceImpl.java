package com.kh.FinalProject.studyroom_order.model.serivce;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyroom_order.model.dao.StudyroomDao;
import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;
import com.kh.FinalProject.studyroom_order.model.vo.StudyroomOrder;

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

	@Override
	public int reservationStudyroom(StudyroomOrder sr) {
		return srDao.reservationStudyroom(sqlSession,sr);
	}

	@Override
	public ArrayList<StudyroomOrder> selectOrderList() {
		return srDao.selectOrderList(sqlSession);
	}

	@Override
	public ArrayList<String> selectName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return srDao.selectName(sqlSession, map);
	}

	



}
