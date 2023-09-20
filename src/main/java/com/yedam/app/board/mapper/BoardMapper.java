package com.yedam.app.board.mapper;

import java.util.List;

import com.yedam.app.board.service.BoardVO;

public interface BoardMapper {
	// 전체조회
	public List<BoardVO> selectBoardList();
	
	// 단건조회 : 조건 1) 글번호, 2) 특정작가와 글번호
	public BoardVO selectBoardInfo(BoardVO boardVO);
	
	// 등록 : 1) 필수와 옵션을 구분, 2) bno 자동부여
	public int insertBoard(BoardVO boardVO);
	
	// 수정 : 대상 (제목 or 내용 or 이미지 or 수정날짜)
	//		-> 이미지는 빈값도 허용, 수정날짜는 어떤 경우에도 반드시
	public int updateBoard(BoardVO boardVO);
	
	// 삭제
	public int deleteBoard(int bno);
	
}
