package com.kh.FinalProject.studyseat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.studyseat.model.vo.Seat;

@Repository("sDao")
public class SeatDao {

	public ArrayList<Integer> countSeat(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("seatMapper.countSeat");
	}



	public ArrayList<Seat> selectSeatList(SqlSessionTemplate sqlSession, String floor) {
		
		return (ArrayList)sqlSession.selectList("seatMapper.selectFloorSeat" , floor);
	}


	public int updateResv(SqlSessionTemplate sqlSession, Seat seat) {

		return sqlSession.update("seatMapper.updateResv" , seat);
	}



	public int checkDup(SqlSessionTemplate sqlSession, String id) {
		
		return sqlSession.selectOne("seatMapper.checkDup" , id);
	}

}
