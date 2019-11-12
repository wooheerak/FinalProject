package com.kh.FinalProject.book.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.FinalProject.book.model.vo.Book;
import com.kh.FinalProject.book.model.vo.PageInfo;

public interface BookService {


	int getListCount(Map<String, String> map);

	ArrayList<Book> selectList(Map<String, Object> searchMap);

	Book selectBook(int bNo);

	int selectAllCount(String bISBN);

	int selectYCount(String bISBN);

}
