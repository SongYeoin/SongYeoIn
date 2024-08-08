package com.syi.project.model.journal;

import java.util.Date;

import lombok.Data;

@Data
public class JournalVO {

	private int journalNo; // 일지 번호

	private Date journalDate; // 일지 작성일자

	private Date journalModify; // 일지 수정일자
	
	private String journalTitle; // 일지 제목
	
	private String fileName; // 파일 이름
	
}