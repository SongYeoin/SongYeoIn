package com.syi.project.service.journal;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.syi.project.model.Criteria;
import com.syi.project.model.journal.JournalVO;

public interface JournalService {

    /* 일지 등록 */
    public void journalEnroll(JournalVO journal, MultipartFile file) throws Exception;
    
    /* 일지 목록 */
    public List<JournalVO> journalList() throws Exception;
    
    /* 일지 총 갯수 */
    public int journalGetTotal(Criteria cri) throws Exception;
    
    /* 일지 상세 조회 */
	public JournalVO journalDetail(int journalNo);

	/* 일지 수정 */
	public void journalModify(JournalVO journal) throws Exception;
	

}
