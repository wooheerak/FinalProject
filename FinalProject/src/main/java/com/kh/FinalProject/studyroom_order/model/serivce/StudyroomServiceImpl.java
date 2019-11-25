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
	public ArrayList<StudyroomOrder> selectOrderList(String id) {
		return srDao.selectOrderList(sqlSession,id);
	}

	@Override
	public ArrayList<String> selectName(Map<String, Object> map) {
		return srDao.selectName(sqlSession, map);
	}

	@Override
	public ArrayList<Studyroom> getSrInfo(String so_floor) {
		return srDao.getSrInfo(sqlSession, so_floor);
	}

	@Override
	public ArrayList<String> checkId(Map<String, Object> map) {
		return srDao.checkId(sqlSession,map);
	}

	@Override
	public ArrayList<StudyroomOrder> reservationInfo(String dateInfo) {
		return srDao.reservationInfo(sqlSession,dateInfo);
	}

	@Override
	public ArrayList<StudyroomOrder> checkTime(StudyroomOrder sro) {
		return srDao.checkTime(sqlSession,sro);
	}

//	@Override
//	public ArrayList<Studyroom> spoidSrInfo(Map<String, Object> map) {
//		return srDao.spoidSrInfo(sqlSession,map);
//	}
	
	@Override
	public ArrayList<Studyroom> spoidSrInfo(Studyroom sr) {
		return srDao.spoidSrInfo(sqlSession,sr);
	}

	@Override
	public ArrayList<StudyroomOrder> orderList(StudyroomOrder sr) {
		return srDao.orderList(sqlSession,sr);
	}

	@Override
	public int deleteOrder(String so_no) {
		return srDao.deleteOrder(sqlSession,so_no);
	}

	@Override
	public int cancelOrder(String bo_number) {
		return srDao.cancelOrder(sqlSession, bo_number);
	}

}
