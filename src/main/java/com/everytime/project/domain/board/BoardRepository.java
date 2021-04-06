package com.everytime.project.domain.board;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface BoardRepository extends JpaRepository<Board, Long> {
	
	//검색 찾기
	Page<Board> findByTitleLikeAndType(String keyword, BoardType type, Pageable pageable);

	// 게시글 목록 타입으로 찾기
	Page<Board> findByType(BoardType boardType, Pageable pageable);
	
	// 게시글목록 유저ID로 찾기
	List<Board> findByUserId(Long userId);
		
	//실시간 인기Top3
		@Query(value = "SELECT b.* , count(boardId) count FROM (likes) right outer join (board b) on likes.boardId = b.id group by likes.boardId order by count desc ", nativeQuery = true)
		Page<Board> mBestList(Pageable pageable);
		
		//전체 게시판 목록
		@Query(value = "select * from board order by id desc ", nativeQuery = true)
		List<Board> mfindAll();
}
