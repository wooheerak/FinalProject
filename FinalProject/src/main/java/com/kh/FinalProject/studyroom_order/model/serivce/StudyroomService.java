package com.kh.FinalProject.studyroom_order.model.serivce;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;

public interface StudyroomService {

	int getRoomCount();

	ArrayList<Studyroom> selectRoomList();

}
