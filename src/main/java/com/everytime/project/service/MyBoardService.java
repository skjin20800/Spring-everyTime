package com.everytime.project.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.BoardRepository;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.domain.board.reply.ReplyRepository;
import com.everytime.project.domain.user.scrap.Scrap;
import com.everytime.project.domain.user.scrap.ScrapRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MyBoardService {
	private final ScrapRepository scrapRepository;
	private final BoardRepository boardRepository;
	private final ReplyRepository replyRepository;

	
	@Transactional
	public int 스크랩(Long userId, Long boardId) {
		Scrap scrap = scrapRepository.findByUserIdAndBoardId(userId,boardId);
		if(scrap != null) {
			return -1;
		}else {
			return scrapRepository.mBoardScrap(userId, boardId);	
		}
	}
	
	@Transactional(readOnly = true)
	public Page<Scrap> 스크랩목록(Long userId, Pageable pageable) {
		 return scrapRepository.findByUserId(userId, pageable);
		}
	
	@Transactional(readOnly = true)
	public Page<Reply> 내댓글목록(Long userId, Pageable pageable) {
		
		 return  replyRepository.mMyReply(userId, pageable);
		}
	
	@Transactional(readOnly = true)
	public Page<Board> 내게시글목록(Long userId,Pageable pageable) {
		 return boardRepository.findByUserId(userId, pageable);
		}
	}
