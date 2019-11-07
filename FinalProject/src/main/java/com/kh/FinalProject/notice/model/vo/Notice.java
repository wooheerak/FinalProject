package com.kh.FinalProject.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class Notice {

	private int nId;
	private String nTitle;
	private String nWriter;
	private String nContent;
	private Date nCreateDate;
	private Date nModifyDate;
	private String nOriginalFilename;
	private String nRenameFilename;
	private int nCount;
	private String nStatus;
	private String originalFileName;
	private String renameFileName;
	

	
}
