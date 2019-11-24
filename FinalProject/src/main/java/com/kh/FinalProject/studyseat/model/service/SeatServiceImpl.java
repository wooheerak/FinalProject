package com.kh.FinalProject.studyseat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyseat.model.dao.SeatDao;
import com.kh.FinalProject.studyseat.model.vo.Seat;
import com.kh.FinalProject.studyseat.model.vo.SeatHistory;
import com.kh.FinalProject.user.model.vo.User;

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


	@Override
	public int checkDup(String id) {
		
		return sDao.checkDup(sqlSession, id);
	}


	@Override
	public ArrayList<SeatHistory> selectHistoryList(String id) {

		return sDao.selectHistoryList(sqlSession , id);
	}


	@Override
	public int insertHistory(Seat seat) {
		
		return sDao.insertHistory(sqlSession , seat);
	}


	@Override
	public int cancelResv(Seat seat) {
		
		return sDao.cancelResv(sqlSession , seat);
	}


	@Override
	public int resetSeat(int cancelId) {
		
		return sDao.resetSeat(sqlSession , cancelId);
	}


	@Override
	public SeatHistory selectsId(String id) {
		
		return sDao.selectsId(sqlSession , id);
		
	}


	@Override
	public int checkCode(Seat seat) {
		
		return sDao.checkCode(sqlSession, seat);
	}


	@Override
	public int updateHistory(Seat seat) {
		
		return sDao.updateHistory(sqlSession , seat);
	}


	@Override
	public int checkUsing(String id) {
		
		return sDao.checkUsing(sqlSession, id);
	}


	@Override
	public int updateSeat(Seat seat) {

		return sDao.updateSeat(sqlSession , seat);
	}


	@Override
	public int updateOutHistory(Seat seat) {
		
		return sDao.updateOutHistory(sqlSession , seat);
	}


	@Override
	public int updateUser(User user) {

		return sDao.updateUser(sqlSession , user);
	}



}
