package com.kh.FinalProject.notice.model.service;

import java.util.ArrayList;

import com.kh.FinalProject.notice.model.vo.Notice;

public interface NoticeService {

	ArrayList<Notice> selectList();

	Notice selectNotice(int nId);

	int inserNotice(Notice n);

	int updateNotice(Notice n);

	int noticeDelete(int nId);

}