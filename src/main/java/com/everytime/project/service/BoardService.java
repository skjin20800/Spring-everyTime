package com.everytime.project.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.BoardRepository;
import com.everytime.project.domain.board.BoardType;
import com.everytime.project.web.dto.board.SearchReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardService {

	private final BoardRepository boardRepository;
	
	@Transactional(readOnly = true)
	public Page<Board> 자유게시판목록(Pageable pageable) {		
		return boardRepository.findByType(BoardType.free,pageable);
	}
	

	@Transactional(readOnly = true)
	public Board 자유게시판상세보기(Long id) {
		Board boardEntity = boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("id를 찾을 수 없습니다.");
		}); 
				return boardEntity;
	}
	
	@Transactional
	public int 글쓰기(Board board) {
		Board boardEntity = boardRepository.save(board);
		if(boardEntity == null) {
			return -1;
		}else {
			return 1;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public Page<Board> 검색하기(SearchReqDto SearchReqDto,Pageable pageable) {
		return boardRepository.findByTitleContaining(SearchReqDto.getKeyword(), pageable);
	}

}