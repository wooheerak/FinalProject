package com.kh.FinalProject.studyseat.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyseat.model.vo.Seat;
import com.kh.FinalProject.studyseat.model.vo.SeatHistory;

@Service("sService")
public interface SeatService {

	ArrayList<Integer> countSeat();

	ArrayList<Seat> selectSeatList(String floor);

	int updateResv(Seat seat);

	int checkDup(String id);

	ArrayList<SeatHistory> selectHistoryList(String id);

	int insertHistory(Seat seat);

	int cancelResv(int cancelId);

	int resetSeat(int cancelId);

}
