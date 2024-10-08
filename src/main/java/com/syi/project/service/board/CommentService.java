package com.syi.project.service.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.syi.project.model.Criteria;
import com.syi.project.model.board.CommentsVO;

public interface CommentService {

	// 댓글 조회
	List<CommentsVO> selectCommentList(int boardNo, Criteria cri);

	// 댓글 총 갯수
	int selectCommentTotal(int boardNo);

	// 댓글 생성
	int insertComment(CommentsVO comment);

	// 댓글수 증가
	void increaseComment(int boardNo);

	// 댓글 수정
	int updateComment(CommentsVO comment);

	// 댓글 삭제
	String deleteComment(int commetNo, int boardNo);

	// 댓글수 감소
	void decreaseComment(int boardNo);

}
