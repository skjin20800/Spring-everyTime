package com.everytime.project.domain.board.like;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface LikesRepository extends JpaRepository<Likes, Long> {
	
    	// 게시판 좋아요 검사
    	Likes findByUserIdAndBoardId(Long userId, Long boardId);
    	
     	// write (@Modifying) 게시판 좋아요 삽입
    	@Transactional
		@Modifying
		@Query(value = "INSERT INTO likes(userId, boardId, createDate) VALUES(:userId, :boardId, now())", nativeQuery = true)
		int mBoardLike(Long userId, Long boardId); // prepareStatement updateQuery() => -1 0 1
		

		// 댓글 좋아요 검사
		Likes findByUserIdAndReplyId(Long userId, Long replyId);
		
		// 댓글 좋아요 삽입
		@Transactional
		@Modifying
		@Query(value = "INSERT INTO likes(userId, replyId, createDate) VALUES(:userId, :replyId, now())", nativeQuery = true)
		int mReplyLike(Long userId, Long replyId);
		
		
		// 대댓글 좋아요 검사
		Likes findByUserIdAndReReplyId(Long userId, Long reReplyId);
		
		//대댓글 좋아요
		@Transactional
		@Modifying
		@Query(value = "INSERT INTO likes(userId, reReplyId, createDate) VALUES(:userId, :reReplyId, now())", nativeQuery = true)
		int mReReplyLike(Long userId, Long reReplyId); // prepareStatement updateQuery() => -1 0 1
		
		}


