package com.everytime.project.domain.user.scrap;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.everytime.project.domain.board.like.Likes;

public interface ScrapRepository extends JpaRepository<Scrap, Long> {

	// 게시판 스크랩 검사
	Scrap findByUserIdAndBoardId(Long userId, Long boardId);

	// 게시판 스크랩 삽입
	@Modifying
	@Query(value = "INSERT INTO scrap(userId, boardId, createDate) VALUES(:userId, :boardId, now())", nativeQuery = true)
	int mBoardScrap(Long userId, Long boardId); // prepareStatement updateQuery() => -1 0 1
	
}


