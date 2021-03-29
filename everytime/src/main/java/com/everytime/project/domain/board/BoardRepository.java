package com.everytime.project.domain.board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardRepository extends JpaRepository<Board, Long> {
	
	// 게시글목록 타입으로 찾기
	List<Board> findByType(BoardType boardType);
	
	// 게시글목록 유저ID로 찾기
	List<Board> findByUserId(Long userId);
}
