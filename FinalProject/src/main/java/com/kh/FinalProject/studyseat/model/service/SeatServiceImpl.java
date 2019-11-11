package com.kh.FinalProject.studyseat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyseat.model.dao.SeatDao;
import com.kh.FinalProject.studyseat.model.vo.Seat;

@Service("sService")
public class SeatServiceImpl implements SeatService{

	@Autowired
	private SeatDao sDao ;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Integer> countSeat() {
		
		return sDao.countSeat(sqlSession);
	}


	@Override
	public ArrayList<Seat> selectSeatList(String floor) {
		
		return sDao.selectSeatList(sqlSession , floor);
	}

	
	@Override
	public int updateResv(Seat seat) {
	
		return sDao.updateResv(sqlSession, seat);
	}
}
