package com.syi.project.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.syi.project.model.Criteria;
import com.syi.project.model.board.CommentsVO;

public interface CommentMapper {

	// 댓글 생성
	int insertComment(CommentsVO comment);

	// 댓글 전체 조회
	List<CommentsVO> selectCommentList(@Param("boardNo") int boardNo, @Param("cri") Criteria cri);
	
	// 댓글 총 갯수
	int selectCommentTotal(int boardNo);

	// 댓글 수 증가
	void increaseComment(int boardNo);

	// 댓글 수정
	int updateComment(CommentsVO comment);
	
	// 댓글 조회
	CommentsVO getCommentByNo(int commentNo);

	// 자식 댓글 조회
	List<CommentsVO> getRepliesBycommentNo(int commentNo);

	// 댓글 논리적 삭제
	int updateCommentStatus(int commentNo);

	// 댓글 물리적 삭제
	int deleteComment(int commentNo);

	// 댓글수 감소
	void decreaseComment(int boardNo);

}
