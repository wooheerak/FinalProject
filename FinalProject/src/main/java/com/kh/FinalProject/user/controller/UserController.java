package com.kh.FinalProject.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.FinalProject.user.model.exception.UserException;
import com.kh.FinalProject.user.model.sevice.UserService;
import com.kh.FinalProject.user.model.vo.User;

@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);

	
	@Autowired
	private UserService uService;
	
	
	
	@RequestMapping("login.ul")
	public String login() {
		
		return "userlogin";
	}
	
	
	@RequestMapping("userlogin.ul")
	public String userlogin(User u, Model model) {
		
		User loginUser = uService.userlogin(u);
		
		if(loginUser != null) {
			model.addAttribute("loginUser",loginUser);
			
			System.out.println(loginUser);
			
		}else {
			throw new UserException("로그인 실패");
		}
		return "redirect:index.do";
		
	}
	
	@RequestMapping("userinformation.ui")
	public String userinformation() {
		return "user/userinformation";
	}
	
	@RequestMapping("userpassword.up")
	public String userpassword() {
		return "user/userpassword";
	}
	
	@RequestMapping("userpassword2.up2")
	public String userpassword2() {
		return "user/userpassword2";
	}
	
	@RequestMapping("userinformationcheck.ui")
	public String userinformationcheck() {
		return "user/userinformationcheck";
	}
	
}
