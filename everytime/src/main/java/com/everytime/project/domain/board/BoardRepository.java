package com.everytime.project.domain.board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardRepository extends JpaRepository<Board, Long> {
	List<Board> findByType(BoardType boardType);
	
	List<Board> findByUserId(Long userId);
}
