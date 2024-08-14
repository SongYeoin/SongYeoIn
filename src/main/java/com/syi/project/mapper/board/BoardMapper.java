package com.syi.project.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.syi.project.model.Criteria;
import com.syi.project.model.board.BoardVO;
import com.syi.project.model.board.CommentsVO;
import com.syi.project.model.board.HeartVO;

public interface BoardMapper {

	// 게시글 목록
	List<BoardVO> selectBoards(Criteria cri);

	// 공지사항 조회수 증가
	void updateBoardCount(int boardNo);

	// 게시글 상세 조회
	BoardVO selectBoardByBoardNo(int boardNo);

	// 게시글 등록
	int insertBoard(BoardVO board);

	// 게시글 수정
	int updateBoard(BoardVO board);

	// 게시글 삭제
	int deleteBoard(int boardNo);

	// 좋아요 추가
	int insertHeart(HeartVO heart);
	
	// 좋아요 확인
	int selectMyHeart(HeartVO heart);
	
	// 좋아요 취소
	int deleteHeart(HeartVO heart);
	
	// 좋아요 갯수
	int selectHeartTotal(HeartVO heart);
	

	// 댓글
	int insertComment(CommentsVO comment);

	int deleteComment(int commentId);

}