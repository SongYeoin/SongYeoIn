package com.syi.project.mapper.syclass;

import java.util.List;

import com.syi.project.model.syclass.SyclassVO;

public interface SyclassMapper {

	/* 반 등록하기 */
	int classEnroll(SyclassVO syclass);

	/* 반 목록 조회 */
	List<SyclassVO> getClassList();

}
