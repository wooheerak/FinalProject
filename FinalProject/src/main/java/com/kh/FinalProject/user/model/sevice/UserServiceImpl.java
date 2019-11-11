package com.kh.FinalProject.user.model.sevice;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FinalProject.user.model.dao.UserDAO;
import com.kh.FinalProject.user.model.vo.User;

@Service("uService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO uDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public User userlogin(User u) {
		
		return uDAO.userlogin(sqlSession, u);
	}

}
