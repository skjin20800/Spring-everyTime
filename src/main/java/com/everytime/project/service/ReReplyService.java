package com.everytime.project.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.domain.board.reply.ReplyRepository;
import com.everytime.project.domain.board.reply.rereply.ReReply;
import com.everytime.project.domain.board.reply.rereply.ReReplyRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReReplyService {

	private final ReplyRepository replyRepository;
	private final ReReplyRepository rereplyRepository;
	
	@Transactional
	public int 대댓글쓰기(ReReply rereply, Long id) {
		Reply replyEntity = replyRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("id를 찾을 수 없습니다.");
		});
		rereply.setReply(replyEntity);
		ReReply rereplyEntity = rereplyRepository.save(rereply);
		if(rereplyEntity == null) {
			return -1;
		}else {
			return 1;
		}
	}
	
	@Transactional
	public int 삭제하기(Long id, Long userId) {
		ReReply rereplyEntity = rereplyRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("id를 찾을 수 없습니다.");
		});
		if(rereplyEntity.getUser().getId()==userId) {
			rereplyRepository.deleteById(id);
			return 1;
		}else {
			return -1;
		}		
	}

	
}
