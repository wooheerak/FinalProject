package com.kh.FinalProject.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.notice.model.dao.NoticeDAO;
import com.kh.FinalProject.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO nDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 공지사항 리스트
	public ArrayList<Notice> selectList() {
		return nDAO.selectList(sqlSession);
	}

	// 공지사항 디테일보기
	public Notice selectNotice(int nId) {
		
		Notice n = null;
		
		int result = nDAO.addReadCount(sqlSession, nId);

		if (result > 0) {
			n = nDAO.selectNotice(sqlSession, nId);
		}

		return n;
	}

	public int inserNotice(Notice n) {
		return nDAO.insertNotice(sqlSession, n);
	}

	public int updateNotice(Notice n) {
		return nDAO.updateNotice(sqlSession, n);
	}

	public int noticeDelete(int nId) {
		return nDAO.noticeDelete(sqlSession, nId);
	}

}
