package com.everytime.project.domain.board.reply;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ReplyRepository extends JpaRepository<Reply, Long> {

	// 내가 쓴 댓글 리스트 불러오기
@Query(value = "SELECT boardId, userId, id, content, createDate, isAnonymous FROM reply WHERE userId = ?1 group by boardId ", nativeQuery = true)
Page<Reply> mMyReply(Long principalId,Pageable pagealbe);
		
}

