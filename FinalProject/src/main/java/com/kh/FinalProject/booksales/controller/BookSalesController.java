package com.kh.FinalProject.booksales.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.FinalProject.booksales.model.exception.BSException;
import com.kh.FinalProject.booksales.model.service.BsService;
import com.kh.FinalProject.booksales.model.vo.BookReg;
import com.kh.FinalProject.user.model.vo.User;




@Controller
public class BookSalesController {

	@Autowired
	private BsService bsService;

	// 중고서적 리스트
	@RequestMapping("bslist.bs")
	public ModelAndView bsList(ModelAndView mv) {

		ArrayList<BookReg> list = bsService.selectList();

		if (list != null) {

			mv.addObject("list", list);
			mv.setViewName("bsList");
		} else {
			throw new BSException("중고서적 조회 실패");
		}

		return mv;

	}

	// 중고서적 디테일
	@RequestMapping("bsdetail.bs")
	public ModelAndView bsDetail(@RequestParam("brBnumber") int brBnumber, ModelAndView mv) {
		BookReg bs = bsService.selectBs(brBnumber);
	
		if(bs != null) {	
			mv.addObject("bs", bs).setViewName("bsListDetail");
		} else {
			throw new BSException("중고서적 상세 보기 실패");
		}
		
		return mv;
	}
	
	// 중고서적 등록 페이지
	@RequestMapping("bsinsertView.bs")
	public String bsIncert() {
		return "bsInsert";
	}
	
	// 중고서적 등록
	@RequestMapping("bsinsert.bs")
	public String bsInsert(@ModelAttribute BookReg br, 
						   @RequestParam("uploadFile") MultipartFile uploadFile,
						   HttpServletRequest request) {
		if (uploadFile != null && !uploadFile.isEmpty()) {

			String renameFileName = saveFile(uploadFile, request);

			if (renameFileName != null) {
				br.setOriginalFileName(uploadFile.getOriginalFilename());
				br.setRenameFileName(renameFileName);
			}

		}

		int result = bsService.inserBs(br);

		if (result > 0) {
			return "redirect:bslist.bs";
		} else {
			throw new BSException("중고서적 등록을 실패하였습니다.");
		}
	}
	
	// 파일저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로 설정 : 작은 resources 불러오기
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\bsuploadFiles";    // \를 하나만 하면 인지를 못한다
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
								+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return renameFileName;
	}
	
	// 중고서적 수정
	@RequestMapping("bsupView.bs")
	public ModelAndView bsUpdateView(@RequestParam("brBnumber") int brBnumber, ModelAndView mv) {
		
		BookReg br = bsService.selectBs(brBnumber);
		
		mv.addObject("br", br)
		  .setViewName("bsListUpdate");
		
		return mv;
	}
	
	// 중고서적 판매 업데이트
	@RequestMapping("bsupdate.bs")
	public ModelAndView bsUpdate(@ModelAttribute BookReg br,
									 @RequestParam("reloadFile") MultipartFile reloadFile,
									 HttpServletRequest request,
									 ModelAndView mv) {

		if(reloadFile != null && !reloadFile.isEmpty()) {
			deleteFile(br.getRenameFileName(), request);
		}

		String renameFileName = saveFile(reloadFile, request);
		
		if(renameFileName != null) {
			br.setOriginalFileName(reloadFile.getOriginalFilename());
			br.setRenameFileName(renameFileName);
		}
		
		int result = bsService.updateBs(br);
		if(result > 0) {
			mv.setViewName("redirect:bsdetail.bs?brBnumber=" + br.getBrBnumber());
		}else {
			throw new BSException("중고서적 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 중고서적 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\bsuploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}	
	}
	
	// 중고서적 삭제
	@RequestMapping("bsdelete.bs")
	public String bsDelete(@RequestParam("brBnumber") int brBnumber) {
		
		int result = bsService.bsDelete(brBnumber);

		if(result > 0) {
			return "redirect:bslist.bs";
		}else {
			throw new BSException("중고서적 삭제에 실패하였습니다.");
		}
	}
	
	// 중고서적 판매 완료
	@RequestMapping("complete.bs")
	public String complete(@RequestParam("brBnumber") int brBnumber,
						 @RequestParam("brStudentId") String brStudentId,
						 HttpServletRequest request) {
		
		// 1. BOOK_REG테이블 업데이트
		// 필요한 파라미터: BR_BNUMBER , BR_STATUS, BS_ORDER_STATUS 	
		int result1 = bsService.updateComplete(brBnumber);

		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("loginUser");
		String bStudentId = "";
		
		// 2. BOOK_SALE INSERT
		// BS_ORDER_NO, HASMAP으로 대려가기:BS_BNUMBER, S_STUDENT_ID, B_STUDENT_ID,// BS_DATE = SYSDATE
		int result = -1;
		
		if(user != null) {
			bStudentId = user.getMember_Id();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bNo", brBnumber);
		map.put("sId", brStudentId);
		map.put("bId", bStudentId);
		
		System.out.println(map);
		
		if(result1 > 0) {
			result = bsService.insertBookSale(map);
		}
		
		if(result > 0) {
			return "bsComplete";
		} else {
			throw new BSException("중고서적 구매 실패");
		}
		
	}
	
	// 중고서적 최신 리스트
	@RequestMapping("topList.bs")
	public void bsTopList(ModelAndView mv, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<BookReg> tlist = bsService.selectTopList();
	
		
		Gson gson = new Gson();
		gson.toJson(tlist, response.getWriter());
		

	
	}
	
	
	
}
