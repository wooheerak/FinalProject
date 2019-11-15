package com.kh.FinalProject.user.model.sevice;

import java.util.Map;

import com.kh.FinalProject.user.model.vo.User;

public interface UserService {

	User userlogin(User u);

	int userUpdate(Map<String, String> map);


	}


