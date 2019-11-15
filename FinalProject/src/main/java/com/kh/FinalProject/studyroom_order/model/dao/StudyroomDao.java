package com.kh.FinalProject.studyroom_order.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;
import com.kh.FinalProject.studyroom_order.model.vo.StudyroomOrder;

@Repository("srDao")
public class StudyroomDao {

	public int getRoomCount(SqlSession sqlSession) {
		return sqlSession.selectOne("studyroomMapper.getRoomCount");
	}

	public ArrayList<Studyroom> selectRoomList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("studyroomMapper.selectRoomList");
	}

	public int reservationStudyroom(SqlSession sqlSession, StudyroomOrder sr) {
		return sqlSession.insert("studyroomMapper.reservationStudyroom",sr);
	}

	public ArrayList<StudyroomOrder> selectOrderList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("studyroomMapper.selectOrderList");
	}

	public ArrayList<String> selectName(SqlSession sqlSession, Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("studyroomMapper.selectName", map);
	}

	public ArrayList<Studyroom> getSrInfo(SqlSession sqlSession, String so_floor) {
		return (ArrayList)sqlSession.selectList("studyroomMapper.getSrInfo",so_floor);
	}

}
