package com.everytime.project.domain.user.scrap;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ScrapRepository extends JpaRepository<Scrap, Long> {

	// 게시판 스크랩 검사
	Scrap findByUserIdAndBoardId(Long userId, Long boardId);

	// 게시판 스크랩 삽입
	@Modifying
	@Query(value = "INSERT INTO scrap(userId, boardId, createDate) VALUES(:userId, :boardId, now())", nativeQuery = true)
	int mBoardScrap(Long userId, Long boardId); // prepareStatement updateQuery() => -1 0 1
	
	// 게시판 스크랩 목록
	Page<Scrap> findByUserId(Long userId,Pageable pageable);
	
}


