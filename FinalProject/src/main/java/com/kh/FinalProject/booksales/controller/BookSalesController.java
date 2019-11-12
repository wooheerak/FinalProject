package com.kh.FinalProject.booksales.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FinalProject.booksales.model.exception.BSException;
import com.kh.FinalProject.booksales.model.service.BsService;
import com.kh.FinalProject.booksales.model.vo.BookReg;
import com.kh.FinalProject.notice.model.exception.NoticeException;
import com.kh.FinalProject.notice.model.vo.Notice;



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

		System.out.println(bs);
	
		if(bs != null) {	
			mv.addObject("bs", bs).setViewName("bsListDetail");
		} else {
			throw new BSException("중고서적 상세 보기 실패");
		}
		
		return mv;
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
}
