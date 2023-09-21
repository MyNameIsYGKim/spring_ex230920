package com.yedam.app.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.mapper.BoardMapper;
import com.yedam.app.board.service.BoardService;
import com.yedam.app.board.service.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getBoardList() {
		return boardMapper.selectBoardList();
	}

	@Override
	public BoardVO getBoardInfo(BoardVO boardVO) {
		return boardMapper.selectBoardInfo(boardVO);
	}

	@Override
	public int insertBoardInfo(BoardVO boardVO) {
		int result = boardMapper.insertBoard(boardVO);
		
		if(result == 1) {
			return Integer.valueOf(boardVO.getBno());
		} else {
			return -1;
		}
	}

	@Override
	public int updateBoardInfo(BoardVO boardVO) {
		int result =  boardMapper.updateBoard(boardVO);
		
		if(result == 1) {
			return Integer.valueOf(boardVO.getBno());
		} else {
			return -1;
		}
		
		// return boardMapper.updateBoard(boardVO) ? Integer.valueOf(boardVO.getBno()) : -1;
	}

	@Override
	public int deleteBoardInfo(int bno) {
		int result = boardMapper.deleteBoard(bno);
		
		if(result == 1) {
			return bno;
		} else {
			return -1;
		}
	}

}
