package com.kh.FinalProject.studyroom_order.model.serivce;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;
import com.kh.FinalProject.studyroom_order.model.vo.StudyroomOrder;
import com.kh.FinalProject.user.model.vo.User;

public interface StudyroomService {

	int getRoomCount();

	ArrayList<Studyroom> selectRoomList();

	int reservationStudyroom(StudyroomOrder sr);

	ArrayList<StudyroomOrder> selectOrderList();

	ArrayList<String> selectName(Map<String, Object> map);

	

}
