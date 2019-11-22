package com.kh.FinalProject.user.model.sevice;

import java.util.Map;

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

	@Override
	public int userUpdate(Map<String, String> map) {
		
		return uDAO.userUpdate(sqlSession, map);
	}
	
	@Override
	public int pwdUpdate(User u) {
		
		return uDAO.userpwdUpdate(sqlSession, u);
	}

	@Override
	public int changePwd(Map<String, String> map2) {
		
		return uDAO.changePwd(sqlSession, map2);
		
	}

	@Override
	public User userpasswordfind(Map<String, Object> map) {
		
		return uDAO.userpasswordfind(sqlSession, map);
	}

}
