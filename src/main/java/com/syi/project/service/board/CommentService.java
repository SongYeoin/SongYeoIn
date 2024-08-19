package com.syi.project.service.board;

import java.util.List;

import com.syi.project.model.board.CommentsVO;

public interface CommentService {

	// 댓글 생성
	int insertComment(CommentsVO comment);
	
	// 댓글 조회
	List<CommentsVO> selectCommentList(int boardNo);
	
	// 댓글 수정
	int updateComment(CommentsVO comment);

	// 댓글 삭제
	int deleteComment(int commentId);

}
