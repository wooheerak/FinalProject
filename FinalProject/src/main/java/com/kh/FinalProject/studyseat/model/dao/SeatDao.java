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


	public int updateResv(SqlSessionTemplate sqlSession, int sNo) {

		return sqlSession.update("seatMapper.updateResv" , sNo);
	}

}
