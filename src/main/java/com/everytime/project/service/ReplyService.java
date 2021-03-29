package com.everytime.project.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.BoardRepository;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.domain.board.reply.ReplyRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReplyService {

	private final ReplyRepository replyRepository;
	private final BoardRepository boardRepository;
	
	@Transactional
	public int 댓글쓰기(Reply reply, Long id) {
		Board boardEntity = boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("id를 찾을 수 없습니다.");
		});
		reply.setBoard(boardEntity);
		Reply replyEntity = replyRepository.save(reply);
		if(replyEntity == null) {
			return -1;
		}else {
			return 1;
		}
	}
	
	@Transactional
	public int 삭제하기(Long id, Long userId) {
		Reply replyEntity = replyRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("id를 찾을 수 없습니다.");
		});
		if(replyEntity.getUser().getId()==userId) {
			replyRepository.deleteById(id);
			return 1;
		}else {
			return -1;
		}		
	}

	
}
