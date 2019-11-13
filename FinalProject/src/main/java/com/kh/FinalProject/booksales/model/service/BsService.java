package com.kh.FinalProject.booksales.model.service;

import java.util.ArrayList;

import com.kh.FinalProject.booksales.model.vo.BookReg;


public interface BsService {

	ArrayList<BookReg> selectList();

	BookReg selectBs(int brBnumber);

	int inserBs(BookReg br);

	int updateBs(BookReg br);

	



}
