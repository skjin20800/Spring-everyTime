package com.everytime.project.domain.board;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardRepository extends JpaRepository<Board, Long> {
	
	//검색 찾기
	Page<Board> findByTitleContaining(String keyword, Pageable pageable);

	
	// 게시글 목록 타입으로 찾기
	Page<Board> findByType(BoardType boardType, Pageable pageable);
	
	// 게시글 제목 타입으로 찾기
	List<Board> findByType(BoardType boardType);

	// 게시글목록 유저ID로 찾기
	List<Board> findByUserId(Long userId);
}
