package com.kh.FinalProject.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.user.model.vo.User;

@Repository("uDAO")
public class UserDAO {

	public User userlogin(SqlSessionTemplate sqlSession, User u) {
		
		return (User)sqlSession.selectOne("userMapper.selectOne", u);
	}

}
