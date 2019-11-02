package com.kh.FinalProject.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("userlogin.ul")
	public String userlogin() {
		return "user/userlogin";
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
