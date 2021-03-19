package com.everytime.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.BoardRepository;
import com.everytime.project.domain.board.BoardType;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardService {

	private final BoardRepository boardRepository;
	
	public List<Board> 자유게시판목록() {		
		return boardRepository.findByType(BoardType.FREE);
	}
	
	public int 글쓰기(Board board) {
		Board boardEntity = boardRepository.save(board);
		if(boardEntity == null) {
			return -1;
		}else {
			return 1;
		}
	}
}
