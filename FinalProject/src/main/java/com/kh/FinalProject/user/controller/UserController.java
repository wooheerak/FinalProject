package com.kh.FinalProject.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FinalProject.user.email.FindUtil;
import com.kh.FinalProject.user.email.MailUtil;
import com.kh.FinalProject.user.model.exception.UserException;
import com.kh.FinalProject.user.model.sevice.UserService;
import com.kh.FinalProject.user.model.vo.User;




@SessionAttributes("loginUser")
@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService uService;

	// 로그인 로그인 실패
	@RequestMapping("userlogin.ul")
	public String userlogin(User u, Model model) {
		
		User loginUser = uService.userlogin(u);
		
		if(loginUser != null) {
			model.addAttribute("loginUser",loginUser);
					
			return "redirect:index.do";
		}else {
			return "userlogin";
		}
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
			Model model) {
		
		u.setMember_Id(student_number);
		
		Map<String, String> map = new HashMap<>();
		
		map.put("Phone", Phone);
		map.put("Member_Email", Member_Email);
		map.put("address", address);
		map.put("student_number", student_number);
		
		
		int result = uService.userUpdate(map);
		
		System.out.println(("s : " + result));
		
		if(result > 0) {
			User loginUser = uService.userlogin(u);
			model.addAttribute("loginUser", loginUser);
			
			return "userinformationcheck";
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
	
	@RequestMapping("upview.ul")
	public String upview(@ModelAttribute User u) {
		
		return "userpassword";
		
	}
	
	// 비밀번호 수정
	@RequestMapping("userpassword.ul")
	public String pwdUpdate(@ModelAttribute User u) {
		
		System.out.println(u);
	
			int result = uService.pwdUpdate(u);
			if(result > 0) {

				return "redirect:userinformationcheck.ul";
			} else {
				throw new UserException("비밀번호 변경 실패");
			}	
		
	}
	
	/*// 비밀번호 찾기
	@RequestMapping(value = "usercheck.ul", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String findPwd(User u, String inputCode,
			HttpSession session) throws Exception {
		
		String newPwd = FindUtil.getNewPwd();
		
		Map<String, String> map = new HashMap<>();
		
		map.put("member_Id", u.getMember_Id());
		map.put("newPwd", newPwd);
		
		System.out.println(map);
		
		uService.changePwd(map);
		
		String subject = "[kh] 임시 비밀번호 발급안내";
		
		String msg = "";
		msg += "<div align='center' style='border:1px solid black; font=family:verdana'>";
		msg += "<h3 style='color: blue;><strong>" + u.getMember_Id();
		msg += "님</strong>의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하세요.</h3>";
		msg += "<p> 임시 비밀번호 : <strong>" + newPwd + "</strong></p></div>";
		
		MailUtil.sendMail(u.getMember_Email(), subject, msg);
		
		return "redirect:userpassword2.ul";
	}*/
	
	

		// 비밀번호 찾기 
		@RequestMapping(value = "userpasswordfind.ul")
		public ModelAndView userpasswordfind(ModelAndView mv) throws Exception{
			int check = 1;
			mv.addObject("checkSep", check);
			mv.setViewName("userpasswordfind");
			return mv;
		}
		
		
		@RequestMapping(value = "userpassword2.ul")
		public ModelAndView userpassword2(
				@RequestParam("member_Id") String member_Id,
				@RequestParam("member_Email") String member_Email,
				@RequestParam("member_Name") String member_Name,
				ModelAndView mv) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("member_Id", member_Id);
			map.put("member_Name", member_Name);
			map.put("member_Email", member_Email);
			
			System.out.println("a : " + map);
			
			User user = uService.userpasswordfind(map);
			
			if(user != null) {
				
				String newPwd = FindUtil.getNewPwd();
				
				Map<String, String> map2 = new HashMap<>();
				
				map2.put("member_Id", member_Id);
				map2.put("newPwd", newPwd);
				
				System.out.println("b ; " + map2);
				
				uService.changePwd(map2);
				
				String subject = "[kh] 임시 비밀번호 발급안내";
				
				String msg = "";
				msg += "<br> <br> <div align='center' style='border:1px solid black;'>";
				msg += "<h3 style='color: blue';><strong>" + member_Id + "<br>";
				msg += "님</strong>의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하세요.</h3>";
				msg += "<p> 임시 비밀번호 : <strong>" + newPwd + "<br> <br> </strong></p></div> ";
				
				MailUtil.sendMail(member_Email, subject, msg);
				
				mv.setViewName("userpassword2");
				return mv;
			} else {
				int check = 0;
				mv.addObject("checkSep", check);
				mv.setViewName("userpasswordfind");
				return mv;
			}
				
			
			
	
	

		}
}

