package com.everytime.project.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.BoardRepository;
import com.everytime.project.domain.board.BoardType;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.web.dto.board.SearchReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardService {

	private final BoardRepository boardRepository;
	
	@Transactional(readOnly = true)
	public Page<Board> 게시판목록(BoardType type,Pageable pageable) {		
		return boardRepository.findByType(type,pageable);
	}
	

	@Transactional(readOnly = true)
	public Board 게시판상세보기(Long id) {
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
	
	@Transactional
	public int 수정하기(Long id,Board board) {
		Board boardEntity = boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("id를 찾을 수 없습니다.");
		});
		boardEntity.setTitle(board.getTitle());
		boardEntity.setContent(board.getContent());
		boardEntity.setIsAnonymous(board.getIsAnonymous());
		return 1;
	}
	
	@Transactional(readOnly = true)
	public Page<Board> 검색하기(SearchReqDto SearchReqDto,Pageable pageable) {
		return boardRepository.findByTitleContaining(SearchReqDto.getKeyword(), pageable);
	}
	
	@Transactional
	public int 삭제하기(Long id, Long userId) {
		Board boardEntity = boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("id를 찾을 수 없습니다.");
		});
		if(boardEntity.getUser().getId()==userId) {
			boardRepository.deleteById(id);
			return 1;
		}else {
			return -1;
		}		
	}


}
