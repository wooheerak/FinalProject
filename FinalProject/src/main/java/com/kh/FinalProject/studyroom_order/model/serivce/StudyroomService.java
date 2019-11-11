package com.kh.FinalProject.studyroom_order.model.serivce;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyroom_order.model.vo.Studyroom;
import com.kh.FinalProject.studyroom_order.model.vo.StudyroomOrder;

public interface StudyroomService {

	int getRoomCount();

	ArrayList<Studyroom> selectRoomList();

	int reservationStudyroom(StudyroomOrder sr);

}
