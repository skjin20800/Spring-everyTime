package com.everytime.project.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.everytime.project.domain.board.Board;
import com.everytime.project.service.LikesService;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class BestBoardConfig {
	
	public final LikesService likesService;
	/*
	 * @Bean public List<Board> bestBoard(){ return likesService.베스트게시글(); }
	 */

}
