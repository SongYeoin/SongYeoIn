package com.syi.project.service.club;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.syi.project.model.Criteria;
import com.syi.project.model.club.ClubVO;
import com.syi.project.model.member.MemberVO;
import com.syi.project.model.syclass.SyclassVO;

public interface ClubService {

	//동아리 리스트(페이징)
	public List<ClubVO> getListPaging(Criteria cri, int classNo);
	
	//동아리 등록
	//public void enroll(int classNo, String join, Date studyDate, String content, int memberNo);
	public void enroll(ClubVO club);
	
	//동아리 조회
	public ClubVO getPage(int clubNo);
	
	//동아리 수정
	public int modify(ClubVO club);
	public int modifyAdmin(ClubVO club);
	
	//동아리 삭제
	public int delete(int clubNo);
	public int deleteAdmin(int clubNo);

	//동아리 로드시 반 번호
	public Integer getDefaultClassNoByMember(Integer memberNo);

	//수강 반 목록
	public List<SyclassVO> getClassNoListByMember(Integer memberNo);

	//동아리 신청 총 갯수
	public int getTotal(Criteria cri, int classNo);
}
