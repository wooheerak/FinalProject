package com.kh.FinalProject.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.FinalProject.user.model.sevice.UserService;
import com.kh.FinalProject.user.model.vo.User;

@Controller
public class UserController {

	
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
			return "redirect:index.do";
		}
		
		return "userlogin";
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
