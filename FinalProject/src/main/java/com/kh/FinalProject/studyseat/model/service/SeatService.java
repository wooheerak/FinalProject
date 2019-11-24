package com.kh.FinalProject.studyseat.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyseat.model.vo.Seat;
import com.kh.FinalProject.studyseat.model.vo.SeatHistory;
import com.kh.FinalProject.user.model.vo.User;

@Service("sService")
public interface SeatService {

	ArrayList<Integer> countSeat();

	ArrayList<Seat> selectSeatList(String floor);

	int updateResv(Seat seat);

	int checkDup(String id);

	ArrayList<SeatHistory> selectHistoryList(String id);

	int insertHistory(Seat seat);

	int cancelResv(Seat seat);

	int resetSeat(int cancelId);

	SeatHistory selectsId(String id);

	int checkCode(Seat seat);

	int updateHistory(Seat seat);

	int checkUsing(String id);

	int updateSeat(Seat seat);

	int updateOutHistory(Seat seat);

	int updateUser(User user);

	

}
