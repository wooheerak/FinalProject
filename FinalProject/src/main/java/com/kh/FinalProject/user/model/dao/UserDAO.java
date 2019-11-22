package com.kh.FinalProject.user.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.user.model.vo.User;

@Repository("uDAO")
public class UserDAO {

	public User userlogin(SqlSessionTemplate sqlSession, User u) {
		
		return (User)sqlSession.selectOne("userMapper.selectOne", u);
	}

	public int userUpdate(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("userMapper.update",map);
	}

	public int userpwdUpdate(SqlSessionTemplate sqlSession, User u) {
		
		return sqlSession.update("userMapper.pwdUpdate", u);
	}

	public User userpasswordfind(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return (User)sqlSession.selectOne("userMapper.pwdfind", map);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Map<String, String> map2) {
		
		return sqlSession.update("userMapper.changePwd", map2);
	}

}
