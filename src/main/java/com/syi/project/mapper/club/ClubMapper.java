package com.syi.project.mapper.club;

import java.util.List;

import com.syi.project.model.Criteria;
import com.syi.project.model.club.ClubVO;
import com.syi.project.model.member.MemberVO;

public interface ClubMapper {

	
	//동아리 리스트
	public List<ClubVO> getList();
	
	//동아리 등록
	public void enroll(ClubVO club);
	
	//동아리 조회
	public ClubVO getPage(int clubNo);

	//동아리 수정
	public int modify(ClubVO club);
	
	//리스트 페이징 적용
	public List<ClubVO> getListPaging(Criteria cri);
	
}
