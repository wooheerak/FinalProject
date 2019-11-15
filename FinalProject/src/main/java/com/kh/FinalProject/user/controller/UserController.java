package com.kh.FinalProject.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;


import com.kh.FinalProject.user.model.exception.UserException;
import com.kh.FinalProject.user.model.sevice.UserService;
import com.kh.FinalProject.user.model.vo.User;



@SessionAttributes("loginUser")
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
	
	// 로그아웃용 컨트롤러
	@RequestMapping(value="logout.ul")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:index.do";
	}
	
	//
	@RequestMapping("mUpdate.ul")
	   public ModelAndView boardUpdateView(@ModelAttribute User u, ModelAndView mv) {
	      
	      User user = uService.userlogin(u);
	      
	      mv.addObject("user",user)
	        .setViewName("userUpdate");
	      
	      return mv;
	   }
	
	// 회원정보수정
	@RequestMapping("userUpdate.ul")
	public String userUpdate(@ModelAttribute User u, 
			@RequestParam("Phone") String Phone,
			@RequestParam("member_Email") String Member_Email,
			@RequestParam("address") String address,
			@RequestParam("student_number") String student_number,
			@RequestParam("student_Password") String pwd,
			Model model) {
		
		u.setMember_Id(student_number);
		u.setMember_Password(pwd);
		
		Map<String, String> map = new HashMap<>();
		
		map.put("Phone", Phone );
		map.put("Member_Email", Member_Email );
		map.put("address", address );
		map.put("student_number", student_number );
		
		int result = uService.userUpdate(map);
		
		System.out.println(("s : " + result));
		
		if(result > 0) {
			User loginUser = uService.userlogin(u);
			model.addAttribute("loginUser", loginUser);
			
			return "userUpdate";
		}else {
			System.out.println("수정실패");
			return "userUpdate";
		}
		
	}
	
	// 회원 정보 조회
	@RequestMapping("userinformationcheck.ul")
	public ModelAndView userinformationcheck(@ModelAttribute User user,
										ModelAndView mv) {
		mv.addObject("User", user);
		mv.setViewName("userinformationcheck");
		
		return mv;
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value = "/find_pw_form.do")
	public String find_pw_form() throws Exception {
		return "/user/find_pw_form";
	}
	
	@RequestMapping("userpassword.ul")
	public String userpassword() {
		return "userpassword";
	}
	
	@RequestMapping("userpassword2.ul")
	public String userpassword2() {
		return "userpassword2";
	}
	
}
