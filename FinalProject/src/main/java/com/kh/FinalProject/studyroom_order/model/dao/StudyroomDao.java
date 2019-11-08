package com.kh.FinalProject.studyroom_order.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;

@Repository("srDao")
public class StudyroomDao {

	public int getRoomCount(SqlSession sqlSession) {
		return sqlSession.selectOne("studyroomMapper.getRoomCount");
	}

	public ArrayList<Studyroom> selectRoomList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("studyroomMapper.selectRoomList");
	}

}
