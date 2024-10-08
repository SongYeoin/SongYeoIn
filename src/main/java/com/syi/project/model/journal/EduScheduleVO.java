package com.syi.project.model.journal;

import java.sql.Date;

import com.syi.project.model.member.MemberVO;
import com.syi.project.model.syclass.SyclassVO;

import lombok.Data;

@Data
public class EduScheduleVO {

	private int scheduleNo; // 일정 번호
	
	private Date scheduleDate; // 일정 날짜
	
	private Date scheduleRegDate; // 일정 등록날짜
	
	private Date scheduleModifyDate; // 일정 수정날짜
	
	private String scheduleTitle; // 일정 제목
	
	private String scheduleDescription; // 일정 설명
	
	private String scheduleInstructor; // 강사
	
	private int classNo; // 클래서 번호
	
	private int memberNo; // 멤버번호
	
	private SyclassVO syclass; // 클래스VO
	
	private MemberVO member; // 멤버VO
}