package com.kh.FinalProject.studyseat.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.FinalProject.studyseat.model.dao.SeatDao;

public class SeatServiceImpl implements SeatService{

	@Autowired
	private SeatDao sDao ;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
}
