package com.syi.project.service.journal;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.syi.project.model.Criteria;
import com.syi.project.model.journal.EduScheduleVO;
import com.syi.project.model.syclass.SyclassVO;

public interface EduScheduleService {
	
	// 일정 등록
	void scheduleCreate(EduScheduleVO schedule) throws Exception;

	// 모든 일정 조회 (페이징, 검색, 반별 필터링)
    List<EduScheduleVO> scheduleList(Criteria cri, int classNo);
    
    // 일정 총 갯수
    int scheduleGetTotal(Criteria cri, int classNo);
    
    // 일정 상세 조회
    EduScheduleVO scheduleDetail(int scheduleNo);

    // 일정 업데이트
    void scheduleUpdate(EduScheduleVO schedule);

    // 일정 삭제
    int scheduleDelete(int scheduleNo);

    // 캘린더 전체 일정 조회 (반별 필터링 포함)
    List<EduScheduleVO> scheduleAllList(int classNo);
    

}
