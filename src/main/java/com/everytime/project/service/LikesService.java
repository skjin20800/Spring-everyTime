package com.everytime.project.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.BoardRepository;
import com.everytime.project.domain.board.like.Likes;
import com.everytime.project.domain.board.like.LikesRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class LikesService {
	private final LikesRepository likesRepository;
	private final BoardRepository boardRepository;
	
	@Transactional
	public int 게시판공감(Long userId, Long boardId) {
		
		Likes like = likesRepository.findByUserIdAndBoardId(userId,boardId);
		if(like != null) {
			return -1;
		}else {
			return likesRepository.mBoardLike(userId, boardId);	
		}
	}
	
	@Transactional
	public int 댓글공감(Long userId, Long replyId) {
		
		Likes like = likesRepository.findByUserIdAndReplyId(userId,replyId);
		if(like != null) {
			return -1;
		}else {
			return likesRepository.mReplyLike(userId, replyId);	
		}
	}
	
	@Transactional
	public int 대댓글공감(Long userId, Long reReplyId) {
		Likes like = likesRepository.findByUserIdAndReReplyId(userId,reReplyId);
		if(like != null) {
			return -1;
		}else {
			return likesRepository.mReReplyLike(userId, reReplyId);	
		}
	}
	
	 @Transactional(readOnly = true)
	 public Page<Board> 베스트게시글(Pageable pageable) {
	 Page<Board> boardsEntity = boardRepository.mBestList(pageable);	
	  return boardsEntity;
	 }
	
	
}
